# OpenCV
[![Build Status](https://travis-ci.org/azawawi/perl6-opencv.svg?branch=master)](https://travis-ci.org/azawawi/perl6-opencv)

This is an experimental attempt for a decent C++ API binding for [OpenCV](http://opencv.org).

## Usage

please see the [examples](examples) folder.

## OpenCV Installation

Please follow the instructions below based on your platform:

### Linux (Debian)

- To install OpenCV development libraries, please run:
```
    $ sudo apt-get install libopencv-dev
```

## Windows

TODO add windows support and instructions

## Installation

To install it using Panda (a module management tool bundled with Rakudo Star):

    panda update
    panda install OpenCV

## Testing

To run tests:

    prove -e 'perl6 -Ilib'

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
