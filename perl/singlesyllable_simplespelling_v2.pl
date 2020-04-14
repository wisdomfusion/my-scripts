use 5.12.0;

use utf8;
use open ':std', ':encoding(UTF-8)';

use Socket qw(:DEFAULT :crlf);
use Data::Dump qw(dump);

# 元音因素对应的字母组合
my $vowel_combs_ref = {
    ought => 'iught',
    eigh  => 'aigh',
    ture  => 'true',
    air   => 'ear',
    ale   => 'ile',
    all   => 'oll',
    are   => 'eer',
    aur   => 'all',
    eal => 'ill',
    ear => 'are',
    eer => 'ear',
    eir => 'are',
    ere => 'ear',
    ial => 'oul',
    ier => 'eer',
    igh => 'egh',
    ing => 'eng',
    ire => 'are',
    oal => 'all',
    oar => 'all',
    oll => 'all',
    ool => 'oal',
    oor => 'all',
    ore => 'all',
    oul => 'ool',
    our => 'all',
    ure => 'rue',
    ai => 'ei',
    al => 'ol',
    ar => 'ir',
    au => 'ou',
    aw => 'au',
    ay => 'ey',
    ea => 'ee',
    ee => 'ea',
    ei => 'ea',
    er => 'or',
    eu => 'au',
    ew => 'aw',
    ey => 'ay',
    ie => 'ei',
    ir => 'er',
    oa => 'ou',
    oi => 'io',
    ol => 'al',
    oo => 'ou',
    or => 'er',
    ou => 'au',
    ow => 'aw',
    oy => 'oi',
    ue => 'eu',
    ui => 'ue',
    ur => 'ir',
    uy => 'ey',
};

# 辅音音素对应的字母组合
my $consonant_combs_ref = {
    ssion => 'ation',
    sion => 'tion',
    sure => 'ture',
    tion => 'sion',
    dge => 'gue',
    ght => 'igh',
    gue => 'que',
    tch => 'che',
    the => 'she',
    ch => 'sh',
    ck => 'sk',
    dd => 'de',
    dj => 'dg',
    dr => 'tr',
    ds => 'dz',
    ff => 'ph',
    gh => 'ph',
    gn => 'gu',
    gu => 'gi',
    kn => 'nk',
    ll => 'il',
    mm => 'mn',
    mn => 'nm',
    ng => 'gn',
    nn => 'nm',
    ph => 'ff',
    pp => 'ph',
    qu => 'kw',
    sc => 'ss',
    sh => 'ch',
    ss => 'sc',
    th => 'sh',
    tr => 'dr',
    ts => 'tz',
    tt => 'te',
    wh => 'wr',
    wr => 'wh',
};

# 元音音素对应的字母
my @vowels = qw( a e i y o u );

# 辅音音素对应的字母
my $consonants_ref = {
    b => 'p',
    c => 'k',
    d => 'b',
    f => 'v',
    g => 'j',
    h => 'n',
    j => 'g',
    k => 'c',
    l => 'r',
    m => 'n',
    n => 'm',
    p => 'b',
    q => 'k',
    r => 'l',
    s => 'z',
    t => 'd',
    v => 'w',
    w => 'v',
    x => 's',
    y => 'i',
    z => 's',
};

