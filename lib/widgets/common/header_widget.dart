import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';
import 'package:nsb_remit/widgets/common/common_text.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50.h,
      //   height: ResponsiveLayoutMixin().getContentHeight(context),
      //   width: ResponsiveLayoutMixin().getContentWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Image.asset('assets/images/header_icon.png'),
          ),
          Row(
            children: [
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: "Good Morning",
                    whiteTextSize: 10.r,
                    fontWeight: FontWeight.w400,
                    textColor: AppColors.whiteColor,
                  ),
                  CommonText(
                    text: 'Sithara Geethal',
                    whiteTextSize: 10.r,
                    fontWeight: FontWeight.w700,
                    textColor: AppColors.whiteColor,
                  ),
                ],
              ),
               SizedBox(
                width: 10.h,
              ),
              Container(
                height: 45.h,
                width: 45.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.notificationBackColor,
                ),
                child: const Icon(
                    color: AppColors.whiteColor,
                    size: 20.0,
                    CupertinoIcons.bell_fill),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
