package Devel::MemUsed;

=head1 NAME

Devel::MemUsed - returns how much memory as allocated since the Devel::MemUsed object construction

=head1 SYNOPSIS

    use Devel::MemUsed;
    
    my $memused = Devel::MemUsed->new();
    my %h = ( map { $_ => 1 } (1..100) );
    print "my hash allocated $memused bytes of memory\n";
    # for me 15632
    
    $memused->reset;
    
    my %h = ( map { $_ => 1 } (1..1000) );
    print "my hash allocated $memused bytes of memory\n";
    # for me 128104

=head1 DESCRIPTION

=cut

use warnings;
use strict;

our $VERSION = '0.01';

use base 'Class::Accessor::Fast';
use Contextual::Return;
use Devel::Mallinfo 'mallinfo';

=head1 PROPERTIES

=cut

__PACKAGE__->mk_accessors(qw{
    memory_offset
});

=head1 METHODS

=head2 new()

Object constructor.

=cut

sub new {
    my $class = shift;
    my $self  = $class->SUPER::new({ @_ });
    
    $self->reset;
    
    return ACTIVE
        OBJREF   { $self }
        DEFAULT  { $self->used }
    ;
}

sub used {
    my $self = shift;    
    return $self->allocated_memory - $self->memory_offset;
}

sub reset {
    my $self = shift;
    return $self->memory_offset($self->allocated_memory);
}

sub allocated_memory {
    my $self = shift;
    
    my $m = mallinfo();
    return $m->{'uordblks'} + $m->{'hblkhd'};
}

'always a lot, what do you think?';


__END__

=head1 AUTHOR

Jozef Kutej

=cut
