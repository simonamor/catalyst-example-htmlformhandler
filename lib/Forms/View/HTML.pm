package Forms::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,

    INCLUDE_PATH => [
       Forms->path_to('templates', 'webapp'), 
    ],
);

=head1 NAME

Forms::View::HTML - TT View for Forms

=head1 DESCRIPTION

TT View for Forms.

=head1 SEE ALSO

L<Forms>

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
