package Classes::SGOS::Component::EnvironmentalSubsystem;
our @ISA = qw(Classes::SGOS);
use strict;

sub new {
  my $class = shift;
  my $self = {};
  bless $self, $class;
  $self->init();
  return $self;
}

sub init {
  my $self = shift;
  $self->{sensor_subsystem} =
      Classes::SGOS::Component::SensorSubsystem->new();
  $self->{disk_subsystem} =
      Classes::SGOS::Component::DiskSubsystem->new();
}

sub check {
  my $self = shift;
  $self->{sensor_subsystem}->check();
  $self->{disk_subsystem}->check();
  if (! $self->check_messages()) {
    $self->add_ok("environmental hardware working fine");
  }
}

sub dump {
  my $self = shift;
  $self->{sensor_subsystem}->dump();
  $self->{disk_subsystem}->dump();
}

1;
