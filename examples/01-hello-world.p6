#!/usr/bin/env perl6

use lib 'lib';
use OpenCV::Mat;
use OpenCV::Highgui;
use OpenCV::Photo;

# Read image data
my $filename = "examples/images/aero1.jpg";
my OpenCV::Mat $img = imread($filename);
my $data = $img.data;
die "Could not read $filename" unless $data;

# Print dimensions
say "Matrix cols = " ~ $img.cols;
say "Matrix rows = " ~ $img.rows;

# Read grayscale version
my OpenCV::Mat $grayscale_img = imread($filename, 0);

# De-noise (i.e. remove noise) in a new cloned image
my OpenCV::Mat $denoised_img = $img.clone;
fastNlMeansDenoisingColored($img, $denoised_img, 10, 10, 7, 21);

# Show original image
namedWindow("Original", 1);
imshow("Original", $img);

# Show grayscale version
namedWindow("Grayscale", 0);
moveWindow("Grayscale", 100, 100);
resizeWindow("Grayscale", 320, 240);
imshow("Grayscale", $grayscale_img);

# Show denoised image
namedWindow("Denoised", 1);
imshow("Denoised", $denoised_img);

imwrite("denoised.png", $denoised_img);

# Wait for a keypress from the user
waitKey(0);

destroyAllWindows;
