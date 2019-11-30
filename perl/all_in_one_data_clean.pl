use 5.12.0;

use utf8;
use open ':std', ':encoding(UTF-8)';

use Data::Dump qw(dump);

my $word_list_ref = { };

# 词性正则
my $regex_pos = qr/^(vt|vi|v|adv|n|pron|prep|det|excl|interj|int|conj|aux)\.\s*(.+)$/;

my $infile  = 'all_in_one_v3.txt';
my $outfile = 'all_in_one_v4.txt';

open(my $fh_in,  '<', $infile)  or die $!;
open(my $fh_out, '>', $outfile) or dir $!;

#while ( <DATA> ) {
while ( <$fh_in> ) {
    s/^\x{FEFF}//; # remove bom
    s/\r?\n//;

    chomp;

    my ($word, $meaning) = split /\t/;

    $word    = &prepare_word($word);
    $meaning = &prepare_meaning($meaning);

    #say $word, "\t", $meaning if $meaning =~ /[a-z]+\..*?\p{Han}+.*?[a-z]+\./;

    #say join('|||', split(/(?<![a-z&\(])(?=[a-z]+\.)/, $meaning));

    my $bare_word = $word;

    # TODO bare word

    $word_list_ref->{$bare_word}->{word} = $word;

    &prepare_word_n_meaning($word_list_ref->{$bare_word}, $meaning);

    #last if $. == 10;
}

close $fh_in;

#say dump(%$word_list_ref);

foreach my $key (sort keys %$word_list_ref) {
    my $result_meanings = '';

    my $meaning_ref = $word_list_ref->{$key}->{meaning};

    my $result = '';

    if ( %{ $meaning_ref } ) {

        foreach my $k (sort keys %{ $meaning_ref }) {
            my @meaning_array = &uniq( @{ $meaning_ref->{$k} } );

            if ($k eq '_NOPOS_') {
                $result .= ( join '，', @meaning_array ) . " ";
            } else {
                $result .= $k . " " . ( join '，', @meaning_array ) . " ";
            }
         }
    }

    $result_meanings .= $result;
    $result_meanings =~ s/[；，]$//g;
    $result_meanings =~ s/^[；，]//g;
    $result_meanings =~ s/\s+$//g;

    $word_list_ref->{$key}->{result_meanings} = $result_meanings;

    my $out = $word_list_ref->{$key}->{word} . "\t" . $word_list_ref->{$key}->{result_meanings} . "\n";
    #print $out;

    #say $key, "\t", $word_list_ref->{$key}->{word}, "\t", $word_list_ref->{$key}->{result_meanings};
    #say $word_list_ref->{$key}->{word}, "\t", $word_list_ref->{$key}->{result_meanings};
    print $fh_out $out;
}

close $fh_out;

sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}

sub prepare_word {
    $_ = shift;

    s/^\s+//g;
    s/\s+$//g;
    s/[‘’ˈ]/'/g;
    s/！/!/g;
    s/？/?/g;
    s/（/\(/g;
    s/）/\)/g;
    s/[，,]\s*/, /g;
    s/`/'/g;
    s#／#/#g;
    s/…/.../g;
    s/\.{4,}/.../g;
    s/ﬂ/fl/g;

    $_;
}

sub prepare_meaning {
    $_ = shift;

    s/…+/……/g;
    s/([a-z]+)[.．]\s*[＆&]\s*([a-z]+)[.．]/\1.&\2./g;
    s/([a-z]+)[.．]\s*[／\/]\s*([a-z]+)[.．]/\1.&\2./g;
    s/([a-z]+)[.．]/\1./g;
    s/\.{3,}/……/g;

    $_;
}

sub prepare_word_n_meaning {
    my ($word_ref, $meaning) = @_;

    if ( $meaning =~ /[a-z]+\..*?\p{Han}+.*?[a-z]+\./ ) {
        # 多词义

        $meaning =~ s/^\s+|\s+$//g;

        # 按词义拆分成词义数组
        my @mean_array = split(/(?<![a-z&\(])(?=[a-z]+\.)/, $meaning);

        foreach my $mean (@mean_array) {
            $mean =~ s/^\s+|\s+$//g;

            if ( $mean =~ /^([a-z]+\.(?:&[a-z]+\.)?)\s*(.*)$/ ) {
                # 有词性

                my ($pos, $mean_text) = ($1, $2);
                $mean_text =~ s/^\s+|\s+$//g;

                push @{ $word_ref->{meaning}->{$pos} }, $mean_text
                    if !&has_this_element(@{ $word_ref->{meaning}->{$pos} }, $mean_text);
            }
            else {
                # 无词性

                push @{ $word_ref->{meaning}->{_NOPOS_} }, $mean
                    if !&has_this_element(@{ $word_ref->{meaning}->{_NOPOS_} }, $mean );
            }
        }
    }
    else {
        if ( $meaning =~ /^([a-z]+\.(?:&[a-z]+\.)?)\s*(.*)$/ ) {
            # 有词性

            my ($pos, $mean_text) = ($1, $2);
            $mean_text =~ s/^\s+|\s+$//g;
            push @{ $word_ref->{meaning}->{$pos} }, $mean_text;
        }
        else {
            # 无词性

            push @{ $word_ref->{meaning}->{_NOPOS_} }, $meaning;
        }
    }
}

sub has_this_element {
    my (@arr, $element) = @_;

    foreach my $ele (@arr) {
        return 1 if index($ele, $element) != 1;
    }

    my %mapped_arr = map { $_ => 1 } @arr;
    return 1 if exists $mapped_arr{$element};

    0;
}

__DATA__
waste	adj.废弃的，丢弃的，无用的 v.浪费
waste	n.废料；废品
waste	n.废料；废弃物
waste	n.废物；浪费 v.浪费
waste	n.浪费
waste	n.浪费；垃圾 v.浪费；滥用
waste	n.浪费；垃圾v. 浪费；滥用
waste	v.&n.浪费
waste	v.浪费；滥用 n.浪费；滥用
waste	vt.浪费
waste	废弃的；浪费的
waste	浪费
watch	n.手表
watch	n.手表 v.看；观看
watch	n.表；手表
watch	n.表；（通常指）手表
watch	n.表；手表
watch	v.注视；观看
watch	v.看，观看
watch	v.观看；当心 n.手表
zip	n.拉链 vi.&vt.用拉链拉上或扣上；拉上拉链
zip	vi.&vt.（使沿某方向）快速移动；拉上拉链 n.拉链
yellow	adj.黄色的
yellow	adj.&n.黄色（的）
yellow	adj.&n.黄色（的）
yourself	(pl.yourselves) pron.你自己
yourself	pron. (pl. yourselves)你自己
yourself	pron.(pl. yourselves)你自己；您自己
yourself	pron.你自己
yourself	你自己
