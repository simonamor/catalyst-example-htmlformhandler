package Forms::Form::Field::Postcode;

use strict;
use warnings;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Text';

#sub validate {
#    my ($self) = @_;
#
#    my $value = $self->value;
#
#    unless ($value =~ /^([A-PR-UWYZ][0-9][0-9]?|[A-PR-UWYZ][A-HK-Y][0-9][0-9]?|[A-PR-UWYZ][0-9][A-HJKPSTUW]|[A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]) ?([0-9][ABD-HJLNP-UWXYZ]{2})$/i) {
#        $self->add_error("Postcode doesn't look correctly formatted");
#
#    }
#}

apply(
    [
        {
            transform => sub {
                my $value = shift;
                if ($value =~ /^([A-PR-UWYZ][0-9][0-9]?|[A-PR-UWYZ][A-HK-Y][0-9][0-9]?|[A-PR-UWYZ][0-9][A-HJKPSTUW]|[A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]) ?([0-9][ABD-HJLNP-UWXYZ]{2})$/i) {
                    $value = uc("$1 $2");
                }
                return $value;
            }
        },
        {
            check => sub {
                my $value = shift;
                $value =~ /^([A-PR-UWYZ][0-9][0-9]?|[A-PR-UWYZ][A-HK-Y][0-9][0-9]?|[A-PR-UWYZ][0-9][A-HJKPSTUW]|[A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]) ?([0-9][ABD-HJLNP-UWXYZ]{2})$/i;
            },
            message => sub {
                my ( $value, $field ) = @_;
                return [ "Postcode doesn't look quite right.", $value ];
            }
        },
    ]
);

__PACKAGE__->meta->make_immutable;
use namespace::autoclean;

1;
