# OpenCV
[![Build Status](https://travis-ci.org/azawawi/perl6-opencv.svg?branch=master)](https://travis-ci.org/azawawi/perl6-opencv)

This provides a growing C++ wrapper for [OpenCV](http://opencv.org) API.

## Example

```Perl6
use v6;
use OpenCV::Highgui;

# Read the image from the disk
my $image = imread( "sample.png" );

# Show the image in a window
namedWindow( "Sample", 1 );
imshow( "Sample", $image );

# Wait for a key press to exit
waitKey;
```

For more examples, please see the [examples](examples) folder.

## OpenCV Installation

Please follow the instructions below based on your platform:

### Linux (Debian)

- To install OpenCV development libraries, please run:
```
    $ sudo apt-get install libopencv-dev
```

## Windows

A precompiled 64-bit windows DLL binary is already provided so it should work
on 64-bit windows operating systems.

## Installation

To install it using Panda (a module management tool bundled with Rakudo Star):

    panda update
    panda install OpenCV

## Testing

To run tests:

    prove -e "perl6 -Ilib"

## Development Notes

If you need to change the C++ to C library wrapper without doing a
`panda install .`,, please run:
```
$ (rm resources/*.so; cd src; ./Configure.pl6; make)
```

## Author

Ahmad M. Zawawi, azawawi on #perl6, https://github.com/azawawi/

## License

MIT License
