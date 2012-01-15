
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "API to access the data of a Perl distribution file or directory",
  "AUTHOR" => "Torsten Raudssus <torsten\@raudss.us> L<http://raudss.us/>",
  "BUILD_REQUIRES" => {
    "Test::More" => "0.96"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dist-Data",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dist::Data",
  "PREREQ_PM" => {
    "Archive::Any" => "0.0932",
    "CPAN::Meta" => "2.113640",
    "DateTime::Format::Epoch" => "0.13",
    "Dist::Metadata" => "0.922",
    "File::Find::Object" => "0.2.3",
    "File::Temp" => "0.22",
    "Module::Extract::Namespaces" => "0.14",
    "Moo" => "0.009013"
  },
  "VERSION" => "0.002",
  "test" => {
    "TESTS" => "t/*.t"
  }
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



