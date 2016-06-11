use strict;
use warnings;
package URI::Encode::XS;

use XSLoader;
use Exporter 5.57 'import';

our $VERSION     = '0.07';
our @EXPORT_OK   = ( qw/uri_encode uri_decode/ );

XSLoader::load('URI::Encode::XS', $VERSION);

1;
__END__
=head1 NAME

URI::Encode::XS - a Perl URI encoder/decoder using C

=head1 SYNOPSIS

  use URI::Encode::XS qw/uri_encode uri_decode/;

  my $encoded = uri_encode($data);
  my $decoded = uri_decode($encoded);

=head1 DESCRIPTION

This is a Perl URI encoder/decoder written in XS based on L<RFC3986|https://tools.ietf.org/html/rfc3986>.
This module always encodes characters that are not unreserved.

As of version 0.07, the C<bench> script shows it to be significantly faster
than C<URI::Escape>:

            Rate escape encode
escape   53944/s     --   -98%
encode 3017653/s  5494%     --
              Rate unescape   decode
unescape   74567/s       --     -97%
decode   2697001/s    3517%       --

However this is just one string - the fewer encoded/decoded characters are
in the string, the closer the benchmark is likely to be (see C<bench> for
details of the benchmark). Different hardware will yield different results.

Another fast encoder/decoder which supports custom escape lists, is
L<URI::XSEscape|https://metacpan.org/pod/URI::XSEscape>.

=head1 INSTALLATION

  $ cpan URI::Encode::XS

Or

  $ git clone https://github.com/dnmfarrell/URI-Encode-XS
  $ cd URI-Encode-XS
  $ perl Makefile.PL
  $ make
  $ make test
  $ make install

=head1 CONTRIBUTORS

=over4

=item L<Christian Hansen|https://github.com/chansen>

=item Jesse DuMond

=back

=head1 REPOSITORY

L<https://github.com/dnmfarrell/URI-Encode-XS>

=head1 LICENSE

See LICENSE

=head1 AUTHOR

E<copy> 2016 David Farrell

=cut
