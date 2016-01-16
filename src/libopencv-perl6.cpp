
#include <stdio.h>

#include <opencv2/opencv.hpp>

extern "C" {

  ulong cv_highgui_imread(char *filename, int flags ) {
    cv::Mat mat = cv::imread(filename, flags);
    return (ulong)new cv::Mat(mat);
  }
  
  int cv_highgui_imwrite(char *filename, char *mat) {
    cv::Mat& matz   = *((cv::Mat*)mat);
    return cv::imwrite(filename, matz);
  }

  int cv_mat_rows(char *mat) {
    cv::Mat *t = (cv::Mat *)mat;
    return t->rows;
  }

  int cv_mat_cols(char *mat) {
    cv::Mat *t = (cv::Mat *)mat;
    return t->cols;
  }

  uchar* cv_mat_data(char *mat) {
    cv::Mat *t = (cv::Mat *)mat;
    return t->data;
  }

  ulong cv_mat_clone(char *mat) {
    cv::Mat *t = (cv::Mat *)mat;
    return (ulong)(new cv::Mat(t->clone()));
  }

  void cv_highgui_imshow(char *winname, ulong mat) {
    cv::Mat& matz   = *((cv::Mat*)mat);
    cv::imshow(winname, matz);
  }

  void cv_highgui_namedWindow(char *winname, int flags ) {
    cv::namedWindow(winname, flags);
  }

  void cv_highgui_moveWindow(char *winname, int x, int y) {
    cv::moveWindow(winname, x, y);
  }

  void cv_highgui_resizeWindow(char *winname, int width, int height) {
    cv::moveWindow(winname, width, height);
  }

  void cv_highgui_waitKey(int delay) {
    cv::waitKey(delay);
  }

  void cv_highgui_destroyWindow(char *winname) {
    cv::destroyWindow(winname);
  }

  void cv_highgui_destroyAllWindows() {
    cv::destroyAllWindows();
  }

  void cv_highgui_createTrackbar(char *trackbarname, char *winname, int value, int count, cv::TrackbarCallback onChange) {
    static int *pValue = new int;
    *pValue = value;
    cv::createTrackbar(trackbarname, winname, pValue, count, onChange);
  }

  void cv_highgui_rectangle(
      ulong mat,
      int x1, int y1, int  x2, int y2,
      int b, int g, int r,
      int thickness,
      int lineType,
      int shift
  ) {
    cv::Mat& matz   = *((cv::Mat*)mat);
    cv::rectangle(
        matz,
        cv::Point(x1, y1),
        cv::Point(x2, y2),
        cv::Scalar(b, g, r),
        thickness,
        lineType,
        shift
    );
  }

  void cv_photo_fastNlMeansDenoisingColored(
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
