
use strict;
use warnings;



use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Dist::Zilla::PluginBundle::MSCHOUT',
                       'DISTNAME' => 'Dist-Zilla-PluginBundle-MSCHOUT',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.11'
                                               },
                       'AUTHOR' => 'Michael Schout <mschout@cpan.org>',
                       'BUILD_REQUIRES' => {},
                       'ABSTRACT' => 'Use L<Dist::Zilla> like MSCHOUT does',
                       'EXE_FILES' => [],
                       'VERSION' => '0.10',
                       'PREREQ_PM' => {
                                        'Dist::Zilla::Plugin::PodWeaver' => '0',
                                        'Dist::Zilla::Role::PluginBundle' => '0',
                                        'Dist::Zilla::Plugin::AutoPrereq' => '0',
                                        'Dist::Zilla::Plugin::Bugtracker' => '0',
                                        'Dist::Zilla::Plugin::Repository' => '0',
                                        'Dist::Zilla::Plugin::NextRelease' => '0',
                                        'Moose::Autobox' => '0',
                                        'Test::More' => '0',
                                        'Dist::Zilla::Plugin::Signature' => '0',
                                        'Dist::Zilla::PluginBundle::Filter' => '0',
                                        'Dist::Zilla::Plugin::Homepage' => '0',
                                        'Dist::Zilla::PluginBundle::Git' => '0',
                                        'Moose' => '0'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



