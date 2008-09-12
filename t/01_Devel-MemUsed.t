#!/usr/bin/perl

use strict;
use warnings;

#use Test::More 'no_plan';
use Test::More tests => 8;

use FindBin qw($Bin);
use lib "$Bin/lib";

BEGIN {
    use_ok ( 'Devel::MemUsed' ) or exit;
}

exit main();

sub main {
	my $memused = Devel::MemUsed->new();
	ok($memused->isa('Devel::MemUsed'), 'isa Devel::MemUsed');
	
	cmp_ok($memused, '<', 5*1024, 'not a lot of memory should be allocated so far');
	
	$memused->reset;
	
#	my $x = "x" x (5*1024);           # this one takes >10kB of memory ?!?!?
	my $x = eval '"x" x (5*1024)';    # this one just   ~5kB
	cmp_ok($memused, '>', 5*1024, 'more then 5kB should be allocated ('.$memused.')');
	cmp_ok($memused, '<', 10*1024, 'but less then 10kB should be allocated ('.$memused.')');
	
	$memused->reset;

#	my $x2 = "x" x (100*1024);           # this one takes >200kB of memory ?!?!?
	my $x2 = eval '"x" x (100*1024)';    # this one just   ~100kB
	cmp_ok($memused, '>', 100*1024, 'more then 100kB should be allocated now ('.$memused.')');
	cmp_ok($memused, '<', 110*1024,  'but less then 110kB should be allocated ('.$memused.')');

	$memused->reset;

	# 127*1024 is a magic border after which hblkhd start to increase		
	my $x3 = eval '"x" x (128*1024)';
	cmp_ok($memused, '>', 128*1024, 'more then 128kB should be allocated now ('.$memused.')');

	return 0;
}
