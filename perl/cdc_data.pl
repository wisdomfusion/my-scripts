use 5.12.0;

use utf8;
use open ':std', ':encoding(UTF-8)';

#my $infile = 'cdc_data.txt';

#open(my $fh_in, '<', $infile) or die $!;

# https://en.wiktionary.org/
my $pinyin_pairs = {
    a1 => 'U+0101', a2 => 'U+00E1', a3 => 'U+01CE', a4 => 'U+00E0',
    o1 => 'U+014D', o2 => 'U+00F3', o3 => 'U+01D2', o4 => 'U+00F2',
    e1 => 'U+0113', e2 => 'U+00E9', e3 => 'U+011B', e4 => 'U+00E8',
    i1 => 'U+012B', i2 => 'U+00ED', i3 => 'U+01D0', i4 => 'U+00EC',
    u1 => 'U+016B', u2 => 'U+00FA', u3 => 'U+01D4', u4 => 'U+00F9',
    v1 => 'U+01D6', v2 => 'U+01D8', v3 => 'U+01DA', v4 => 'U+01DC'
};

my $cpa_unicode_compact_pairs = {
    '\[~a\]'    => 'U+00E3',
    '\[~@\]'    => 'U+0251',
    '\[\+ae\]'  => 'U+00E6',
    '\[ae\]'    => 'U+00E6',
    '\[bb\]'    => 'U+03B2',
    '\[,c\]'    => 'U+00E7',
    '\[~e\]'    => 'U+1EBD',
    '\[~E\]'    => 'U+025B',
    '&amp;'     => 'U+0259',
    '\[~I\]'    => 'U+0131',
    '\[ng\]'    => 'U+014B',
    '\[nn\]'    => 'U+0272',
    '\[~o\]'    => 'U+00F5',
    '\[~%\]'    => 'U+0254',
    '\[\+oe\]'  => 'U+0153',
    '\[~\+oe\]' => 'U+0153',
    '\[th\]'    => 'U+03B8',
    '\[dh\]'    => 'U+00F0',
    '\[~u\]'    => 'U+0169',
    '\[zh\]'    => 'U+0292',
    '\[gg\]'    => 'U+0263',
    '\[ll\]'    => 'U+028E',
};

my $cpa_unicode_pairs = {
    'a'  => 'U+0061',
    '\@'  => 'U+0251',
    '\{' => 'U+0250',
    'A'  => 'U+0252',
    'b'  => 'U+0062',
    'd'  => 'U+0064',
    'e'  => 'U+0065',
    'E'  => 'U+025B',
    '\&' => 'U+0259',
    '3'  => 'U+025C',
    'f'  => 'U+0066',
    'g'  => 'U+0067',
    'h'  => 'U+0068',
    'i'  => 'U+0069',
    'I'  => 'U+026A',
    'H'  => 'U+0265',
    'j'  => 'U+006A',
    'k'  => 'U+006B',
    'l'  => 'U+006C',
    'm'  => 'U+006D',
    'n'  => 'U+006E',
    'o'  => 'U+006F',
    '%'  => 'U+0254',
    'Q'  => 'U+00F8',
    'p'  => 'U+0070',
    'r'  => 'U+0072',
    'R'  => 'U+0280',
    '\$' => 'U+0283',
    's'  => 'U+0073',
    't'  => 'U+0074',
    'u'  => 'U+0075',
    'U'  => 'U+028A',
    '\^' => 'U+028C',
    'v'  => 'U+0076',
    'w'  => 'U+0077',
    'x'  => 'U+0078',
    'y'  => 'U+0079',
    'Y'  => 'U+028F',
    'g'  => 'U+0261',
    ':'  => 'U+02D0',
    '\'' => 'U+02C8',
    '"'  => 'U+02CC',
    '\|' => 'U+007C',
};

