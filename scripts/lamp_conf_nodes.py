#some of this is adapted from INSTOOLS code in emulab-contrib repository, their license is as follows:
# -----------------------------------------------------------------------------
#
# Copyright (c) 2010 University of Kentucky
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and/or hardware specification (the "Work") to deal in the
# Work without restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Work, and to permit persons to whom the Work is furnished to do so,
# subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Work.

# THE WORK IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE WORK OR THE USE OR OTHER DEALINGS IN THE WORK.
#
# -----------------------------------------------------------------------------


import subprocess
import xml.dom.minidom

ssh = 'ssh'
scp = 'scp'

def get_userURN (credential):
    doc = xml.dom.minidom.parseString( credential )
    urns = doc.getElementsByTagName('owner_urn')
    return str(urns[0].childNodes[0].data)

def get_username (credential):
    doc = xml.dom.minidom.parseString( credential )
    urns = doc.getElementsByTagName('owner_urn')
    user_urn = str(urns[0].childNodes[0].data)
    breaks = user_urn.split("+")
    username = breaks[-1]
    return username

def do_ssh(username, host, command, options):
    args = [ssh]
    args.extend(options.split())
    args.append(username + '@' + host)
    args.append('\'' + command + '\'')
    print joinfields(args, ' ')
    args = args[:-1]
    args.append(command)
    proc = subprocess.Popen(args, stdout=subprocess.PIPE,stderr=subprocess.PIPE,)
    a = proc.communicate()
    print a
    return a

def do_scp_to(username, host, local_file, remote_loc, options):
    args = [scp]
    args.extend(options.split())
    args.append(local_file)
    args.append(username + '@' + host + ':' + remote_loc)
    print joinfields(args, ' ')
    proc = subprocess.Popen(args, stdout=subprocess.PIPE,stderr=subprocess.PIPE,)
    a = proc.communicate()
    print a
    return a

def get_hosts(manifest):
    hosts = []
    doc = xml.dom.minidom.parseString(str(manifest))
    for login in doc.getElementsByTagName("login"):
        hosts.append(str(login.getAttribute("hostname")))
    return hosts

def joinfields(l, sep):
    ans = ''
    for item in l:
        ans += str(item) + ' '
    ans = ans[:-1]
    return ans
