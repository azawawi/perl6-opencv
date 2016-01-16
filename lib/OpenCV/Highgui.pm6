
use v6;

unit module OpenCV::Highgui;

use NativeCall;
use OpenCV::NativeCall;
use OpenCV::Mat;

# http://docs.opencv.org/2.4.11/modules/highgui/doc/reading_and_writing_images_and_video.html?highlight=imread#cv2.imread
sub imread(Str $filename, Int $flags = 1) returns OpenCV::Mat is export {
  my Pointer $native_obj = cv_highgui_imread($filename, $flags);
  return OpenCV::Mat.new( native_obj => $native_obj );
}

sub imshow(Str $winname, OpenCV::Mat $mat) is export {
  cv_highgui_imshow($winname, $mat.native_obj);
}

sub namedWindow(Str $winname, Int $flags = 1) is export {
  cv_highgui_namedWindow($winname, $flags);
}

sub moveWindow(Str $winname, Int $x, Int $y) is export {
  cv_highgui_moveWindow($winname, $x, $y);
}

sub waitKey(Int $delay = 0) is export {
  cv_highgui_waitKey($delay);
}