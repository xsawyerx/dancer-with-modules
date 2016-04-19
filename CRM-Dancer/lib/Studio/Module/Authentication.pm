package Studio::Module::Authentication;

use strict;
use warnings;

use Dancer2;

prefix '/authentication';

use Moo;
use strictures 2;
use namespace::clean;

with "Studio::Role::Error";

$Studio::Module::Authentication::VERSION = '1.0';

=head1 NAME

Studio::Module::Authentication

=head1 DESCRIPTION

Handles user authentication

=cut

any '/login' => sub {
    # Validate the username and password they supplied
    if (param('user') eq 'bob' && param('pass') eq 'letmein') {
        session user => param('user');
        return {data => {type => 'user', id => 1, attributes => {name => 'bob'}}};
    } else {
        return throw_error('INVALID_CREDENTIALS');
    }
};

get '/logout' => sub {
    session user => undef;
    to_json({ok => 1});
};

1;