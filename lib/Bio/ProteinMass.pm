#! /usr/bin/perl

use strict;
use warnings;
use Cwd qw(getcwd);

use Data::Dumper;
use Math::Round qw(nearest);

# ABSTRACT: Script to calculate mass of protein strings

our %amino_acid_table = (
    A =>  71.03711,
    C =>  103.00919,
    D =>  115.02694,
    E =>  129.04259,
    F =>  147.06841,
    G =>  57.02146,
    H =>  137.05891,
    I =>  113.08406,
    K =>  128.09496,
    L =>  113.08406,
    M =>  131.04049,
    N =>  114.04293,
    P =>  97.05276,
    Q =>  128.05858,
    R =>  156.10111,
    S =>  87.03203,
    T =>  101.04768,
    V =>  99.06841,
    W =>  186.07931,
    Y =>  163.06333,
);

sub calc_protein_mass {
    my $file = $_[0];
    my $mass;
    my @amino_acids;

    open ( my $fh, '<', $file ) or die "Could not open file $file: $!\n";

    while ( my $string = <$fh> ) {
        @amino_acids = $string  =~ /(\w{1})/g;
    }
    foreach my $letter ( @amino_acids ) {
        if ( exists $amino_acid_table{$letter} ) {
                $mass += $amino_acid_table{$letter};
        }
    }
    return nearest(.001, $mass); #round to 1000th decimal place
}

1;
