use Panda::Common;
use Panda::Builder;
use LibraryMake;
use Shell::Command;

class Build is Panda::Builder {
    method build($workdir) {
        if $*DISTRO.is-win {
          say "Precompiled binary will be used. Disabling build on windows";
          return;
        }
        my $makefiledir = "$workdir/src";
        my $destdir = "$workdir/resources";
        mkpath $destdir;
        make($makefiledir, $destdir);
    }
}