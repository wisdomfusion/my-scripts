#!/usr/bin/env perl
use v5.12;

use strict;
use warnings qw( all );

use utf8;
use open ':std', ':encoding(UTF-8)';

my $infile  = 'definition_in.txt';
my $outfile = 'definition_out.txt';

open(my $fh_in,  '<', $infile)  or die $!;
open(my $fh_out, '>', $outfile) or die $!;

while ( <$fh_in> ) {
    s/^\x{FEFF}//; # remove bom
    s/\r?\n//;
    
    chomp;
    
    my ($word, $definition) = split /\t/;
    
    $_ = $definition;
    
    s/…+/……/g;        # 规范省略号
    s/\.{3,}/……/g;    # 同上
    s/…{3,}/……/g;     # 同上
    s/\s*……\s*/……/g;  # 同上
    s/,/，/g;         # 规范逗号
    s/;/；/g;         # 规范分号
    s/．/\./g;        # 规范词类后的点
    s/＆/&/g;         # 规范 &
    s/\//／/g;        # 规范中文／
    s/[a-z]+\./$& /g; # 词类后加空格
    s/([a-z]+\.)\s*&\s*([a-z]+\.)\s*&\s*([a-z]+\.)/$1&$2&$3/g;   # 3个词类&相连的情况
    s/([a-z]+\.)\s*&\s*([a-z]+\.)/$1&$2/g;                       # 2个词类&相连的情况
    s/([a-z]+\.)\s*／\s*([a-z]+\.)\s*／\s*([a-z]+\.)/$1&$2&$3/g; # 3个词类/相连的情况
    s/([a-z]+\.)\s*／\s*([a-z]+\.)/$1&$2/g;                      # 2个词类/相连的情况
    s/\[\s+/[/g;
    s/\s+]/]/g;
    
    s{([a-z\d])／([a-z\d])}{$1/$2}g; # 英文或数字之间还是要用英文的/
    
    s{\s*／\s*}{／}g; # ／前后无空格
    s{\s*/\s*}{\/}g;  # / 前后无空格
    
    s/[a-z]+\./ $&/; # 词类前保障有一个空格
    s/\s{2,}/ /g;    # 去掉多余空格
    s/^\s+//;        # 去掉行首空格
    s/\s+$//;        # 去掉行尾空格
    
    print $fh_out $word, "\t", $_, "\n";
}

close $fh_in;
close $fh_out;

say 'DONE';
