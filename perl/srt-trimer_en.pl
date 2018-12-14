use strict;
use warnings;
use open ':std', ':encoding(UTF-8)';
use Socket qw(:DEFAULT :crlf);

my @files = glob('*\.srt');

for (0..$#files) {
    print 'processing: ', $files[$_], "\n";
    trim_srt($files[$_]);
}
print '-' x 20 . "\nDONE.";

sub trim_srt {
    my $infile  = shift;
    my $outfile = 'EN_DONE_' . $infile;
    
    open(my $fh_in,  '<', $infile)  or die $!;
    open(my $fh_out, '>', $outfile) or dir $!;
    
    while ( <$fh_in> ) {
        s/^\x{FEFF}//; # remove bom
        s/\r?\n//;
        chomp;
        my ($line, $out) = ($_, '');
        
        if ( $line =~ /^\d+\s*$/ || $line =~ /^\d{2}:\d{2}:\d{2},\d+/ ) {
            # no, timeline
            $out = "$line${CRLF}";
        } elsif ( $line =~ /\p{Han}/ ) { # zh transcript
            $out = "";
        } elsif ( $line =~ /^[\s　]*$/ ) { # blank line
            $out = eof($fh_in) ? '' : "$CRLF";
        } else {
			$out = "$line${CRLF}";
		}
        
        print $fh_out $out;
    }
    close $fh_in;
    close $fh_out;
}
