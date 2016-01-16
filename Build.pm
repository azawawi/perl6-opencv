use Panda::Common;
use Panda::Builder;
use LibraryMake;
use Shell::Command;

class Build is Panda::Builder {
    method build($workdir) {
        my $makefiledir = "$workdir/src";
        my $destdir = "$workdir/resources";
        mkpath $destdir;
        make($makefiledir, $destdir);
    }
}