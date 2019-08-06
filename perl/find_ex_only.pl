#!/usr/bin/env perl
use 5.12.0;

use utf8;
use open ':std', ':encoding(UTF-8)';

use Socket qw(:DEFAULT :crlf);
use Data::Dump qw(dump);

my $infile_data_path = 'elementary_school.txt';
my $infile_src_path  = 'elementary_school_src.txt';
my $out_file_path    = 'elementary_school_done.txt';

open (my $fh_in_data, '<', $infile_data_path) or die $!;
open (my $fh_in_src,  '<', $infile_src_path)  or die $!;
open (my $fh_out,     '>', $out_file_path)    or die $!;

my $words = { };

# 先把源词读取出来
while (<$fh_in_src>) {
    chomp;

    my ($word, $pos, $meaning, $ex_en, $ex_zh) = split /\s*\t\s*/;

    $words->{$word} = {
        word    => $word,
        pos     => $pos,
        meaning => $meaning,
        ex_en   => $ex_en,
        ex_zh   => $ex_zh,
    };
}

close $fh_in_src;

while (<$fh_in_data>) {
    chomp;

    my ($grade, $word, $meaning, $bre, $ame) = split /\s*\t\s*/;
    my $ex_en = $words->{$word}->{ex_en} || '';
    my $ex_zh = $words->{$word}->{ex_zh} || '';

    my $out = $grade . "\t" . $word . "\t" . $meaning . "\t" . $bre . "\t" . $ame . "\t" . $ex_en . "\t" . $ex_zh;
    $out .= "$CRLF";

    print $fh_out $out;
}

close $fh_in_data;
close $fh_out;

__DATA__
