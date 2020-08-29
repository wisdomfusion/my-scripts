#!/usr/bin/env perl
use v5.12.0;
use strict;
use warnings qw( all );

use utf8;
use open ':std', ':encoding(UTF-8)';

my $infile  = 'spelling_in.txt';
my $outfile = 'spelling_out.txt';

open(my $fh_in,  '<', $infile)  or die $!;
open(my $fh_out, '>', $outfile) or die $!;

while ( <$fh_in> ) {
    s/^\x{FEFF}//; # remove bom
    s/\r?\n//;
    
    chomp;
    
    s/[‘’ˈ`]/'/g;             # 规范英文引号
    s/…/.../g;                # 规范英文省略号 ...
    s/　/ /g;                 # 规范空格，不能出现中文空格
	s/？/?/g;                 # 规范问号
    s/！/!/g;                 # 规范感叹号
	s/。/./g;                 # 不能出现中文句号
    s/\.\.\./ $& /g;          # 英文省略号前后先加上空格
    s/\.{4,}/.../g;           # 多于3个的点，规范成 ...
    s/\.+\s+\.+/.../g;        # 避免 ... ...
    s/（/\(/g;                # 规范括弧
    s/）/)/g;                 # 规范括弧
    s/\(/ \(/g;               # 左括弧前加空格
    s/\)/\) /g;               # 右括弧后加空格
    s/\(\s+/\(/g;             # 左括弧后不能有空格
    s/\s+\)/\)/g;             # 右括弧前不能有空格
    s/\s+\(s\)/\(s\)/;        # (s) 这个结构前不能有空格
    s/a\s+\(an\)/a\(an\)/;    # 处理个例
    s/a\s+\(n\)/a\(n\)/;      # 处理个例
    s{／}{/}g;                # 规范 /
    s{\s*/\s*}{/}g;           # /的前后不能有空格
    s/[，,]\s*/, /g;          # 规范逗号
    s/\.\.\.\s+([?!])/...$1/; # ...后面的?!，无需空格隔开
    s/\s*([?!])/$1/g;         # ?!前无空格
    
    s/\s{2,}/ /g;             # 去掉多余空格
    s/^\s+//;                 # 去掉行首空格
    s/\s+$//;                 # 去掉行尾空格

    print $fh_out $_, "\n";
}

close $fh_in;
close $fh_out;

say 'DONE';
