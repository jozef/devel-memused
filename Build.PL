#!/usr/bin/perl

use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Devel::MemUsed',
    license             => 'perl',
    dist_author         => 'Jozef Kutej <jkutej@cpan.org>',
    dist_version_from   => 'lib/Devel/MemUsed.pm',
    requires => {
        'Contextual::Return'    => 0,
        'Devel::Mallinfo'       => 0,
        'Class::Accessor::Fast' => 0,
    },
    build_requires => {
        'Test::More'  => 0,
    },
    script_files => [
    ],
    
    add_to_cleanup      => [ 'Devel-Mallinfo-*' ],
    create_makefile_pl  => 'traditional',
    create_readme       => 1,
    sign                => 1,
);

$builder->create_build_script();
