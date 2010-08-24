
#PASTOR: Code generated by XML::Pastor/1.0.3 at 'Wed Jul  1 15:32:04 2009'

use utf8;
use strict;
use warnings;
no warnings qw(uninitialized);

use XML::Pastor;



#================================================================

package OSCARS::Type::getTopologyContent;


our @ISA=qw(XML::Pastor::ComplexType);

OSCARS::Type::getTopologyContent->mk_accessors( qw(topologyType));

OSCARS::Type::getTopologyContent->XmlSchemaType( bless( {
                 'attributeInfo' => {},
                 'attributePrefix' => '_',
                 'attributes' => [],
                 'baseClasses' => [
                                    'XML::Pastor::ComplexType'
                                  ],
                 'class' => 'OSCARS::Type::getTopologyContent',
                 'contentType' => 'complex',
                 'elementInfo' => {
                                  'topologyType' => bless( {
                                                           'class' => 'XML::Pastor::Builtin::string',
                                                           'metaClass' => 'OSCARS::Pastor::Meta',
                                                           'minOccurs' => '1',
                                                           'name' => 'topologyType',
                                                           'scope' => 'local',
                                                           'targetNamespace' => 'http://oscars.es.net/OSCARS',
                                                           'type' => 'string|http://www.w3.org/2001/XMLSchema'
                                                         }, 'XML::Pastor::Schema::Element' )
                                },
                 'elements' => [
                                 'topologyType'
                               ],
                 'isRedefinable' => 1,
                 'metaClass' => 'OSCARS::Pastor::Meta',
                 'name' => 'getTopologyContent',
                 'scope' => 'global',
                 'targetNamespace' => 'http://oscars.es.net/OSCARS'
               }, 'XML::Pastor::Schema::ComplexType' ) );

1;


__END__



=head1 NAME

B<OSCARS::Type::getTopologyContent>  -  A class generated by L<XML::Pastor> . 


=head1 ISA

This class descends from L<XML::Pastor::ComplexType>.


=head1 CODE GENERATION

This module was automatically generated by L<XML::Pastor> version 1.0.3 at 'Wed Jul  1 15:32:04 2009'


=head1 CHILD ELEMENT ACCESSORS

=over

=item B<topologyType>()      - See L<XML::Pastor::Builtin::string>.

=back


=head1 SEE ALSO

L<XML::Pastor::ComplexType>, L<XML::Pastor>, L<XML::Pastor::Type>, L<XML::Pastor::ComplexType>, L<XML::Pastor::SimpleType>


=cut