# POCH, XRBL不用输出
my $field_name_pairs = {
    'HWME' => '头词',
    'HWAE' => '缩略词形式头词',
    'HWKE' => '核心头词',
    'LBTM' => '商标',
    'HDHN' => '同形异义词头词标号',
    'LBLF' => '比喻',
    'LBRN' => '地域',
    'HWAF' => '异体词',
    'LBRR' => '语体',
    'LBSF' => '学科',
    'PRON' => '音标',
    'PRRN' => '地域读音',
    'PRPS' => '词性读音',
    'IFGR' => '屈折形式语法',
    'HDIF' => '屈折形式',
    'POSP' => '词性',
    'EXPN' => '缩略语完整形式',
    'XROF' => '过去时形式',
    'XRHN' => '过去时形式所指回头词的标号',
    'XRSE' => '指向意义上直接相关的头词',
    'XREQ' => '和另一个更常用的头词意思完全一致，将其指向另一个头词或义项',
    'GRAM' => '语法',
    'CAT1' => '词性类别',
    'CAT2' => '义项',
    'LBSN' => '同义词或类似意思的其它表达方式',
    'LBFF' => '完整书写形式',
    'LLEX' => '复数形式',
    'LBCA' => '形容词',
    'LBCN' => '针对形容词义项或动短',
    'LBCC' => '针对名词',
    'LBCV' => '动词',
    'LBGR' => '动词短语不可拆分',
    'LBIN' => '通用说明',
    'HWFV' => '次头词',
    'HWXT' => '补充，翻译不能完全体现用法或意义',
    'TRAN' => '翻译',
    'TRGL' => '解释性文字',
    'TRAD' => '繁体字',
    'PINT' => '汉语拼音',
    'MEAS' => '量词',
    'PINM' => '量词的汉语拼音',
    'PHEG' => '演示义项用法的例句',
    'PHRS' => '义项衍生习语',
    'BOXC' => '文化注解标题',
    'BOXB' => '文化注解正文',
    'BOXL' => '语言注解，进一步说明或解释',
};

my $regexs = {
    entry_indicator => qr#\*{3,}#,
    field_parts     => qr#<([A-Z]{3}[A-Z12])(\d?)>\s+(.+)#,
    unicode_no      => qr#U\+([0-9a-fA-F]{4})#,
    trad            => qr#<TRAD\d?>.*?</TRAD\d?>#,
};

while ( <DATA> ) {
    s/^\x{FEFF}//; # remove bom
    s/\r?\n//;
    
    chomp;
    
    my ($line, $out) = ($_, '');
    
    # 新词
    say "\n", '新词条', "\n", $_ if $line =~ $regexs->{entry_indicator};

    if ($line =~ $regexs->{field_parts}) {
        my ($tag, $no, $body) = ($1, $2, $3);
        #say "$tag|$no|$body";
        
        if ($tag eq 'PRON') {      # 音标
            $body = '[' . &cpa2unicode($body) . ']';
        } elsif ($tag eq 'PINT') { # 拼音
            $body = &code2pinyin($body);
        } elsif ($tag eq 'TRAN') { # 翻译
            $body =~ s{$regexs->{trad}}{}gis;
        }
        
        if (exists $field_name_pairs->{$tag}) {
            $tag = $field_name_pairs->{$tag};
        }
        
        if ($no ne '') {
            $out = "$tag$no\t$body";
        } else {
            $out = "$tag\t$body";
        }
        
        say $out;
    }

}

sub code2pinyin {
    my $code = shift;
    
    foreach my $key (keys %$pinyin_pairs) {
        my $char = $pinyin_pairs->{$key};
        $char =~ s/U\+/0x/i;
        $char = chr($char);
        $code =~ s/$key/$char/gi;
    }
    
    $code;
}

sub cpa2unicode {
    my $code = shift;
    
    foreach my $key (keys %$cpa_unicode_compact_pairs) {
        my $char = $cpa_unicode_compact_pairs->{$key};
        $char =~ s/U\+/0x/i;
        $char = chr($char);
        $code =~ s/$key/$char/g;
    }
    
    foreach my $key (keys %$cpa_unicode_pairs) {
        my $char = $cpa_unicode_pairs->{$key};
        $char =~ s/U\+/0x/i;
        $char = chr($char);
        $code =~ s/$key/$char/g;
    }
    
    $code;
}


