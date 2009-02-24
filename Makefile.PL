use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Games::Go::Play',
    AUTHOR              => 'Junichiro Tobe <junichiro.tobe@gmail.com>',
    VERSION_FROM        => 'lib/Games/Go/Play.pm',
    ABSTRACT_FROM       => 'lib/Games/Go/Play.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'version'    => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Games-Go-Play-*' },
);
