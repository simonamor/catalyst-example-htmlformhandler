use strict;
use warnings;

use Forms;

my $app = Forms->apply_default_middlewares(Forms->psgi_app);
$app;

