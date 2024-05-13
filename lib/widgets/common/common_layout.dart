import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    this.bottomButton = const SizedBox(),
    this.isGrayButtonAvelable = false,
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
  final Widget bottomButton;
  final bool? isGrayButtonAvelable;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimension.screenWidthFactor,
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                height: 140.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      hedingTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: fontFamily ?? '',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.r,
                        color: AppColors.heddingColor,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        hedingSubTitle,
                        textAlign: TextAlign.center,
                        maxLines: maxLine,
                        style: TextStyle(
                          fontFamily: fontFamily ?? '',
                          fontWeight: FontWeight.w400,
                          fontSize: 11.r,
                          color: AppColors.subHeddingColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 380.h,
                child: body,
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          // height: isGrayButtonAvelable! ? Dimension.bottomButtonsMaxHeight : Dimension.bottomButtonsMinHeight,
          // height: isGrayButtonAvelable! ? 140 : 90,
          height: isGrayButtonAvelable! ? 160.h : 107.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              bottomButton,
              SizedBox(
                height: 20.h,
              ),
              const BottomNavigationText(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavigationText extends StatelessWidget {
  const BottomNavigationText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'National Saving Bank\n',
              style: TextStyle(
                // fontFamily: fontFamily ?? '',
                fontWeight: FontWeight.w400,
                fontSize: 10.h,
                color: AppColors.bottomSubHeddingColor,
              ),
            ),
            TextSpan(
              text: 'The safest place for your money',
              style: TextStyle(
                // fontFamily: fontFamily ?? '',
                fontWeight: FontWeight.w400,
                fontSize: 8.h,
                color: AppColors.bottomSubHeddingColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
