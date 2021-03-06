use warnings;
use strict;    
use Test::More 'no_plan';
use Data::Dumper;
use English qw( -no_match_vars);
use FreezeThaw qw(cmpStr);
use Log::Log4perl;
use_ok('perfSONAR_PS::Datatypes::v2_0::pingertopo::Topology::Domain::Node::Test');
use    perfSONAR_PS::Datatypes::v2_0::pingertopo::Topology::Domain::Node::Test;
Log::Log4perl->init("logger.conf"); 

my $obj1 = undef;
#2
eval {
$obj1 = perfSONAR_PS::Datatypes::v2_0::pingertopo::Topology::Domain::Node::Test->new({
  'id' =>  'value_id',})
};
  ok( $obj1  && !$EVAL_ERROR , "Create object perfSONAR_PS::Datatypes::v2_0::pingertopo::Topology::Domain::Node::Test..." . $EVAL_ERROR);
  $EVAL_ERROR = undef; 
#3
 my $ns  =  $obj1->nsmap->mapname('test');
 ok($ns  eq 'pingertopo', "  mapname('test')...  ");
#4
 my $id  =  $obj1->id;
 ok($id  eq 'value_id', " checking accessor  obj1->id ...  ");
#5
 my $string = undef;
 eval {
      $string =  $obj1->asString 
 };
 ok($string   && !$EVAL_ERROR  , "  Converting to string XML:   $string " . $EVAL_ERROR);
 $EVAL_ERROR = undef;
#6
 my $obj22 = undef; 
 eval {
    $obj22   =   perfSONAR_PS::Datatypes::v2_0::pingertopo::Topology::Domain::Node::Test->new({xml => $string});
 };
 ok( $obj22  && !$EVAL_ERROR , "  re-create object from XML string:  ".   $EVAL_ERROR);
 $EVAL_ERROR = undef;
#7
 my $dom1 = $obj1->getDOM();
 my $obj2 = undef; 
 eval {
    $obj2   =   perfSONAR_PS::Datatypes::v2_0::pingertopo::Topology::Domain::Node::Test->new($dom1);
 };
 ok( $obj2  && !$EVAL_ERROR , "  re-create object from DOM XML:  ".   $EVAL_ERROR);
 $EVAL_ERROR = undef;
