package Forms::Controller::Root;
use Moose;
use namespace::autoclean;

use HTML::FormHandler;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

Forms::Controller::Root - Root Controller for Forms

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $form = HTML::FormHandler->new(
        field_list => [
            name => {
                do_wrapper => 0,
                type => "Text",
                required => 1,
                messages => { required => 'You must enter a name' },
                tags => {
                    after_element => '<br>'
                },
            },
            postcode => {
                do_wrapper => 0,
                type => "+Forms::Form::Field::Postcode",
                required => 1,
                messages => { required => 'You must enter a postcode' },
                tags => {
                    after_element => '<br>'
                },
            },
            email => {
                do_wrapper => 0,
                type => "Email",
                required => 1,
                tags => {
                    after_element => '<br>'
                },
            },
            submit => {
                do_wrapper => 0,
                type => "Submit",
                value => "Submit"
            },
        ],
    );

    my $p = $c->request->params;

    $form->process( params => $p, );
    $c->stash( form => $form );
    $c->stash( params => $p );

    $c->stash( template => "index.html" );
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Catalyst developer

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
