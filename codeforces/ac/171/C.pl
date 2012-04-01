use strict;
use Acme::Chef;

undef($/);
my $code_string = <DATA>;

my $compiled = Acme::Chef->compile($code_string);
print $compiled->execute(), "\n\n";

my $string = $compiled->dump(); # requires Data::Dumper
#print "$string\n\n";
my $reconstructed_object = eval $string;

$string = $compiled->dump('autorun'); # requires Data::Dumper
#print "$string\n\n";
my $output_of_chef_program = eval $string;

__DATA__
Hello World Souffle.

Ingredients.
2 carrots
0 calories
100 g chocolate spread
1 pack of flour
1 egg

Method.
Put calories into the mixing bowl.
Take carrots from refrigerator.
Chop carrots.
Take chocolate spread from refrigerator.
Put chocolate spread into the mixing bowl.
Combine pack of flour into the mixing bowl.
Fold chocolate spread into the mixing bowl.
Add chocolate spread into the mixing bowl.
Put pack of flour into the mixing bowl.
Add egg into the mixing bowl.
Fold pack of flour into the mixing bowl.
Chop carrots until choped.
Pour contents of the mixing bowl into the baking dish.

Serves 1.
