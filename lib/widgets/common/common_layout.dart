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
                height: Dimension.screenHeight*0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimension.screenHeight*0.04,),
                    Text(
                      hedingTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: fontFamily ?? '',
                        fontWeight: FontWeight.bold,
                        fontSize: Dimension.textSize_20,
                        color: AppColors.heddingColor,
                      ),
                    ),
                    SizedBox(
                      height: Dimension.height10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimension.width10),
                      child: Text(
                        hedingSubTitle,
                        textAlign: TextAlign.center,
                        maxLines: maxLine,
                        style: TextStyle(
                          fontFamily: fontFamily ?? '',
                          fontWeight: FontWeight.w400,
                          fontSize: Dimension.textSize_11,
                          color: AppColors.subHeddingColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimension.height20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimension.screenHeight*0.55,
                child: body,
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          // height: isGrayButtonAvelable! ? Dimension.bottomButtonsMaxHeight : Dimension.bottomButtonsMinHeight,
          // height: isGrayButtonAvelable! ? 140 : 90,
          height: isGrayButtonAvelable! ? Dimension.screenHeight*0.215 : Dimension.screenHeight*0.15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              bottomButton,
              SizedBox(
                height: Dimension.height20,
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
      padding: EdgeInsets.only(bottom: Dimension.height20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'National Saving Bank\n',
              style: TextStyle(
                // fontFamily: fontFamily ?? '',
                fontWeight: FontWeight.w400,
                fontSize: Dimension.textSize_10,
                color: AppColors.bottomSubHeddingColor,
              ),
            ),
            TextSpan(
              text: 'The safest place for your money',
              style: TextStyle(
                // fontFamily: fontFamily ?? '',
                fontWeight: FontWeight.w400,
                fontSize: Dimension.textSize_8,
                color: AppColors.bottomSubHeddingColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
