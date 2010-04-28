
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Dist::Zilla::PluginBundle::MSCHOUT',
                       'DISTNAME' => 'Dist-Zilla-PluginBundle-MSCHOUT',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.31'
                                               },
                       'AUTHOR' => 'Michael Schout <mschout@cpan.org>',
                       'BUILD_REQUIRES' => {
                                             'Module::Signature' => '0',
                                             'Test::More' => '0',
                                             'Socket' => '0'
                                           },
                       'ABSTRACT' => 'Use L<Dist::Zilla> like MSCHOUT does',
                       'EXE_FILES' => [],
                       'VERSION' => '0.14',
                       'PREREQ_PM' => {
                                        'Dist::Zilla::Plugin::PodWeaver' => '0',
                                        'Dist::Zilla::Role::PluginBundle::Easy' => '0',
                                        'Dist::Zilla::PluginBundle::Filter' => '0',
                                        'Pod::Weaver::Section::SourceGitHub' => '0',
                                        'Pod::Weaver::Section::BugsRT' => '0',
                                        'Moose' => '0',
                                        'Dist::Zilla::Plugin::AutoPrereq' => '0',
                                        'Dist::Zilla::Plugin::Bugtracker' => '0',
                                        'Dist::Zilla::Plugin::Repository' => '0',
                                        'Moose::Autobox' => '0',
                                        'Dist::Zilla::PluginBundle::Classic' => '0',
                                        'Dist::Zilla::Plugin::Signature' => '0',
                                        'Dist::Zilla' => '2.101040',
                                        'Dist::Zilla::Plugin::FakeRelease' => '0',
                                        'Dist::Zilla::Plugin::ArchiveRelease' => '0',
                                        'Dist::Zilla::Plugin::Homepage' => '0',
                                        'Dist::Zilla::Plugin::BumpVersionFromGit' => '0',
                                        'Dist::Zilla::PluginBundle::Git' => '0'
                                      },
                       'LICENSE' => 'perl'
                     );


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM}; 
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod}; 
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



