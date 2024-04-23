import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nsb_remit/screens/home_screen.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';
import 'package:nsb_remit/utils/constants/routes.dart';
import 'package:nsb_remit/utils/mixins/responsive_layout_mixin.dart';
import 'package:nsb_remit/widgets/common/common_button.dart';
import 'package:nsb_remit/widgets/common/custom_text_form_field.dart';
import 'package:nsb_remit/widgets/common/common_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../widgets/common/common_layout.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _emailController = TextEditingController();
  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: ResponsiveLayoutMixin().getContentHeight(context),
        child: Stack(
          children: [
            CommonLayout(
              hedingTitle: "Log In",
              hedingSubTitle:
                  'Please provide your Credentials to \n Log In with NSB Remit',
              maxLine: 2,
              body: Column(
                children: [
                  CustomTextFromField(
                    controller: _emailController,
                    lableText: "Email Address",
                    hintText: "Enter Your Email Addres",
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const CommonText(
                    text: 'Enter Your PIN*',
                    whiteTextSize: 11.0,
                    alignment: Alignment.topLeft,
                    // textColor: AppColors.secondary,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    obscureText: true,
                    obscuringCharacter: '*',
                    textStyle: const TextStyle(
                      color: AppColors.heddingColor,
                    ),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      fieldHeight: 30.0,
                      fieldWidth: 50.0,
                      inactiveColor: AppColors.subHeddingColor,
                      activeColor: AppColors.secondary,
                      selectedColor: AppColors.subHeddingColor,
                      disabledColor: AppColors.subHeddingColor,
                    ),
                    controller: _pinController,
                    onCompleted: (value) => print("Completed"),
                  ),
                  const Row(
                    children: [
                      CommonText(
                        text: 'Forgot your ',
                        whiteTextSize: 11.0,
                        // alignment: Alignment.topLeft
                      ),
                      CommonText(
                        text: 'PIN?',
                        whiteTextSize: 11.0,
                        textColor: AppColors.secondary,
                        underLine: TextDecoration.underline,
                        underlineColor: AppColors.secondary,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15.0,
                      ),
                      CommonButton(
                        bordercolor: AppColors.secondary,
                        borderWidth: 1.0,
                        color: AppColors.secondary,
                        boxShape: BoxShape.rectangle,
                        buttonText: 'Sign In',
                        btnTextColor: AppColors.primary,
                        btnFontSize: 14.0,
                        btnFontWeight: FontWeight.w500,
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.homeScreen);
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CommonText(
                            text: "Don’t have Account? ",
                            whiteTextSize: 11.0,
                          ),
                          CommonText(
                            text: 'Sign Up',
                            whiteTextSize: 11.0,
                            textColor: AppColors.secondary,
                            underLine: TextDecoration.underline,
                            underlineColor: AppColors.secondary,
                            onTap: () => Navigator.of(context)
                                .pushNamed(Routes.signUpDetailsScreen),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset("assets/images/login_bottom_image.png"),
            ),
          ],
        ),
      ),
    );
  }
}
