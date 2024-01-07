import 'package:flutter/widgets.dart';

class SizeConfig {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double blockSizeHorizontal = 0.0;
  static double blockSizeVertical = 0.0;

  static double textMultiplier = 0.0;
  static double imageSizeMultiplier = 0.0;
  static double heightMultiplier = 0.0;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    textMultiplier = blockSizeVertical;
    imageSizeMultiplier = blockSizeHorizontal;
    heightMultiplier = blockSizeVertical;
  }

  static double get screenWidthStatic => screenWidth;
  static double get screenHeightStatic => screenHeight;
  static double get blockSizeHorizontalStatic => blockSizeHorizontal;
  static double get blockSizeVerticalStatic => blockSizeVertical;
  static double get textMultiplierStatic => textMultiplier;
  static double get imageSizeMultiplierStatic => imageSizeMultiplier;
  static double get heightMultiplierStatic => heightMultiplier;
}
