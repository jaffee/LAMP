#!/usr/bin/python

# Run this program with the slice name of a slice that is already created
# and has resources allocated to it. At the time of writing (Jan 2012) we
# we require that those resources are running the UBUNTU91-LAMP image,
# though this will change over the next few months.
#
# This script will get the manifest and slice credential for your slice,
# send the manifest to UNIS, which is the topology/information
# configuration service, and get a certificate back which your nodes will
# use to authenticate to UNIS and configure themselves.

#
# GENIPUBLIC-COPYRIGHT
# Copyright (c) 2008-2011 University of Utah and the Flux Group.
# All rights reserved.
#
# Permission to use, copy, modify and distribute this software is hereby
# granted provided that (1) source code retains these copyright, permission,
# and disclaimer notices, and (2) redistributions including binaries
# reproduce the notices in supporting documentation.
#
# THE UNIVERSITY OF UTAH ALLOWS FREE USE OF THIS SOFTWARE IN ITS "AS IS"
# CONDITION.  THE UNIVERSITY OF UTAH DISCLAIMS ANY LIABILITY OF ANY KIND
# FOR ANY DAMAGES WHATSOEVER RESULTING FROM THE USE OF THIS SOFTWARE.
#

import sys
import pwd
import getopt
import os
import re
import xmlrpclib
from M2Crypto import X509
import time
import ast

from lampsendmanifest import *
import lamp_conf_nodes as lcn

ACCEPTSLICENAME=1

sliver_poll_interval=45

node_lampcert_loc='/usr/local/etc/protogeni/ssl/lampcert.pem'

execfile( "test-common.py" )

mycredential = get_self_credential()
#
# Lookup slice.
#
#myslice = resolve_slice( SLICENAME, mycredential )
params = {}
params["credential"] = mycredential
params["type"]       = "Slice"
params["hrn"]        = SLICENAME
print "Looking up slice...."
rval,response = do_method("sa", "Resolve", params)
if rval:
    Fatal("No such slice at SA")
    pass
else:
    myslice = response["value"]
    print "getting slice credential"
    slicecredential = get_slice_credential( myslice, mycredential )


params = {}
params["credentials"] = (slicecredential,)
params["urn"]         = myslice["urn"]

print "Resolve with slice credential and slice URN"
rval,response = do_method("cm", "Resolve", params, version="2.0")
if rval:
    Fatal("Could not get resolve slice")
    pass
myslice = response["value"]


#
# Do a resolve to get the manifest urn.
#
print "Resolving sliver URN to get manifest...."
params = {}
params["credentials"] = (slicecredential,)
params["urn"]         = myslice["sliver_urn"]
rval,response = do_method("cm", "Resolve", params, version="2.0")
if rval:
    Fatal("Could not get resolve slice")
    pass
mysliver = response["value"]
manifest = mysliver["manifest"]

#do lamp-sendmanifest
print "Converting and sending manifest to UNIS...."
credential_xml = str(slicecredential)
credential_xml = credential_xml[credential_xml.index('\n')+1:] #remove first line
send_response = do_sendmanifest(str(manifest), SLICEURN, credential_xml)
print send_response
if send_response.index("success.ma.replaced"):
    print "Manifest sending successful!"
else:
    print "Problem sending manifest - see output above"
    exit(2)

#
#get the lamp certificate
#
print "Getting lamp certificate...."
lampca = "https://blackseal.damsl.cis.udel.edu/protogeni/xmlrpc/lampca"
params = {}
params["credential"] = (slicecredential,)
rval,response = do_method("lamp", "GetLAMPSliceCertificate", params, URI=lampca)
if rval:
    Fatal("Could not get ticket: " + response)
    pass

lampcert = str(response["value"])

    #filename is lampcertDATEANDTIME.pem
lampcertfilename = "lampcert" + time.asctime().replace(' ', '_').replace(':', '') + ".pem"
curdir = os.getcwd()
i=1
    #if the filename already exists, try adding a number at the beginning
while os.path.exists(curdir + '/' + lampcertfilename):
    lampcertfilename=str(i) + lampcertfilename[lampcertfilename.index('l'):]
    i+=1
lampcertfile = open(lampcertfilename, 'w')
lampcertfile.write(lampcert)
lampcertfile.flush()
os.fsync(lampcertfile.fileno())


#
#make sure nodes are up
#
print "Getting sliver status...."
params = {}
params["slice_urn"]   = SLICEURN
params["credentials"] = (slicecredential,)
rval,response = do_method("cm", "GetSliver", params, version="2.0")
if rval:
    Fatal("Could not get Sliver credential")
    pass
slivercred = response["value"]

params = {}
params["slice_urn"]   = SLICEURN
params["credentials"] = (slivercred,)
rval,response = do_method("cm", "SliverStatus", params, version="2.0")
if rval:
    Fatal("Could not get sliver status")
    pass
status = str(response["value"])
status = ast.literal_eval(status)
while status['status']!='ready':
    if status['error']:
        print "Error bringing up sliver:\n" + str(status)
        exit()
    print "Sliver not ready... waiting " + str(sliver_poll_interval) + " seconds"
    time.sleep(sliver_poll_interval)
    rval,response = do_method("cm", "SliverStatus", params, version="2.0")
    if rval:
        Fatal("Could not get sliver status")
        pass
    status = str(response["value"])
    status = ast.literal_eval(status)

#
#getcacerts upload to the nodes, and do whatever other config on nodes
#
print "Configuring nodes...."
options = '-o StrictHostKeyChecking=no'
username = lcn.get_username(mycredential)
userURN = lcn.get_userURN(mycredential)
hosts = lcn.get_hosts(manifest)
for host in hosts:
    lcn.do_scp_to(username, host, curdir + '/' + lampcertfilename, 'lampcert.pem', options)
    lcn.do_ssh(username, host, "sudo /usr/local/etc/protogeni/ssl/getcacerts", options)
    lcn.do_ssh(username, host, "sudo mv lampcert.pem " + node_lampcert_loc, options)
    lcn.do_ssh(username, host, "sudo chown root.perfsonar " + node_lampcert_loc, options)
    lcn.do_ssh(username, host, "sudo chmod 440 " + node_lampcert_loc, options)
    lcn.do_ssh(username, host, "sudo /usr/local/etc/lamp/bootstrap.sh " + SLICEURN + ' ' + userURN, options)
    lcn.do_ssh(username, host, "sudo /etc/init.d/psconfig restart", options)