while ( <DATA> ) {
    chomp;
    
    my $word = $_;
    
    my $result_word   = ''; # 结果单词
    my $matched_chars = ''; # 匹配的字母（组合）
    my $alter_chars   = '';
    my $mark          = '';
    
    # 元音因素对应的字母组合
    foreach my $vowel ( sort { length $b <=> length $a } ( sort keys %$vowel_combs_ref ) ) {
        # 不全挖
        next if length $word == length $vowel;
        
        if ( $word =~ /$vowel/i ) {
            $mark = '_' x length $vowel;
            
            $result_word = $word;
            $result_word =~ s/$vowel/$mark/ie;
            
            $matched_chars = $vowel;
            $alter_chars   = $vowel_combs_ref->{$vowel};
            
            print $word, "\t", $result_word, "\t", $matched_chars, "\t", $alter_chars, $LF;
            
            goto LABEL;
        }
    }
    
    # 元音+辅音+e
    if ( $word =~ /([aeiou])[bcdfghjklmnpqstvwxyz]e/i ) {
        my $current_vw = $1;
        
        my $vowels  = 'aeiou';
        my $rest_vw = $vowels;
        $rest_vw    =~ s/$current_vw//i;
        my @rest_vw = split '', $rest_vw;
        
        $result_word = $word;
        $result_word =~ s/[aeiou]([bcdfghjklmnpqstvwxyz])e/_$1_/i;
        
        $matched_chars = $current_vw . '_e';
        $alter_chars   = $rest_vw[ int rand scalar @rest_vw ] . '_e';
    
        print $word, "\t", $result_word, "\t", $matched_chars, "\t", $alter_chars, $LF;
        
        goto LABEL;
    }
    
    # 辅音音素对应的字母组合
    foreach my $consonant ( sort { length $b <=> length $a } ( sort keys %$consonant_combs_ref ) ) {
        # 不全挖
        next if length $word == length $consonant;
        
        if ( $word =~ /$consonant/i ) {
            $mark = '_' x length $consonant;
            
            $result_word = $word;
            $result_word =~ s/$consonant/$mark/ie;
            
            $matched_chars = $consonant;
            $alter_chars   = $consonant_combs_ref->{$consonant};
            
            print $word, "\t", $result_word, "\t", $matched_chars, "\t", $alter_chars, $LF;
            
            goto LABEL;
        }
    }
    
    # 元音音素对应的字母
    foreach my $vw ( @vowels ) {
        # 不全挖
        next if length $word == length $vw;

        next if $vw eq 'e';
        
        if ( $word =~ /$vw/i ) {
            $mark = '_';
            
            $result_word = $word;
            $result_word =~ s/$vw/$mark/ie;
            
            my $vowels  = 'aeiou';
            my $rest_vw = $vowels;
            $rest_vw =~ s/$vw//i;
            my @rest_vw = split '', $rest_vw;
        
            $matched_chars = $vw;
            $alter_chars   = $rest_vw[ int rand scalar @rest_vw ];
            
            print $word, "\t", $result_word, "\t", $matched_chars, "\t", $alter_chars, $LF;
            
            goto LABEL;
        }
    }
    
    # 辅音音素对应的字母
    foreach my $co ( sort keys %$consonants_ref ) {
        # 不全挖
        next if length $word == length $co;
        
        if ( $word =~ /$co/i ) {
            $mark = '_';
            
            $result_word = $word;
            $result_word =~ s/$co/$mark/ie;
            
            $matched_chars = $co;
            $alter_chars   = $consonants_ref->{$co};
            
            print $word, "\t", $result_word, "\t", $matched_chars, "\t", $alter_chars, $LF;
            
            goto LABEL;
        }
    }
    
    LABEL:
    ;
    
    #exit if $. == 1;
}

__DATA__
bAthelney
blare
blaze
blot
blur
boast
bogged
boo
burgle
butt
churn
clamp
cleft
clog
cod
cramped
creep
crest
crude
cursed
Dane
deem
dredge
flint
flirt
forth
framed
fuse
gel
gilt
glimpse
glint
glisten
grapple
grass-seed
grease
grid
grip
grudge
gust
handyman
hardened
haul
haunt
heath
heave
hive
hobble
horde
hub
hull
jibe
lamp-post
lash
latch
locks
lodge
loom
lull
lure
lurk
mere
mirth
moot
mournful
muffle
mumble
muzzle
nag
naval
odds
pact
pence
perch
plank
plea
plead
ply
pounce
prise
prudent
resin
run-down
scalp
scorn
screw
scrub
seasons
shoal
silt
slur
smash-and-grab
snag
sneer
snob
snout
soothe
spawn
squall
stale
steer
steps
stole
stoves
straggle
stray
stroll
swarm
taunt
thresh
thrive
throng
tint
trickle
triple
tuck
tussle
vie
vinyl
vole
volt
wade
wane
wares
weird
whine
winch
winkle
wreck
wriggle
yeast
