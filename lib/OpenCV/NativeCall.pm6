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

sub imread(Str $filename, int32 $flags)
  returns Pointer
  is native(&library)
  is export
  { * }

sub mat_rows(Pointer $img)
  returns uint32
  is native(&library)
  is export
  { * }

sub mat_cols(Pointer $img)
  returns uint32
  is native(&library)
  is export
  { * }

sub mat_data(Pointer $img)
  returns Pointer
  is native(&library)
  is export
  { * }

sub mat_clone(Pointer $img)
  returns Pointer
  is native(&library)
  is export
  { * }

sub imwrite(Str $filename, Pointer $img)
  returns uint32 
  is native(&library)
  is export
  { * }

# void imshow(const string& winname, InputArray mat)
sub imshow(Str $filename, Pointer $mat)
  is native(&library)
  is export
  { * }

# void namedWindow(const string& winname, int flags=WINDOW_AUTOSIZE )
sub namedWindow(Str $winname, uint32 $flags)
  is native(&library)
  is export
  { * }

# int waitKey(int delay=0)¶
sub waitKey(uint32 $delay)
  returns int32
  is native(&library)
  is export
  { * }

# TODO try num32 (C float) for $h and $hColor didnt work 
sub fastNlMeansDenoisingColored(
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
