use 5.12.0;

use utf8;
use open ':std', ':encoding(UTF-8)';

use Data::Dump qw(dump);

my $infile_data_path = 'find_ex_data.txt';
my $infile_src_path  = 'find_ex_src.txt';

open (my $fh_in_data, '<', $infile_data_path) or die $!;
open (my $fh_in_src,  '<', $infile_src_path)  or die $!;

my $words = { };

# 先把源词读取出来
while (<$fh_in_src>) {
    chomp;

    my ($no, $word, $ex_en, $ex_zh) = split /\t/;

    $words->{$word} = {
        no     => $no,
        ex_en  => $ex_en,
        ex_zh  => $ex_zh,
    };
}

close $fh_in_src;

# say dump(%$words);

my $regex_pos = qr/(n|pron|adj|adv|vi|vt|v|abbr|)[.．]/;

while (<$fh_in_data>) {
    chomp;

    my ($no, $word, $pos, $meaning, $ex_en, $ex_zh) = split /\t/;

    if (!$pos) {
        if ($meaning =~ /$regex_pos/) {
            my @pos = ( $meaning =~ /$regex_pos/g );

            $meaning =~ s/$regex_pos//g;
            $meaning =~ s/\s*&\s*//g;
            $meaning =~ s/\s*$//g;
            $meaning =~ s/^\s*//g;

            if (scalar(@pos)) {
                foreach my $p (@pos) {
                    $p .= ".";
                }

                $pos = join "/ ", @pos;
            }

        }
    }

    if (!$ex_en || !$ex_zh) {
        if (exists $words->{$word}) {
            $ex_en = $words->{$word}->{ex_en};
            $ex_zh = $words->{$word}->{ex_zh};
        }
    }

    #say $no, "\t", $word;
    say $no, "\t", $word, "\t", $pos, "\t", $meaning, "\t", $ex_en, "\t", $ex_zh;

}

close $fh_in_data;

__DATA__
