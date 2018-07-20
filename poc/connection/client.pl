#!/usr/bin/env perl

use strict;
use warnings;

use Net::OpenSSH;
use MIME::Base64;
use JSON::XS;
use Data::Dumper;

# $Net::OpenSSH::debug |= 16;

my $command = {
    name    => "/etc/motd",
    content => "blah\n",
    owner   => "root",
    group   => "root",
    mode    => "0644",
};

my $ssh = Net::OpenSSH->new("localhost", user => 'root', password => 'ZZZ', );

my ($in, $out, $pid) = $ssh->open2("perl /home/jan/Projekte/rex/rex2/poc/connection/server.pl");

print $in encode_base64(encode_json($command), "") . "\n";
my $res = <$out>;
chomp $res;
my $answer = decode_json(decode_base64($res));

print Dumper $answer;
print "\n";

waitpid($pid, 0);
