use strict;
use warnings;
use Test::Base;
use Games::Go::Play;

my $go = Games::Go::Play->new('19');
sub hit {
    $go->hit($_[0]);
    $go->show;
}


plan tests     => 1 * blocks;
run_is 'input' => 'expected';

__END__
=== Simple hit Test1
--- input eval hit
[2,3]
--- expected
     1 2 3 4 5 6 7 8 910111213141516171819
                                        
 1   + + + + + + + + + + + + + + + + + + +
 2   + + + + + + + + + + + + + + + + + + +
 3   + * + + + + + + + + + + + + + + + + +
 4   + + + + + + + + + + + + + + + + + + +
 5   + + + + + + + + + + + + + + + + + + +
 6   + + + + + + + + + + + + + + + + + + +
 7   + + + + + + + + + + + + + + + + + + +
 8   + + + + + + + + + + + + + + + + + + +
 9   + + + + + + + + + + + + + + + + + + +
10   + + + + + + + + + + + + + + + + + + +
11   + + + + + + + + + + + + + + + + + + +
12   + + + + + + + + + + + + + + + + + + +
13   + + + + + + + + + + + + + + + + + + +
14   + + + + + + + + + + + + + + + + + + +
15   + + + + + + + + + + + + + + + + + + +
16   + + + + + + + + + + + + + + + + + + +
17   + + + + + + + + + + + + + + + + + + +
18   + + + + + + + + + + + + + + + + + + +
19   + + + + + + + + + + + + + + + + + + +
=== Simple hit Test2
--- input eval hit
[1,1]
--- expected
     1 2 3 4 5 6 7 8 910111213141516171819
                                        
 1   o + + + + + + + + + + + + + + + + + +
 2   + + + + + + + + + + + + + + + + + + +
 3   + * + + + + + + + + + + + + + + + + +
 4   + + + + + + + + + + + + + + + + + + +
 5   + + + + + + + + + + + + + + + + + + +
 6   + + + + + + + + + + + + + + + + + + +
 7   + + + + + + + + + + + + + + + + + + +
 8   + + + + + + + + + + + + + + + + + + +
 9   + + + + + + + + + + + + + + + + + + +
10   + + + + + + + + + + + + + + + + + + +
11   + + + + + + + + + + + + + + + + + + +
12   + + + + + + + + + + + + + + + + + + +
13   + + + + + + + + + + + + + + + + + + +
14   + + + + + + + + + + + + + + + + + + +
15   + + + + + + + + + + + + + + + + + + +
16   + + + + + + + + + + + + + + + + + + +
17   + + + + + + + + + + + + + + + + + + +
18   + + + + + + + + + + + + + + + + + + +
19   + + + + + + + + + + + + + + + + + + +
