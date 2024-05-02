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

// Widget builder(BuildContext context){
//   double height = MediaQuery.of(context).size.height;
//   double width = MediaQuery.of(context).size.width;
// }

  // static BuildContext buildContext;
  // double height = MediaQuery.of(context).size.height;
}
