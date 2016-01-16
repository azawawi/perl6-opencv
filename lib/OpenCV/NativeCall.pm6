use v6;

unit module OpenCV::NativeCall;

use NativeCall;
use LibraryMake;

# Find our compiled library.
sub library {
    my $so = get-vars('')<SO>;
    return ~(%?RESOURCES{"libopencv-perl6$so"});
}

# 'is native(&library)' is needed so it will call the function and resolve the
# library at compile time, while we need it to happen at runtime (because
# this library is installed *after* being compiled).

sub cv_mat_rows(Pointer $img)
  returns uint32
  is native(&library)
  is export
  { * }

sub cv_mat_cols(Pointer $img)
  returns uint32
  is native(&library)
  is export
  { * }

sub cv_mat_data(Pointer $img)
  returns Pointer
  is native(&library)
  is export
  { * }

sub cv_mat_clone(Pointer $img)
  returns Pointer
  is native(&library)
  is export
  { * }

sub cv_highgui_imread(Str $filename, int32 $flags)
  returns Pointer
  is native(&library)
  is export
  { * }

sub cv_highgui_imwrite(Str $filename, Pointer $img)
  returns uint32 
  is native(&library)
  is export
  { * }

sub cv_highgui_imshow(Str $filename, Pointer $mat)
  is native(&library)
  is export
  { * }

sub cv_highgui_namedWindow(Str $winname, uint32 $flags)
  is native(&library)
  is export
  { * }

sub cv_highgui_waitKey(uint32 $delay)
  returns int32
  is native(&library)
  is export
  { * }

sub cv_photo_fastNlMeansDenoisingColored(
    Pointer $src,
    Pointer $dst,
    uint32 $h, 
    uint32 $hColor,
    uint32 $templateWindowSize,
    uint32 $searchWindowSize
  )
  returns int32
  is export
  is native(&library)
  { * }
