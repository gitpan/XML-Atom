# $Id: 02-feed.t,v 1.1 2003/09/08 03:11:18 btrott Exp $

use strict;

use Test;
use XML::Atom::Feed;

BEGIN { plan tests => 10 };

my $feed = XML::Atom::Feed->new(Stream => 't/samples/feed.xml');
ok($feed->title, 'dive into atom');
ok($feed->link, 'http://diveintomark.org/atom/');
ok($feed->modified, '2003-08-25T11:39:42Z');
ok($feed->tagline, '');
ok($feed->id, 'tag:diveintomark.org,2003:14');
ok($feed->generator, 'http://www.movabletype.org/?v=2.64');
ok($feed->copyright, 'Copyright (c) 2003, Atom User');

my @entries = $feed->entries;
ok(scalar @entries, 15);
my $entry = $entries[0];
ok($entry->title, 'Test');

my $entry = XML::Atom::Entry->new;
$entry->title('Foo');
$feed->add_entry($entry);

ok(scalar $feed->entries, 16);
