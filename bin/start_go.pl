#!/usr/bin/perl

use FindBin;
use lib "$FindBin::Bin/../lib";
use strict;
use warnings;
use Config;
use Term::ReadLine;
use YAML::Syck;
use Games::Go::Play;
our $DEFAULT_SIZE = 19;
our $MIN          = 6;
our $MAX          = 19;

my ( @stack, $source );

my $size = process_args( $ARGV[0] )
  or die "Usage: start_go [num of board size($MIN - $MAX)]\n";

my $go   = Games::Go::Play->new($size);
my $term = Term::ReadLine->new("Go");

sub process_args {
    my $size = shift;

    if ( !($size) ) {
        return $DEFAULT_SIZE;
    }
    elsif ( $size =~ /^\d$/ && $size >= $MIN && $size <= $MAX ) {
        return $size;
    }
    return;
}
print $go->show;
my $play = run_loop( $go, $term );

sub run_loop {
    my ( $go, $term ) = @_;
    while ( defined( my $in = $term->readline("go> ") ) ) {
        if ( $in =~ m!^\s*(\d{1,2})\s*\,\s*(\d{1,2})\s*$! ) {
            if ( $go->hit( [ $1, $2 ] ) ) {
                print $go->show;
            }
            else {
                print "Can't hit this point!\n";
            }
        }
        elsif ( $in eq 's' || $in eq 'suggest' ) {

            # [TODO]suggest next action.
            print "3,4";    # dummy
            print "\n";     # dummy
        }
        elsif ( $in eq 'o' || $in eq 'other' ) {

            # [TODO]suggest next action and do this action.
            print "3,4";    # dummy
            $go->hit( [ 3, 4 ] );    # dummy
            print $go->show;
        }
        elsif ( $in eq 'p' ) {
            $go->pass;
        }
        elsif ( $in eq 'resign' ) {

            # [TODO]resign the game.
            return;
        }
        elsif ( $in eq 'g' ) {
            print $go->show;
        }
        elsif ( $in eq 'quit' ) {
            return;
        }
        elsif ( $in eq 'init' ) {
            $go->init;
        }
        else {
            print "Read help message!\n";
            print "[x_num, y_num] action\n";
            print "[s]            suggest\n";
            print "[o]            other side action\n";
            print "[quit]         quit this game\n";
            print "[resign]       resign this game\n";
            print "[g]            update board\n";
            print "[init]         initialize\n";
        }
    }
}
