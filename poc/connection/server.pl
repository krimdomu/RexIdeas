#!/usr/bin/env perl

use strict;
use warnings;

use JSON::XS;
use MIME::Base64;
use Data::Dumper;

$|++;

use constant {
    UNCHANGED => 0,
    CREATED   => 1,
    REMOVED   => 2,
    UPDATED   => 3,
    ERROR     => 4,
};

while(my $line = <STDIN>) {
    my $ref = decode_json(decode_base64($line));
    
    my $answer = {
        result => UNCHANGED,
    };

    print encode_base64(encode_json($answer), "") . "\n";

    # demo exit
    exit 0;
}
