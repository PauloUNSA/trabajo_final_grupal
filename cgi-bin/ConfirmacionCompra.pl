#!/usr/bin/perl
use strict;
use warnings;
use CGI qw(:standard);
my $title= param('title');
my $titleEdit = param('titleEdit');
my $body= param('body');
my $bodyEdit = param('bodyEdit');
print "Content-type: text/html\n\n";
print <<HTML;
<!DOCTYPE html>
<html><head><title>New Wiki</title></head>
HTML
