#!/usr/bin/env perl

=head1 A simple plot

plot the function y = sin^2(x) for −2π ≤ x ≤ 2π.

=head2 Plotting

Python uses pyplot.  Both Perl and PDL have many options.
The Perl example uses the Javascript library, Plotly,
which will open up in your browser.

=head2 PDL

PDL does vectorizing so compare with the second code example
that uses Numpy.

=cut

use warnings;
use strict;
use Math::Trig ':pi';
use Chart::Plotly 'show_plot';

my ($xmin, $xmax) = (-2 * pi, 2 * pi);
my $n = 1000;
my (@x, @y);
my $dx = ($xmax - $xmin)/($n - 1);
for my $i (1 .. $n) {
    my $xpt = $xmin + $i * $dx;
    $x[$i] = $xpt;
    $y[$i] = sin($xpt)**2;
}

my $data = { x => \@x, y => \@y };
show_plot([$data]);

use PDL;
use PDL::Graphics::Gnuplot;

my $x = zeroes($n)->xlinvals($xmin, $xmax);
my $y = sin($x)**2;

gplot( $x, $y );
# or save a step just use gplot( $x, sin($x)**2 );
