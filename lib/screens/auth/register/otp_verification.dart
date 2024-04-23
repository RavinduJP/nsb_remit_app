import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          'We have send to OTP to \n +94011646038 & youremail@gmail.com \n Please check your mobile and \n enter the OTP code ',
      maxLine: 4,
      body: Column(
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: PinCodeTextField(
              controller: _otpVerificationController,
              appContext: context,
              length: 4,
              obscureText: false,
              obscuringCharacter: '*',
              textStyle: const TextStyle(
                color: AppColors.heddingColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
              hintCharacter: '*',
              hintStyle: const TextStyle(
                  color: AppColors.heddingColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600),
              showCursor: false,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                fieldHeight: 36.0,
                fieldWidth: 50.0,
                inactiveColor: AppColors.subHeddingColor,
                activeColor: AppColors.subHeddingColor,
                selectedColor: AppColors.subHeddingColor,
                disabledColor: AppColors.subHeddingColor,
              ),
              cursorHeight: 20.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CommonText(
                  text: 'Didn’t receive OTP? ', whiteTextSize: 12.0),
              GestureDetector(
                onTap: () {},
                child: const CommonText(
                  text: 'Resend',
                  whiteTextSize: 12.0,
                  textColor: AppColors.secondary,
                  underLine: TextDecoration.underline,
                  underlineColor: AppColors.secondary,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
      bottomButton: ButtonRow(onTap: () {
        Navigator.of(context).pushNamed(Routes.userRagistrationScreen);
      }),
    );
  }
}
