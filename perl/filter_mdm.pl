# filter_mdm.pl
use 5.30.0;

use utf8;
use open ':std', ':encoding(UTF-8)';

my $memcard_file = 'mdm_memcards.csv';

my $infile = $ARGV[0];

die 'Neet input file.' if !$infile;
die 'Input file not existed.' if !-e $infile;

open (my $fh_memcard_file, '<', $memcard_file)     or die $!;
open (my $fh_infile,       '<', $infile)           or die $!;
open (my $fh_outfile,      '>', 'DONE_' . $infile) or die $!;

my $memcards = {};

while (<$fh_memcard_file>) {
    chomp;
    $memcards->{$_} = 1;
}
close $memcard_file;

while (<$fh_infile>) {
    chomp;
    s/\.\d{6,},/,/;

    my $row     = $_;
    my $memcard = substr($row, 0, 32);

    if (exists $memcards->{$memcard}) {
        say $fh_outfile $row;
    }
}
close $fh_infile;
close $fh_outfile;
