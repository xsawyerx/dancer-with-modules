package Studio::Role::Error;

use Moo::Role;

sub throw_error {
    my ($error_code) = @_;
    
    return {errors => [{code => request->path, title => $error_code, description => $error_code.'_DESC'}]}
}

1;