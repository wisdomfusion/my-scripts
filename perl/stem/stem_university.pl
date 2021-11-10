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

my $url = 'http://top100.imicams.ac.cn/public/ranking/rankingAction_universityRank.action?d=0.898527072274991';

my $ua = Mojo::UserAgent->new(max_redirects => 3);
$ua->transactor->name('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36');
$ua->proxy->detect;

say "ID\tUNIVNAME\tPROVINCE\tINPUT\tOUTPUT\tINFLUENCE\tSUM\tRANK\tyear";

my @years = (2018 .. 2020);

for my $year (reverse @years) {

    for my $num (1..6) {
        #say $num;
        
        my $tx   = $ua->post($url => form => {year => $year, start => $num, end => 20});
        my $body = $tx->result->body;
        
        my $rank_list = decode_json($body);
        
        for my $row (@{$rank_list->{rows}}) {
            my $res = $row->{ID} . "\t" . $row->{UNIVNAME} . "\t" . $row->{PROVINCE};
            $res   .= "\t" . $row->{INPUT} . "\t" . $row->{OUTPUT} . "\t" . $row->{INFLUENCE};
            $res   .= "\t" . $row->{SUM} . "\t" . $row->{RANK} . "\t" . $year;
            
            say $res;
        }
        
        sleep 1;
    }

}


