#!/usr/bin/env perl
use v5.30;

use utf8;
use open ':std', ':encoding(UTF-8)';
no Smart::Comments "###";

use JSON;
use Data::Dumper;

my $in_filename  = 'aixuexi_kp_primary.txt';
my $out_filename = 'aixuexi_kp_primary_out.txt';

my $json_text = do {
    open( my $fh_in, '<', $in_filename ) or die $!;
    local $/;
    <$fh_in>
};

my $json = JSON->new;
my $data = $json->decode( $json_text );
my $kps  = $data->{body};

open(my $fh_out, '>', $out_filename) or die $!;

traverse_kp( $kps );

close $fh_out;

sub traverse_kp {
    my $knowledge_points = shift;
    
    foreach my $kp ( @{$knowledge_points} ) {
        next if $kp->{name} =~ /(废|新建)/;
        
        # 级别，用于打印前导 \t 字符
        $kp->{level} = 0 if !$kp->{level};
        
        my $out_str = "\t" x $kp->{level} . $kp->{name};
        &print_file_line( $fh_out, $out_str );
        
        next if !$kp->{childs};
        
        my $children  = $kp->{childs};
        my $level     = ++$kp->{level};
        $kp->{childs} = [ map { $_->{level} = $level; $_ } @{$children} ];
        
        &traverse_kp( $kp->{childs} );
    }
}

sub print_file_line {
    my ( $fh, $line ) = @_;
    
    print $line, "\n";
    print $fh $line, "\n";
}