__DATA__
******************
<HWME2> untrue
<PRON2> ^n'tru:
<POSP2> adj
<TRAN2> 不正确<TRAD>確</TRAD>的
<PINT2> bu4 zhe4ngque4 de
<PHRS2> it is untrue that<ellip></ellip>
<TRAN2> <ellip></ellip>与<TRAD>與</TRAD>事实<TRAD>實</TRAD>不符
<PINT2> <ellip></ellip>yu3 shi4shi2 bu4 fu2
<PHRS2> it would be untrue to say that<ellip></ellip>
<TRAN2> 说<TRAD>說</TRAD><ellip></ellip>就不对<TRAD>對</TRAD>了
<PINT2> shuo1<ellip></ellip>jiu4 bu4dui4 le
******************
<HWME2> unused
<HDHN2> 1
<PRON2> ^n'ju:zd
<POSP2> adj
<TRAN2> 闲<TRAD>閒</TRAD2>置的
<PINT2> xia2nzhi4 de
******************
<HWME2> unused
<HDHN2> 2
<PRON2> ^n'ju:st
<POSP2> adj
<HWXT2> to be unused to sth/to doing sth
<TRAN2> 不习<TRAD>習</TRAD>惯<TRAD>慣</TRAD>某事/做某事
<PINT2> bu4 xi2gua4n mo3ushi4/zuo4 mo3ushi4
******************
<HWME> unusual
<PRON> ^n'ju:[zh]u&l
<POSP> adj
<CAT2> 1
<TRAN> 不寻<TRAD>尋</TRAD>常的
<PINT> bu4 xu2ncha2ng de
<CAT22> 2
<LBSN2> distinctive
<TRAN2> 与<TRAD>與</TRAD>众<TRAD>眾</TRAD>不同的
<PINT2> yu3 zho4ng bu4to2ng de
<PHRS2> it's unusual to see someone so tall
<TRAN2> 难<TRAD>難</TRAD>得见<TRAD>見</TRAD>到这<TRAD>這</TRAD>么<TRAD>麼</TRAD>高的人
<PINT2> na2nde2 jia4nda4o zhe4me ga1o de re2n
******************
<HWME2> unusually
<PRON2> ^n'ju:[zh]u&lI
<POSP2> adv
<TRAN2> 异<TRAD>異</TRAD>乎寻<TRAD>尋</TRAD>常地
<PINT2> yi4hu1 xu2ncha2ng de
******************
<HWME2> unveil
<PRON2> ^n'veIl
<POSP2> vt
<CAT22> 1
<LBCO2> statue, plaque
<TRAN2> 为<TRAD>為</TRAD><ellip></ellip>揭幕
<PINT2> we4i<ellip></ellip>jie1mu4
<CAT22> 2
<LBCO2> plan
<TRAN2> 透露
<PINT2> to4ulu4
******************
<HWME2> unwanted
<PRON2> ^n'w%ntId
<POSP2> adj
<CAT22> 1
<LBCN2> clothing, animal
<TRAN2> 没<TRAD>沒</TRAD>人要的
<PINT2> me2i re2n ya4o de
<CAT22> 2
<LBCN2> child, pregnancy
<TRAN2> 不想要的
<PINT2> bu4 xia3ngya4o de
******************
<HWME2> unwise
<PRON2> ^n'waIz
<POSP2> adj
<CAT22> 1
<LBCN2> decision, choice
<TRAN2> 愚蠢的
<PINT2> yu2chu3n de
<CAT22> 2
<LBCN2> person
<TRAN2> 不明智的
<PINT2> bu4 mi2ngzhi4 de
<PHRS2> it would be unwise to expect too much
<TRAN2> 期望过<TRAD>過</TRAD>多是不明智的
<PINT2> qi1wa4ng guo4 duo1 shi4 bu4 mi2ngzhi4 de
<PHRS2> to be unwise enough to do sth
<TRAN2> 做某事真是傻
<PINT2> zuo4 mo3ushi4 zhe1nshi sha3
******************
<HWME> unwrap
<PRON> ^n'r[+ae]p
<POSP> vt
<TRAN> 打开<TRAD>開</TRAD><ellip></ellip>的包装<TRAD>裝</TRAD>
<PINT> da3ka1i<ellip></ellip>de ba1ozhua1ng
******************
<FREQ> 5 lozenges
<HWKE> up
<PRON> ^p
<CAT1> I
<POSP> prep
<CAT2> 1
<LBSN> to higher point on
<LBCO2> hill, slope, ladder, stairs
<TRAN> 沿<ellip></ellip>向上
<PINT> ya2n<ellip></ellip>xia4ngsha4ng
<PHRS> he went up the stairs/the hill/the ladder
<TRAN> 他上了楼<TRAD>樓</TRAD>/山/梯子
<PINT> ta1 sha4ngle lo2u/sha1n/ti1zi
<CAT2> 2
<LBSN> along
<LBCO2> road, river
<TRAN> 沿着<TRAD>著</TRAD>
<PINT> ya2nzhe
<PHRS2> a bus came/went up the road
<TRAN2> 一辆<TRAD>輛</TRAD>公共汽车<TRAD>車</TRAD>沿着<TRAD>著</TRAD>路开<TRAD>開</TRAD>过<TRAD>過</TRAD>来<TRAD>來</TRAD>/过去
<PINT2> yi1 lia4ng go1nggo4ng qi4che1 ya2nzhe lu4 ka1i guo4la2i/guo4qu4
<CAT2> 3
<LBSN> at higher point on
<LBCO2> hill, ladder, tree
<TRAN> 在<ellip></ellip>高处<TRAD>處</TRAD>
<PINT> za4i<ellip></ellip>ga1ochu4
<LBCO> road
<TRAN> 在<ellip></ellip>高远<TRAD>遠</TRAD>处<TRAD>處</TRAD>
<PINT> za4i<ellip></ellip>ga1oyua3nchu4
<LBCO2> river
<TRAN2> 在<ellip></ellip>上游<TRAD>遊</TRAD>
<PINT2> za4i<ellip></ellip>sha4ngyo2u
<PHRS2> the cat was up a tree
<TRAN2> 猫<TRAD>貓</TRAD>在树<TRAD>樹</TRAD>上
<PINT2> ma1o za4i shu4 shang
<PHRS> they live further up the street
<TRAN> 他们<TRAD>們</TRAD>住在这<TRAD>這</TRAD>条<TRAD>條</TRAD>街那边<TRAD>邊</TRAD>儿<TRAD>兒</TRAD>
<PINT> ta1men zhu4 za4i zhe4 tia2o jie1 na4bia1nr
<CAT1> II
<POSP> adv
<CAT2> 1
<LBSN> towards higher point
<TRAN> 往上
<PINT> wa3ngsha4ng
<PHRS> the lift only goes up to the 12th floor
<TRAN> 电<TRAD>電</TRAD>梯只到12层<TRAD>層</TRAD>楼<TRAD>樓</TRAD>以上
<PINT> dia4nti1 zhi3 da4o shi2'e4r ce2ng lo2u yi3sha4ng
<PHRS2> to pace up and down
<TRAN2> 走来<TRAD>來</TRAD>走去
<PINT2> zo3u la2i zo3u qu4
<CAT2> 2
<LBSN> at higher point
<TRAN> 高高地
<PINT> ga1oga1o de
<PHRS2> up in the sky
<TRAN2> 在天上
<PINT2> za4i tia1nshang
<PHRS> up here/there
<TRAN> 这<TRAD>這</TRAD>/那上面
<PINT> zhe4/na4 sha4ngmian
<PHRS2> up above
<TRAN2> 再往上
<PINT2> za4i wa3ng sha4ng
<CAT2> 3
<HWXT> to be up
<LBSN> be out of bed
<TRAN> 起床
<PINT> qi3chua2ng
<LBSN2> be at an end
<LBCS2> time
<TRAN2> 结<TRAD>結</TRAD>束
<PINT2> jie2shu4
<LBSN2> be on the increase
<LBCS2> price, level, amount
<TRAN2> 上升
<PINT2> sha4ngshe1ng
<PHRS2> what's up?
<LBRR2> inf
<TRAN2> 怎么<TRAD>麼</TRAD>了？
<PINT2> ze3nme le？
<PHRS2> what's up with him?
<TRAN2> 他怎么<TRAD>麼</TRAD>了？
<PINT2> ta1 ze3nme le？
<CAT2> 4
<LBSN> to/in the north
<TRAN> 在/向北方
<PINT> za4i/xia4ng be3ifa1ng
<PHRS> he often comes up to Scotland
<TRAN> 他常北上去苏<TRAD>蘇</TRAD2>格兰<TRAD>蘭</TRAD>
<PINT> ta1 cha2ng be3isha4ng qu4 Su1ge2la2n
<PHRS2> how long are you staying up here?
<TRAN2> 你在那儿<TRAD>兒</TRAD>住了多久了？
<PINT2> ni3 za4i na4r zhu4le duo1 jiu3 le？
<CAT2> 5
<LBIN> approaching
<HWXT> to go/come/run up (to sb)
<TRAN> (朝某人)走去/走过<TRAD>過</TRAD>来<TRAD>來</TRAD>/跑去
<PINT> (cha2o mo3ure2n) zo3uqu4/zo3u guo4la2i/pa3oqu4
<CAT2> 6
<HWXT> up to
<LBSN> as far as
<TRAN> 直到
<PINT> zhi2da4o
<LBIN> in approximations
<TRAN> 多达<TRAD>達</TRAD>
<PINT> duo1da2
<PHRS2> the water came up to his knees
<TRAN2> 水到他的膝盖<TRAD>蓋</TRAD>了
<PINT2> shui3 da4o ta1 de xi1ga4i le
<PHRS> I can spend up to £100
<TRAN> 我可以花到100英镑<TRAD>鎊</TRAD>
<PINT> wo3 ke3yi3 hua1da4o yi1ba3i yi1ngba4ng
<PHRS2> up to 100 people
<TRAN2> 多达<TRAD>達</TRAD>100人
<PINT2> duo1 da2 yi1ba3i re2n
<CAT2> 7
<HWXT> up to {or} until
<TRAN> 直到
<PINT> zhi2da4o
<PHRS> I'll be here up to {or} until 5.30 pm
<TRAN> 我会<TRAD>會</TRAD>一直呆到下午5点<TRAD>點</TRAD>30分
<PINT> wo3 hui4 yi1zhi2 da1ida4o xia4wu3 wu3 dia3n sa1nshi2 fe1n
<PHRS> up to now
<TRAN> 直到现<TRAD>現</TRAD>在
<PINT> zhi2da4o xia4nza4i
<CAT2> 8
<HWXT> it is up to you (to decide)
<TRAN> 随<TRAD>隨</TRAD>便你（决<TRAD>決</TRAD>定）
<PINT> sui2bia4n ni3 (jue2di4ng)
<CAT22> 9
<HWXT2> to be up to sth
<LBRR2> inf
<LBSN2> be doing
<TRAN2> 忙于<TRAD>於</TRAD>做某件坏<TRAD>壞</TRAD>事
<PINT2> ma2ng yu2 zuo4 mo3u jia4n hua4ishi4
<PHRS2> what is he up to?
<TRAN2> 他在捣<TRAD>搗</TRAD>什么<TRAD>麼</TRAD>鬼？
<PINT2> ta1 za4i da3o she2nme gui3？
<CAT22> 10
<HWXT2> to be up to sth
<LBSN2> adequate for
<LBCO2> task
<TRAN2> 足够<TRAD>夠</TRAD>某事
<PINT2> zu2go4u mo3ushi4
<LBCO2> standard
<TRAN2> 达<TRAD>達</TRAD>到某事
<PINT2> da2da4o mo3ushi4
<PHRS2> his work is not up to the required standard
<TRAN2> 他的工作未能达<TRAD>達</TRAD>到要求的标<TRAD>標</TRAD>准<TRAD>準</TRAD>
<PINT2> ta1 de go1ngzuo4 we4i ne2ng da2da4o ya1oqiu2 de bia1ozhu3n
<PHRS2> to be up to doing sth
<TRAN2> 胜<TRAD>勝</TRAD>任做某事
<PINT2> she4ngre4n zuo4 mo3ushi4
<CAT2> 11
<HWXT> to feel up to sth/to doing sth
<TRAN> 感到能胜<TRAD>勝</TRAD>任某事/感到有力气<TRAD>氣</TRAD>做某事
<PINT> ga3nda4o ne2ng she4ngre4n mo3ushi4/ga3nda4o yo3u li4qi zuo4 mo3ushi4
<CAT22> 12
<LBIN2> in other expressions
<HWXT2> to be up against sb/sth
<TRAN2> 面临<TRAD>臨</TRAD>某人/某事
<PINT2> mia4nli2n mo3ure2n/mo3ushi4
<PHRS2> to be up for discussion
<TRAN2> 即将<TRAD>將</TRAD>讨<TRAD>討</TRAD>论<TRAD>論</TRAD>
<PINT2> ji2jia1ng ta3olu4n
<CAT12> III
<POSP2> vt
<LBSN2> increase
<TRAN2> 增加
<PINT2> ze1ngjia1
<CAT12> IV
<POSP2> vi
<LBRR2> inf
<HWXT2> she upped and left
<TRAN2> 她突然起身离<TRAD>離</TRAD>开<TRAD>開</TRAD>了
<PINT2> ta1 tu1ra2n qi3she1n li2ka1i le
<CAT12> V
<POSP2> n pl
<HWXT2> ups and downs
<LBIN2> in life, career
<TRAN2> 起起伏伏
<PINT2> qi3qi3 fu2fu2
<PHRS2> we all have our ups and downs
<TRAN2> 我们<TRAD>們</TRAD>都有盛衰浮沉
<PINT2> wo3men do1u yo3u she4ngshua1i fu2che2n
******************
<HWME> update
<PRPS> vb
<PRON> ^p'deIt
<PRPS> n
<PRON> '^pdeIt
<CAT1> I
<POSP> vt
<LBCO2> records, information
<TRAN> 更新
<PINT> ge1ngxi1n
<CAT1> II
<POSP> n
<GRAM> c
<TRAN> 最新信息
<PINT> zui4xi1n xi4nxi1
<MEAS> 条
<PINT> tia2o
<PHRS2> to update sb on sth
<TRAN2> 告知某人某事最新动<TRAD>動</TRAD>态<TRAD>態</TRAD>
<PINT2> ga4ozhi1 mo3ure2n mo3ushi4 zui4 xi1n do4ngta4i
******************
<HWME2> upfront
<PRON2> ^p'fr^nt
<CAT12> I
<POSP2> adj
<CAT22> 1
<LBCN2> person
<TRAN2> 坦率的
<PINT2> ta3nshua4i de
<CAT22> 2
<LBSN2> advance
<LBCN2> charge, cost
<TRAN2> 提前支付的
<PINT2> ti2qia2n zhi1fu4 de
<CAT12> II
<POSP2> adv
<LBCV2> pay, charge
<TRAN2> 提前地
<PINT2> ti2qia2n de
<PHRS2> to be upfront about sth
<TRAN2> 对<TRAD>對</TRAD>某事很坦率
<PINT2> dui4 mo3ushi4 he3n ta3nshua4i
<PHRS2> to be upfront about being gay/divorced {etc}
<TRAN2> 公开<TRAD>開</TRAD>表示自己是同性恋<TRAD>戀</TRAD>/已离<TRAD>離</TRAD>婚{等}
<PINT2> go1ngka1i bia3oshi4 zi4ji3 shi4 to2ngxi4nglia4n/yi3 li2hu1n {de3ng}
******************
<HWME2> upgrade
<PRPS2> vb
<PRON2> ^p'greId
<PRPS2> n
<PRON2> '^pgreId
<CAT12> I
<POSP2> vt
<CAT22> 1
<LBCO2> computer etc
<TRAN2> 使升级<TRAD>級</TRAD>
<PINT2> shi3 she1ngji2
<CAT22> 2
<LBCO2> employee
<TRAN2> 提升
<PINT2> ti2she1ng
<CAT12> II
<POSP2> n
<GRAM2> c
<TRAN2> 升级<TRAD>級</TRAD>
<PINT2> she1ngji2
<PHRS2> to upgrade sth/sb to sth
<TRAN2> 将<TRAD>將</TRAD>某物升级<TRAD>級</TRAD>为<TRAD>為</TRAD>某物/将<TRAD>將</TRAD>某人升为<TRAD>為</TRAD>某职<TRAD>職</TRAD>
<PINT2> jia1ng mo3uwu4 she1ngji2 we2i mo3uwu4/jia1ng mo3ure2n she1ngwe2i mo3uzhi2
<PHRS2> an upgrade to sth
<TRAN2> 提升到某个<TRAD>個</TRAD1>等级<TRAD>級</TRAD>
<PINT2> ti2she1ngda4o mo3u ge4 de3ngji2
******************
<HWME> uphill
<PRON> '^p'hIl
<CAT12> I
<POSP2> adj
<CAT22> 1
<LBCN2> climb, journey
<TRAN2> 上坡的
<PINT2> sha4ngpo1 de
<CAT22> 2
<LBLF2> fig
<LBCN2> task
<TRAN2> 艰<TRAD>艱</TRAD>难<TRAD>難</TRAD>的
<PINT2> jia1nna2n de
<CAT1> II
<POSP> adv
<LBCV> walk, push
<TRAN> 往坡上
<PINT> wa3ng po1shang
<PHRS2> an uphill struggle {or} battle (to do sth)
<TRAN2> (做某事的)艰<TRAD>艱</TRAD>苦奋<TRAD>奮</TRAD>斗<TRAD>鬥</TRAD>
<PINT2> (zuo4 mo3ushi4 de) jia1nku3 fe4ndo4u
******************
<HWME2> upload
<PRON2> ^p'l&ud
<POSP2> vt
<TRAN2> 上载<TRAD>載</TRAD>
<PINT2> sha4ngza4i
