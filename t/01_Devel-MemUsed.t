#!/usr/bin/perl

use strict;
use warnings;

use Test::More 'no_plan';
#use Test::More tests => 10;

use FindBin qw($Bin);
use lib "$Bin/lib";

BEGIN {
    use_ok ( 'Devel::MemUsed' ) or exit;
}

exit main();

sub main {
	my $memused = Devel::MemUsed->new();
	isa_ok($memused, 'Devel::MemUsed');
	
	
	return 0;
}

