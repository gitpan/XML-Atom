# $Id: 01-util.t 845 2003-09-28 21:12:32Z btrott $

use strict;

use Test;
use XML::Atom::Util qw( iso2dt );

BEGIN {
    unless (eval { require DateTime; }) {
        print "1..0\n";
        exit;
    }
    plan tests => 12;
}

my %tests = (
    '20030928' => '2003-09-28T00:00:00',
    '2003-09-28' => '2003-09-28T00:00:00',
    '2003-09-28T12:49:50' => '2003-09-28T12:49:50',
    '2003-09-28T12:49:50Z' => '2003-09-28T12:49:50',
    '2003-09-28T12:49:50-00:00' => '2003-09-28T12:49:50',
    '2003-09-28T12:49:50+00:00' => '2003-09-28T12:49:50',
    '2003-09-28T12:49:50-01:00' => '2003-09-28T13:49:50',
    '2003-09-28T12:49:50+01:00' => '2003-09-28T11:49:50',
    '2003-09-28T12:49:50-01:30' => '2003-09-28T14:19:50',
    '2003-09-28T12:49:50+01:30' => '2003-09-28T11:19:50',
    '2003-09-28T12:49:50+17:00' => '2003-09-27T19:49:50',
    '2003-09-28T12:49:50-17:00' => '2003-09-29T05:49:50',
);

for my $test (keys %tests) {
    ok(iso2ts($test), $tests{$test});
}

sub iso2ts { iso2dt($_[0])->iso8601 }
