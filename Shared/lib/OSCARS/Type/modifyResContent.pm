
#PASTOR: Code generated by XML::Pastor/1.0.3 at 'Wed Jul  1 15:32:04 2009'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package OSCARS::Type::modifyResContent;

use OSCARS::Type::pathInfo;

our @ISA=qw(XML::Pastor::ComplexType);

OSCARS::Type::modifyResContent->mk_accessors( qw(globalReservationId startTime endTime bandwidth description pathInfo));

OSCARS::Type::modifyResContent->XmlSchemaType( bless( {
                 'attributeInfo' => {},
                 'attributePrefix' => '_',
                 'attributes' => [],
                 'baseClasses' => [
                                    'XML::Pastor::ComplexType'
                                  ],
                 'class' => 'OSCARS::Type::modifyResContent',
                 'contentType' => 'complex',
                 'elementInfo' => {
                                  'bandwidth' => bless( {
                                                        'class' => 'XML::Pastor::Builtin::int',
                                                        'metaClass' => 'OSCARS::Pastor::Meta',
                                                        'name' => 'bandwidth',
                                                        'scope' => 'local',
                                                        'targetNamespace' => 'http://oscars.es.net/OSCARS',
                                                        'type' => 'int|http://www.w3.org/2001/XMLSchema'
                                                      }, 'XML::Pastor::Schema::Element' ),
                                  'description' => bless( {
                                                          'class' => 'XML::Pastor::Builtin::string',
                                                          'metaClass' => 'OSCARS::Pastor::Meta',
                                                          'name' => 'description',
                                                          'scope' => 'local',
                                                          'targetNamespace' => 'http://oscars.es.net/OSCARS',
                                                          'type' => 'string|http://www.w3.org/2001/XMLSchema'
                                                        }, 'XML::Pastor::Schema::Element' ),
                                  'endTime' => bless( {
                                                      'class' => 'XML::Pastor::Builtin::long',
                                                      'metaClass' => 'OSCARS::Pastor::Meta',
                                                      'name' => 'endTime',
                                                      'scope' => 'local',
                                                      'targetNamespace' => 'http://oscars.es.net/OSCARS',
                                                      'type' => 'long|http://www.w3.org/2001/XMLSchema'
                                                    }, 'XML::Pastor::Schema::Element' ),
                                  'globalReservationId' => bless( {
                                                                  'class' => 'XML::Pastor::Builtin::string',
                                                                  'maxOccurs' => '1',
                                                                  'metaClass' => 'OSCARS::Pastor::Meta',
                                                                  'minOccurs' => '1',
                                                                  'name' => 'globalReservationId',
                                                                  'scope' => 'local',
                                                                  'targetNamespace' => 'http://oscars.es.net/OSCARS',
                                                                  'type' => 'string|http://www.w3.org/2001/XMLSchema'
                                                                }, 'XML::Pastor::Schema::Element' ),
                                  'pathInfo' => bless( {
                                                       'class' => 'OSCARS::Type::pathInfo',
                                                       'maxOccurs' => '1',
                                                       'metaClass' => 'OSCARS::Pastor::Meta',
                                                       'minOccurs' => '0',
                                                       'name' => 'pathInfo',
                                                       'scope' => 'local',
                                                       'targetNamespace' => 'http://oscars.es.net/OSCARS',
                                                       'type' => 'pathInfo|http://oscars.es.net/OSCARS'
                                                     }, 'XML::Pastor::Schema::Element' ),
                                  'startTime' => bless( {
                                                        'class' => 'XML::Pastor::Builtin::long',
                                                        'metaClass' => 'OSCARS::Pastor::Meta',
                                                        'name' => 'startTime',
                                                        'scope' => 'local',
                                                        'targetNamespace' => 'http://oscars.es.net/OSCARS',
                                                        'type' => 'long|http://www.w3.org/2001/XMLSchema'
                                                      }, 'XML::Pastor::Schema::Element' )
                                },
                 'elements' => [
                                 'globalReservationId',
                                 'startTime',
                                 'endTime',
                                 'bandwidth',
                                 'description',
                                 'pathInfo'
                               ],
                 'isRedefinable' => 1,
                 'metaClass' => 'OSCARS::Pastor::Meta',
                 'name' => 'modifyResContent',
                 'scope' => 'global',
                 'targetNamespace' => 'http://oscars.es.net/OSCARS'
               }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<OSCARS::Type::modifyResContent>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.3 at 'Wed Jul  1 15:32:04 2009'


=head1 CHILD ELEMENT ACCESSORS

=over

=item B<bandwidth>()      - See L<XML::Pastor::Builtin::int>.

=item B<description>()      - See L<XML::Pastor::Builtin::string>.

=item B<endTime>()      - See L<XML::Pastor::Builtin::long>.

=item B<globalReservationId>()      - See L<XML::Pastor::Builtin::string>.

=item B<pathInfo>()      - See L<OSCARS::Type::pathInfo>.

=item B<startTime>()      - See L<XML::Pastor::Builtin::long>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
