package Studio::Module::Calendar;

our $VERSION = '1.0';

use Dancer2;

prefix '/calendar';

get '/' => sub {...};

1;