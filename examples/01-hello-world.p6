#!/usr/bin/env perl6

#
# How to run it:
# $ make && LD_LIBRARY_PATH=. examples/hello-world.p6
#

use lib 'lib';
use OpenCV::NativeCall;

# Read image data
my $filename = "examples/images/aero1.jpg";
my $img = imread($filename, 1);
my $data = mat_data($img);
die "Could not read $filename" unless $data;

# Print dimensions
say "Matrix cols = " ~ mat_cols($img);
say "Matrix rows = " ~ mat_rows($img);

# De-noise (i.e. remove noise) in a new cloned image
my $denoised_img = mat_clone($img);
fastNlMeansDenoisingColored($img, $denoised_img, 10, 10, 7, 21);

# Show original image
namedWindow("Original", 1);
imshow("Original", $img);

# Show denoised image
namedWindow("Denoised", 1);
imshow("Denoised", $denoised_img);

# Wait for a keypress from the user
waitKey(0);
