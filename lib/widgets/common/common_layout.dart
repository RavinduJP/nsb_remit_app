import 'package:flutter/material.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';
import 'package:nsb_remit/utils/constants/dimensions.dart';


class CommonLayout extends StatelessWidget {
  const CommonLayout({
    super.key,
    this.physics,
    this.maxLine,
    required this.hedingTitle,
    required this.hedingSubTitle,
    this.bottomSubTitleOne,
    this.bottomSubTitleTwo,
    this.fontFamily,
    required this.body,
    this.image,
  });

  final ScrollPhysics? physics;
  final int? maxLine;
  final String hedingTitle;
  final String hedingSubTitle;
  final String? bottomSubTitleOne;
  final String? bottomSubTitleTwo;
  final String? fontFamily;
  final Widget body;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimension.screenWidthFactor),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hedingTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: fontFamily ?? '',
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: AppColors.heddingColor,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                hedingSubTitle,
                textAlign: TextAlign.center,
                maxLines: maxLine,
                style: TextStyle(
                  fontFamily: fontFamily ?? '',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  color: AppColors.subHeddingColor,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(child: body),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: bottomSubTitleOne ?? "National Saving Bank\n",
                  style: TextStyle(
                    fontFamily: fontFamily ?? '',
                    fontWeight: FontWeight.w400,
                    fontSize: 10.0,
                    color: AppColors.buttomSubHeddingColor,
                  ),
                ),
                TextSpan(
                  text: bottomSubTitleTwo ??
                      "The safest place for your money",
                  style: TextStyle(
                    fontFamily: fontFamily ?? '',
                    fontWeight: FontWeight.w400,
                    fontSize: 8.0,
                    color: AppColors.buttomSubHeddingColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
