import 'package:flutter/material.dart';

class SizedConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

//Get the proportionate heigth as per screen size
double getProportionateScreenHeight(double inputHeigth) {
  double screenHeight = SizedConfig.screenHeight;
  return (inputHeigth / 812.0) * screenHeight;
}

double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizedConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth;
}
