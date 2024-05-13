import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
import 'package:nsb_remit/widgets/common/common_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/constants/routes.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final _otpVerificationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hedingTitle: 'OTP Verification',
      hedingSubTitle:
          'We have send to OTP to \n +94011646038 & youremail@gmail.com \n Please check your mobile and enter the OTP code ',
      maxLine: 4,
      body: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.w),
            child: PinCodeTextField(
              controller: _otpVerificationController,
              appContext: context,
              length: 4,
              obscureText: false,
              obscuringCharacter: '*',
              textStyle: TextStyle(
                color: AppColors.heddingColor,
                fontSize: 20.r,
                fontWeight: FontWeight.w600,
              ),
              hintCharacter: '*',
              hintStyle: TextStyle(
                  color: AppColors.heddingColor,
                  fontSize: 20.r,
                  fontWeight: FontWeight.w600),
              showCursor: false,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                fieldHeight: 36.h,
                fieldWidth: 50.w,
                inactiveColor: AppColors.subHeddingColor,
                activeColor: AppColors.subHeddingColor,
                selectedColor: AppColors.subHeddingColor,
                disabledColor: AppColors.subHeddingColor,
              ),
              cursorHeight: 20.h,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(text: 'Didn’t receive OTP? ', whiteTextSize: 12.r),
              GestureDetector(
                onTap: () {},
                child: CommonText(
                  text: 'Resend',
                  whiteTextSize: 12.r,
                  textColor: AppColors.secondary,
                  underLine: TextDecoration.underline,
                  underlineColor: AppColors.secondary,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
      bottomButton: ButtonRow(onTap: () {
        Navigator.of(context).pushNamed(Routes.userRagistrationScreen);
      }),
    );
  }
}
