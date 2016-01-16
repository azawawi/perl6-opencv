
#include <stdio.h>

#include <opencv2/opencv.hpp>

extern "C" {

  ulong imread(char *filename, int flags ) {
    cv::Mat mat = cv::imread(filename, flags);
    return (ulong)new cv::Mat(mat);
  }
  
  int mat_rows(char *mat) {
    cv::Mat *t = (cv::Mat *)mat;
    return t->rows;
  }

  int mat_cols(char *mat) {
    cv::Mat *t = (cv::Mat *)mat;
    return t->cols;
  }

  uchar* mat_data(char *mat) {
    cv::Mat *t = (cv::Mat *)mat;
    return t->data;
  }

  ulong mat_clone(char *mat) {
    cv::Mat *t = (cv::Mat *)mat;
    return (ulong)(new cv::Mat(t->clone()));
  }

  void imshow(char *winname, ulong mat) {
    cv::Mat& matz   = *((cv::Mat*)mat);
    cv::imshow(winname, matz);
  }

  void namedWindow(char *winname, int flags ) {
    cv::namedWindow(winname, flags);
  }

  void waitKey(int delay) {
    cv::waitKey(delay);
  }
  
  void fastNlMeansDenoisingColored(
    char* src,
    char* dst,
    int h,
    int hColor,
    int templateWindowSize,
    int searchWindowSize
  ) 
  {
    cv::Mat& srcMat = *((cv::Mat*)src);
    cv::Mat& dstMat = *((cv::Mat*)dst);
    cv::fastNlMeansDenoisingColored(
      srcMat, dstMat, h, hColor, templateWindowSize, searchWindowSize);
  }

}
