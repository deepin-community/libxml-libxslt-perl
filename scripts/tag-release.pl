#!/usr/bin/perl

use strict;
use warnings;

use IO::All qw/ io /;

my ($version) =
    ( map { m{\$VERSION *= *'([^']+)'} ? ($1) : () }
        io->file('LibXSLT.pm')->getlines() );

if ( !defined($version) )
{
    die "Version is undefined!";
}

my @cmd = (
    "git", "tag", "-m", "Tagging the XML-LibXSLT release as $version",
    "XML-LibXSLT-$version",
);

print join( " ", map { /\s/ ? qq{"$_"} : $_ } @cmd ), "\n";
exec(@cmd);
