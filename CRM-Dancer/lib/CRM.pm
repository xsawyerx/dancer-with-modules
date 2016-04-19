package CRM;
use Dancer2;

our $VERSION = '0.1';

set serializer => 'JSON';

use CRM::Controller::Authentication;
#use CRM::Controller::Calendar;

prefix undef;

hook before => sub {
    
    if (!session('user') && request->dispatch_path !~ m{^/login}) {
        forward '/authentication/login', { requested_path => request->dispatch_path };
    }
};

true;
