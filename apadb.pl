#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use open ':std', ':encoding(UTF-8)';

# Regex for abbreviating author/editor names in refer databases
# Useful for the APA style
# Expects a "%A" or "%E" entry followed by "surname, name(s)"

my $database = shift or die "No database file specified.\n";
open(my $f, '<', $database) or die "Cannot open database file: $!";
while (my $line = readline($f)) {
	if ( $line =~ /^%[AE].*,/ ) {
		$line =~ s/(,\s)(\w)\w+-*\w*(\s)/$1$2\.$3/;
		$line =~ s/(\s)(\w)\w+-*\w*($)/$1$2\.$3/;
	}
	print($line);
}
close($f);
