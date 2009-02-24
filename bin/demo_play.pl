#!/usr/bin/perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Games::Go::Play;

my $go = Games::Go::Play->new('19');
$go->hit([2,3]);
$go->hit([3,3]);
$go->hit([3,4]);
print $go->show;

exit;
