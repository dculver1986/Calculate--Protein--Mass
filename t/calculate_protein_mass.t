#! /usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;
use Test::Most;
use Test::Exception;
use Cwd qw(getcwd);

use Bio::ProteinMass;

use Readonly;

Readonly my $TEST_DIR => getcwd;
Readonly my $CORRECT_PROTEIN_MASS_RESULT => 100466.674;

subtest "Calcuate Mass - Valid File - Valid Protein String" => sub {

    my $file = $TEST_DIR.'/t/protein.txt';
    my $protein_mass = calc_protein_mass($file);
    cmp_ok($protein_mass, '==', $CORRECT_PROTEIN_MASS_RESULT,
        'Correct protein mass calculated'
    );
};

done_testing;
