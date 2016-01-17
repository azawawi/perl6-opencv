@echo off
set OPENCV_LIB=opencv_calib3d2411.lib opencv_contrib2411.lib opencv_core2411.lib opencv_features2d2411.lib opencv_flann2411.lib opencv_gpu2411.lib opencv_highgui2411.lib opencv_imgproc2411.lib  opencv_legacy2411.lib opencv_ml2411.lib opencv_nonfree2411.lib opencv_objdetect2411.lib opencv_ocl2411.lib opencv_photo2411.lib opencv_stitching2411.lib opencv_superres2411.lib opencv_ts2411.lib opencv_video2411.lib opencv_videostab2411.lib IlmImf.lib libjasper.lib libjpeg.lib libpng.lib libtiff.lib zlib.lib
set OPENCV_BUILD=D:\downloads\tools\Graphics\OpenCV\opencv-2.4.11\opencv\build
set OPENCV_INCLUDE=%OPENCV_BUILD%\include
set OPENCV_LIBPATH=%OPENCV_BUILD%\x64\vc12\staticlib
mkdir ..\resources
cl  /EHsc -I"%OPENCV_INCLUDE%" /nologo /MT /Ox /GL /DNDEBUG  /DWIN32 /DAO_ASSUME_WINDOWS98 libopencv-perl6.cpp /LD /DLL /link /LIBPATH:"%OPENCV_LIBPATH%\" user32.lib Gdi32.lib mswsock.lib rpcrt4.lib advapi32.lib psapi.lib iphlpapi.lib %OPENCV_LIB% /OUT:../resources/libopencv-perl6.dll