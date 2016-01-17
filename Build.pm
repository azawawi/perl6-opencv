use Panda::Common;
use Panda::Builder;
use LibraryMake;
use Shell::Command;

class Build is Panda::Builder {
    method build($workdir) {
        if $*DISTRO.is-win {
          # On windows, let us install the bundled DLL version, Panda will
          # hopefully copy the DLL for us.
          say "Precompiled bundled OpenCV DLL will be installed";

          # Success
          return 1;
        }

        # on Unix, let us try to make it
        my $makefiledir = "$workdir/src";
        my $destdir = "$workdir/resources";
        mkpath $destdir;
        make($makefiledir, $destdir);
    }
}
