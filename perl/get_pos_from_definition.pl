#!/usr/bin/env perl
use v5.12;

use strict;
use warnings qw( all );

use utf8;
use open ':std', ':encoding(UTF-8)';

my $infile  = 'pos_in.txt';
my $outfile = 'pos_out.txt';

open(my $fh_in,  '<', $infile)  or die $!;
open(my $fh_out, '>', $outfile) or die $!;

while ( <$fh_in> ) {
    s/^\x{FEFF}//; # remove bom
    s/\r?\n//;
    
    chomp;
    
    my $definition = $_;
    
    my @pos_list = ();
    
    my $new_def = $definition;
    
    push @pos_list, 'aux. v.' if $new_def =~ /aux\.? v\./ || $new_def =~ /v\. aux\./;
    $new_def =~ s/aux\.? v\.//g;
    $new_def =~ s/v\. aux\.//g;
    
    push @pos_list, 'modal v.' if $new_def =~ /modal v\./;
    $new_def =~ s/modal v\.//g;
    
    push @pos_list, 'linking v.' if $new_def =~ /linking v\./;
    $new_def =~ s/linking v\.//g;
    
    my @new_pos_list = $new_def =~ /[a-z]+\./g;
    @new_pos_list = grep { $_ ne 'pl.' } @new_pos_list;
    my @pos_list_res = (@pos_list, @new_pos_list);
    
    @pos_list_res = map { $_ =~ s/excl\./exclam\./g;       $_ } @pos_list_res;
    @pos_list_res = map { $_ =~ s/int\./interj\./g;        $_ } @pos_list_res;
    @pos_list_res = map { $_ =~ s/aux\s+v\./aux\. v\./g;   $_ } @pos_list_res;
    @pos_list_res = map { $_ =~ s/v\.\s+aux\./aux\. v\./g; $_ } @pos_list_res;
    
    my @pos_list_str = join ', ', @pos_list_res;
    
    my $main_pos = '';
    $main_pos = $pos_list_res[0] if scalar @pos_list_res;
    
    print $fh_out $definition, "\t", $main_pos, "\t", @pos_list_str, "\t", scalar @pos_list_res, "\n";
}

close $fh_in;
close $fh_out;

say 'DONE';
