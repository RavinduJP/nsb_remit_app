import 'package:flutter/cupertino.dart';

import '../../utils/constants/app_colors.dart';

class CommonText extends StatelessWidget {
  const CommonText({
    super.key,
    required this.text,
    required this.whiteTextSize,
    this.alignment,
    this.textColor,
  });

  final String text;
  final double whiteTextSize;
  final Alignment? alignment;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        // textAlign: TextAlign.start,
        style: TextStyle(
            color: textColor ?? AppColors.heddingColor,
            fontSize: whiteTextSize,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
