#!/usr/bin/env perl
use 5.030;
use strict;
use warnings qw( all );

use utf8;
use open ':std', ':encoding(UTF-8)';
no Smart::Comments "###";

use Mojo::UserAgent;
use Mojo::Util qw( dumper );

my $ua      = Mojo::UserAgent->new;
my $uaStr   = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36';
$ua->transactor->name($uaStr);
my $cookie  = 'cookie string here';
my $api_url = 'url here';

my $tx = $ua->build_tx(POST => $api_url => json => { parent_id  => '0', subject_id => 203 });
$tx->req->cookies($cookie);
$tx = $ua->start($tx);

my $data = $tx->result->json->{data};

my $outfile = '17_out.txt';
open(my $fh_out, '>', $outfile) or die $!;
$fh_out->autoflush;

traverse_nodes($data);

sub traverse_nodes {
    my $nodes = shift;
    
    foreach my $node (@{$nodes}) {
        if (!$node->{level}) {
            $node->{level}    = 0;
            $node->{position} = '';
        }
        
        my $out_str = "\t" x $node->{level} . $node->{name} . "\n";
        
        if ($node->{position}) {
            $out_str = $node->{level} . "\t" . $node->{position} . "\t" . $out_str;
        } else {
            $out_str = $node->{level} . "\t\t" . $out_str;
        }
        
        print $out_str;
        print $fh_out $out_str;
        
        # 跳过短语（id=151062）和语音（id=151064）
        next if !$node->{has_child} || $node->{id} == 151062 || $node->{id} == 151064;
        
        my $tx = $ua->build_tx(POST => $api_url => json => {
            parent_id  => "$node->{id}",
            subject_id => $node->{subject_id}
        });
        $tx->req->cookies($cookie);
        $tx = $ua->start($tx);
        
        my $children = $tx->result->json->{data};
        next if ref $children eq ref {} && !%$children;
        
        # 附加 level 字段
        my $level    = ++$node->{level};
        my $position = '';
        
        if ($node->{position}) {
            $position = $node->{position} . ' | ' . $node->{name};
        } else {
            $position = $node->{name};
        }
        
        $node->{children} = [ map {
            $_->{level} = $level;
            $_->{position} = $position;
            $_
        } @$children ];
        
        sleep 1;
        &traverse_nodes($node->{children});
    }
}
