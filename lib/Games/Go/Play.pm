package Games::Go::Play;

use warnings;
use strict;
use Carp;
use YAML::Syck;
use Data::Dumper;

# use Games::Go::Coordinate;
use version; our $VERSION = qv('0.0.1');

use base qw/Class::Accessor::Fast/;
__PACKAGE__->mk_accessors(qw(space black white out pass));

our $B_SIZE = 19;
our $SPACE  = '0';
our $BLACK  = '1';
our $WHITE  = '2';
our $OUT    = '9';

sub new {
    my ( $class, $size ) = @_;
    $size ||= $B_SIZE;
    my $self = {
        'size'  => $size,
        'board' => [],
        'teban' => $BLACK,
        'black' => {
            'agehama' => 0,
            'ji'      => 0,
        },
        'white' => {
            'agehama' => 0,
            'ji'      => 0,
        },
        'pass' => 0,
    };

    # my $c1 = Games::Go::Coordinate->new( x => 4, y => 3 );
    # my $c2 = Games::Go::Coordinate->new( x => 4, y => 10 );
    # print $c1;
    # print $c2;
    bless $self, $class;
    $self->{'board'} = $self->init();
    return $self;
}

sub init {
    my ($self) = @_;
    my @board;
    for ( my $i = 0 ; $i <= $self->{'size'} ; $i++ ) {
        $board[0][$i] = $OUT;
        $board[$i][0] = $OUT;
    }
    for ( my $i = 1 ; $i <= $self->{'size'} ; $i++ ) {
        for ( my $j = 1 ; $j <= $self->{'size'} ; $j++ ) {
            $board[$i][$j] = $SPACE;
        }
    }
    $self->{'board'} = \@board;
    return \@board;
}

sub show {
    my ($self) = @_;
    my $board = "    ";
    my $symbol = {
        $BLACK => ' *',
        $WHITE => ' o',
        $SPACE => ' +',
        $OUT   => '  ',
    };
    for ( my $x = 1 ; $x <= $self->{'size'} ; $x++ ) {
        $board .= sprintf( "% 2s", $x );
    }
    $board .= "\n";
    my $i = 0;
    foreach my $x ( @{ $self->{'board'} } ) {
        $board .= sprintf( "% 2s", $i ) if ($i);
        foreach ( @{$x} ) {
            $board .= $symbol->{$_};
        }
        $board .= "\n";
        $i++;
    }
    return $board;
}

sub hit {
    my ( $self, $points, $symbol ) = @_;
    $symbol ||= $self->{'teban'};
    unless ( $self->can_hit( $points, $symbol ) ) {
        return;
    }
    $self->{'pass'} = 0;
    $self->{'board'}[ $points->[1] ][ $points->[0] ] = $symbol;
    $self->{'teban'} = $self->other_side( $self->{'teban'} );
}

sub can_hit {
    my ( $self, $points, $symbol ) = @_;
    return 0 unless ( $self->_is_in_board($points) );
    return 0 unless ( $self->_is_space($points) );
    return 1;
}

sub _is_space {
    my ( $self, $points ) = @_;
    if ( $self->{'board'}[ $points->[1] ][ $points->[0] ] eq $SPACE ) {
        return 1;
    }
    return 0;
}

sub _is_in_board {
    my ( $self, $points ) = @_;
    if ( $points->[0] <= $self->{'size'} && $points->[1] <= $self->{'size'} ) {
        return 1;
    }
    return 0;
}

sub pass {
    my ($self) = @_;
    $self->{'pass'}++;
    if ( $self->{'pass'} >= '2' ) {
        $self->end;
        return;
    }
    $self->{'teban'} = $self->other_side( $self->{'teban'} );
}

sub other_side {
    my ( $self, $symbol ) = @_;
    return ( $symbol eq $BLACK ) ? $WHITE : $BLACK;
}

sub end {
    my ($self) = @_;
    print "[TODO] end.\n";
}

1;
__END__

=head1 NAME

Games::Go::Play - Play 'go' on Perl.


=head1 VERSION

This document describes Games::Go::Play version 0.0.1


=head1 SYNOPSIS

    use Games::Go::Play;
    my $go = Games::Go::Play->new('19');
    $go->hit([2,3]);
    $go->hit([3,3]);
    $go->hit([3,4]);
    $go->show;

=head1 DESCRIPTION

This module make you to be able to play 'go' on perl.

# 	

=head2 Methods
=over
=item new
new Constructor of play field(board).
=item init
Initialize play field(board).
=item hit
Do one action(itte utu).
=item pass
Pass.
=item resign
Resign the game.
=item can_hit
Check to be able to hit the point.
=item other_side
return next player.
=item show
Show play field.
=item end
End the game.
=back

=head1 AUTHOR

Junichiro Tobe  C<< <junichiro.tobe@gmail.com> >>


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2007, Junichiro Tobe C<< <junichiro.tobe@gmail.com> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.
