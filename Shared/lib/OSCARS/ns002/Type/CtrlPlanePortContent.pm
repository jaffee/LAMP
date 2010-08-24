
#PASTOR: Code generated by XML::Pastor/1.0.3 at 'Wed Jul  1 15:32:04 2009'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package OSCARS::ns002::Type::CtrlPlanePortContent;

use OSCARS::ns002::Type::CtrlPlaneLinkContent;
use OSCARS::ns002::Type::Lifetime;
use OSCARS::ns002::link;

our @ISA=qw(XML::Pastor::ComplexType);

OSCARS::ns002::Type::CtrlPlanePortContent->mk_accessors( qw(_id lifetime capacity maximumReservableCapacity minimumReservableCapacity granularity unreservedCapacity link));

# Attribute accessor aliases

sub id { &_id; }

OSCARS::ns002::Type::CtrlPlanePortContent->XmlSchemaType( bless( {
                 'attributeInfo' => {
                                    'id' => bless( {
                                                   'class' => 'XML::Pastor::Builtin::string',
                                                   'metaClass' => 'OSCARS::Pastor::Meta',
                                                   'name' => 'id',
                                                   'scope' => 'local',
                                                   'targetNamespace' => 'http://ogf.org/schema/network/topology/ctrlPlane/20080828/',
                                                   'type' => 'string|http://www.w3.org/2001/XMLSchema',
                                                   'use' => 'required'
                                                 }, 'XML::Pastor::Schema::Attribute' )
                                  },
                 'attributePrefix' => '_',
                 'attributes' => [
                                   'id'
                                 ],
                 'baseClasses' => [
                                    'XML::Pastor::ComplexType'
                                  ],
                 'class' => 'OSCARS::ns002::Type::CtrlPlanePortContent',
                 'contentType' => 'complex',
                 'elementInfo' => {
                                  'capacity' => bless( {
                                                       'class' => 'XML::Pastor::Builtin::string',
                                                       'metaClass' => 'OSCARS::Pastor::Meta',
                                                       'minOccurs' => '0',
                                                       'name' => 'capacity',
                                                       'scope' => 'local',
                                                       'targetNamespace' => 'http://ogf.org/schema/network/topology/ctrlPlane/20080828/',
                                                       'type' => 'string|http://www.w3.org/2001/XMLSchema'
                                                     }, 'XML::Pastor::Schema::Element' ),
                                  'granularity' => bless( {
                                                          'class' => 'XML::Pastor::Builtin::string',
                                                          'metaClass' => 'OSCARS::Pastor::Meta',
                                                          'minOccurs' => '0',
                                                          'name' => 'granularity',
                                                          'scope' => 'local',
                                                          'targetNamespace' => 'http://ogf.org/schema/network/topology/ctrlPlane/20080828/',
                                                          'type' => 'string|http://www.w3.org/2001/XMLSchema'
                                                        }, 'XML::Pastor::Schema::Element' ),
                                  'lifetime' => bless( {
                                                       'class' => 'OSCARS::ns002::Type::Lifetime',
                                                       'maxOccurs' => '1',
                                                       'metaClass' => 'OSCARS::Pastor::Meta',
                                                       'minOccurs' => '0',
                                                       'name' => 'lifetime',
                                                       'scope' => 'local',
                                                       'targetNamespace' => 'http://ogf.org/schema/network/topology/ctrlPlane/20080828/',
                                                       'type' => 'Lifetime|http://ogf.org/schema/network/topology/ctrlPlane/20080828/'
                                                     }, 'XML::Pastor::Schema::Element' ),
                                  'link' => bless( {
                                                   'class' => 'OSCARS::ns002::Type::CtrlPlaneLinkContent',
                                                   'definition' => bless( {
                                                                            'baseClasses' => [
                                                                                               'OSCARS::ns002::Type::CtrlPlaneLinkContent',
                                                                                               'XML::Pastor::Element'
                                                                                             ],
                                                                            'class' => 'OSCARS::ns002::link',
                                                                            'isRedefinable' => 1,
                                                                            'metaClass' => 'OSCARS::Pastor::Meta',
                                                                            'name' => 'link',
                                                                            'scope' => 'global',
                                                                            'targetNamespace' => 'http://ogf.org/schema/network/topology/ctrlPlane/20080828/',
                                                                            'type' => 'CtrlPlaneLinkContent|http://ogf.org/schema/network/topology/ctrlPlane/20080828/'
                                                                          }, 'XML::Pastor::Schema::Element' ),
                                                   'maxOccurs' => 'unbounded',
                                                   'metaClass' => 'OSCARS::Pastor::Meta',
                                                   'minOccurs' => '0',
                                                   'name' => 'link',
                                                   'nameIsAutoGenerated' => 1,
                                                   'ref' => 'link|http://ogf.org/schema/network/topology/ctrlPlane/20080828/',
                                                   'scope' => 'local',
                                                   'targetNamespace' => 'http://ogf.org/schema/network/topology/ctrlPlane/20080828/'
                                                 }, 'XML::Pastor::Schema::Element' ),
                                  'maximumReservableCapacity' => bless( {
                                                                        'class' => 'XML::Pastor::Builtin::string',
                                                                        'metaClass' => 'OSCARS::Pastor::Meta',
                                                                        'minOccurs' => '0',
                                                                        'name' => 'maximumReservableCapacity',
                                                                        'scope' => 'local',
                                                                        'targetNamespace' => 'http://ogf.org/schema/network/topology/ctrlPlane/20080828/',
                                                                        'type' => 'string|http://www.w3.org/2001/XMLSchema'
                                                                      }, 'XML::Pastor::Schema::Element' ),
                                  'minimumReservableCapacity' => bless( {
                                                                        'class' => 'XML::Pastor::Builtin::string',
                                                                        'metaClass' => 'OSCARS::Pastor::Meta',
                                                                        'minOccurs' => '0',
                                                                        'name' => 'minimumReservableCapacity',
                                                                        'scope' => 'local',
                                                                        'targetNamespace' => 'http://ogf.org/schema/network/topology/ctrlPlane/20080828/',
                                                                        'type' => 'string|http://www.w3.org/2001/XMLSchema'
                                                                      }, 'XML::Pastor::Schema::Element' ),
                                  'unreservedCapacity' => bless( {
                                                                 'class' => 'XML::Pastor::Builtin::string',
                                                                 'metaClass' => 'OSCARS::Pastor::Meta',
                                                                 'minOccurs' => '0',
                                                                 'name' => 'unreservedCapacity',
                                                                 'scope' => 'local',
                                                                 'targetNamespace' => 'http://ogf.org/schema/network/topology/ctrlPlane/20080828/',
                                                                 'type' => 'string|http://www.w3.org/2001/XMLSchema'
                                                               }, 'XML::Pastor::Schema::Element' )
                                },
                 'elements' => [
                                 'lifetime',
                                 'capacity',
                                 'maximumReservableCapacity',
                                 'minimumReservableCapacity',
                                 'granularity',
                                 'unreservedCapacity',
                                 'link'
                               ],
                 'isRedefinable' => 1,
                 'metaClass' => 'OSCARS::Pastor::Meta',
                 'name' => 'CtrlPlanePortContent',
                 'scope' => 'global',
                 'targetNamespace' => 'http://ogf.org/schema/network/topology/ctrlPlane/20080828/'
               }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<OSCARS::ns002::Type::CtrlPlanePortContent>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.3 at 'Wed Jul  1 15:32:04 2009'


=head1 ATTRIBUTE ACCESSORS

=over

=item B<_id>(), B<id>()      - See L<XML::Pastor::Builtin::string>.

=back


=head1 CHILD ELEMENT ACCESSORS

=over

=item B<capacity>()      - See L<XML::Pastor::Builtin::string>.

=item B<granularity>()      - See L<XML::Pastor::Builtin::string>.

=item B<lifetime>()      - See L<OSCARS::ns002::Type::Lifetime>.

=item B<link>()      - See L<OSCARS::ns002::Type::CtrlPlaneLinkContent>.

=item B<maximumReservableCapacity>()      - See L<XML::Pastor::Builtin::string>.

=item B<minimumReservableCapacity>()      - See L<XML::Pastor::Builtin::string>.

=item B<unreservedCapacity>()      - See L<XML::Pastor::Builtin::string>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
