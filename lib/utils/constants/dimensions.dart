import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimension {
  Dimension._();

  static const screenWidthFactor = 8.0;
  static const formTopMargin = 50.0;
  static const formAndSubheddingGap = 25.0;
  static const formHeadingBottomMargin = 30.0;
  static const gapBetweenTextFields = 22.0;
  static const commonElevatedButtonWidthFactor =
      Dimension.screenWidthFactor * 0.8;
  static const outlineInputBorderRadius = 8.0;
  static const selfieImageHeight = 410.0;
  static const selfieImageWidth = 270.0;
  static const passportImageHeight = 220.0;
  static const passportImageWidth = 305.0;
  static const visaPageImageHeight = 220.0;
  static const visaPageImageWidth = 305.0;
  static const proofDocumentImageHeight = 410.0;
  static const proofDocumentImageWidth = 270.0;

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double heddingereaHeight = screenHeight / 6.73;
  static double footerereaHeight = screenHeight / 32.15;

// bottom button heights
  static double bottomButtonsMaxHeight = screenHeight / 6.7;
  static double bottomButtonsMinHeight = screenHeight / 16.0;

//text formfield heights
  static double textFormFieldHeight = screenHeight / 13.6;

  //bottom sheet heights
  static double bottomSheetHeight = screenHeight / 2.8;
  static double bottomSheetIconHeight = screenHeight / 10.6;

  //sign in button sizes
  static double signInButtonHeight = screenHeight / 16.0;
  static double signInButtonWidth = screenWidth / 1.87;

// text sizes
static double textSize_8 = screenHeight / 235.8;
static double textSize_10 = screenHeight / 70.74;
static double textSize_11 = screenHeight / 64.30;
static double textSize_12 = screenHeight / 59.0;
  static double textSize_14 = screenHeight / 50.5;
  static double textSize_25 = screenHeight / 28.3;
  static double textSize_20 = screenHeight / 35.4;

//dynamic height padding & margins
  static double height3 = screenHeight / 141.48;
  static double height5 = screenHeight / 141.48;
  static double height8 = screenHeight / 88.43;
  static double height10 = screenHeight / 53.33;
  static double height15 = screenHeight / 47.16;
  static double height20 = screenHeight / 35.37;
  static double height25 = screenHeight / 28.29;
  static double height30 = screenHeight / 23.58;
  static double height40 = screenHeight / 8.23;

  //dynamic width padding & margins
  static double width5 = screenWidth / 82.28;
  static double width10 = screenWidth / 41.14;
  static double width15 = screenWidth / 27.43;
  static double width20 = screenWidth / 20.57;
  static double width30 = screenWidth / 13.71;
  static double width40 = screenWidth / 10.29;
  static double width50 = screenWidth / 10.29;

static double nsbLogoSize = screenHeight / 14.15;
}

class Size {
  Size._();
  static const double _referenceHeight = 707.4;
  static const double _referenceWidth = 411.4;

  static double getHeight(BuildContext context, double factor) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight / _referenceHeight * factor;
  }

  static double getWidth(BuildContext context, double factor) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth / _referenceWidth * factor;
  }
}
