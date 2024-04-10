import 'package:flutter/widgets.dart';

import '../constants/dimensions.dart';

class ResponsiveLayoutMixin {
  double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  double getContentWidth(BuildContext context) =>
      getContentWidth(context) * Dimension.screenWidthFactor;

  double getSoftKeyboardHeight(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom;

  double getSafeAreaPadding(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  double getContentHeight(BuildContext context,
      {bool safeAreaPadding = true, bool keyBoardHeight = true}) {
    var heightToReturn = getScreenHeight(context);

    if (safeAreaPadding) {
      heightToReturn -= getSafeAreaPadding(context);
    }

    if (keyBoardHeight) {
      heightToReturn += getSoftKeyboardHeight(context);
    }

    return heightToReturn;
  }
}
