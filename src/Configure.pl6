#!/usr/bin/env perl6

# Please note that this is *not* run during panda install. It is only intended
# to be run manually for testing and recompiling without needing to
# do a 'panda install'
#

use v6;
use LibraryMake;

my $destdir = '../resources';

# Make destination folder if it does not exist
mkdir $destdir unless $destdir.IO ~~ :e;

my %vars = get-vars($destdir);
process-makefile('.', %vars);

say "Configure completed! You can now run '%vars<MAKE>' to build libopencv-perl6.";