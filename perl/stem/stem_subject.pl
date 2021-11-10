#!/usr/bin/env perl
use 5.030;
use strict;
use warnings qw( all );
use Encode qw( encode decode );

use JSON;
use Data::Dumper;

use utf8;
use open ':std', ':encoding(UTF-8)';

use Mojo::UserAgent;

my $url    = 'http://top100.imicams.ac.cn/public/ranking/rankingAction_searchRankByCode.action?d=0.09783473623193095';
my $ua_str = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36';

my $ua = Mojo::UserAgent->new(max_redirects => 3);

$ua->transactor->name($ua_str);
$ua->proxy->detect;

my $subjects = ();

# 解析学科列表
my $tx = $ua->get('http://top100.imicams.ac.cn/subject');

for my $e ($tx->result->dom('#sub_left li a')->each) {
    #say $e;
    my $id_str  = $e->{id};
    my $subject = $e->{value};
    $id_str     =~ s/nav_left_//;
    
    push(@$subjects, { subject_id => $id_str, subject => $subject});
}

#say Dumper $subjects;

# 解析

my $head = "ID\tHOSPNAME\tPROVINCE\tGB_NAME\tGB_CODE\tINPUT\tOUTPUT\tINFLUENCE\tSUM\tRANK\tyear\tsubject_id\tsubject";
say $head;

my @years = (2019 .. 2020);

for my $s (@$subjects) {
    #say $s->{subject_id};
    #say $s->{subject};
    
    for my $year (reverse @years) {
    
        for my $num (1..5) {
            #say $num;
            
            my $tx   = $ua->post($url => form => {year => $year, subject => 320, start => $num, end => 20});
            my $body = $tx->result->body;
            
            my $rank_list = decode_json($body);
            
            for my $r (@{$rank_list->{rows}}) {
                my $res = $r->{ID} . "\t" . $r->{HOSPNAME} . "\t" . $r->{PROVINCE} . "\t" . $r->{GB_NAME} . "\t" . $r->{GB_CODE};
                $res   .= "\t" . $r->{INPUT} . "\t" . $r->{OUTPUT} . "\t" . $r->{INFLUENCE};
                $res   .= "\t" . $r->{SUM} . "\t" . $r->{RANK} ."\t" . $year . "\t" . $s->{subject_id} . "\t" . $s->{subject};
                
                say $res;
            }
            
            sleep 1;
        }
        
    }
}
