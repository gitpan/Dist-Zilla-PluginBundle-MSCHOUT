package Dist::Zilla::PluginBundle::MSCHOUT;
BEGIN {
  $Dist::Zilla::PluginBundle::MSCHOUT::VERSION = '0.15';
}

# ABSTRACT: Use L<Dist::Zilla> like MSCHOUT does

use Moose;
use Moose::Autobox;

with 'Dist::Zilla::Role::PluginBundle::Easy';

sub configure {
    my $self = shift;

    my $args = $self->payload;

    my $upload = $$args{no_upload} ? 0 : 1;

    my @remove = qw(PodVersion);

    # if not uploading, remove the upload plugin, and the confirmation plugin
    unless ($upload) {
        push @remove, 'UploadToCPAN', 'ConfirmRelease';
    }

    $self->add_bundle(Filter => {
        bundle => '@Classic',
        remove => \@remove
    });

    # add FakeRelease plugin if uploads are off
    unless ($upload) {
        $self->add_plugins('FakeRelease');
    }

    $self->add_plugins(
        qw(
            AutoPrereq
            PodWeaver
            Repository
            Bugtracker
            Homepage
            Signature
            ArchiveRelease
        ),
        [
            BumpVersionFromGit => {
                first_version => '0.01'
            }
        ]
    );

    $self->add_bundle('Git');

    $self->add_plugins('Git::CommitBuild');

}

__PACKAGE__->meta->make_immutable;
no Moose;
1;



=pod

=head1 NAME

Dist::Zilla::PluginBundle::MSCHOUT - Use L<Dist::Zilla> like MSCHOUT does

=head1 VERSION

version 0.15

=head1 DESCRIPTION

This is the pluginbundle that MSCHOUT uses. Use it as:

 [@MSCHOUT]

Optionally, for a dist that you do not want to upload to CPAN:
 [@MSCHOUT]
 no_upload = 1

It's equivalent to:

 [@Filter]
 bundle = @Classic
 remove = PodVersion

 [@Git]
 [ArchiveRelease]
 [AutoPrereq]
 [Bugtracker]
 [BumpVersionFromGit]
 [Homepage]
 [NextRelease]
 [PodWeaver]
 [Repository]
 [Signature]

In addition, if C<no_upload> is true, then C<UploadToCPAN> is replaced with C<FakeRelease>.

=for Pod::Coverage configure

=head1 AUTHOR

  Michael Schout <mschout@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Michael Schout.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

