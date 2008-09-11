package Devel::MemUsed;

=head1 NAME

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

use warnings;
use strict;

our $VERSION = '0.01';

=head1 PROPERTIES

no properties ;-)

=cut

=head1 METHODS

=head2 new()

Object constructor.

=cut

sub new {
    my $class = shift;
    my $self  = {};
    
    bless $self, __PACKAGE__;
    
    return $self;
}

1;


__END__

=head1 AUTHOR

Jozef Kutej

=cut
