import 'package:flutter/material.dart';
import 'package:nsb_remit/providers/user_details_provider.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';
import 'package:nsb_remit/utils/constants/dimensions.dart';
import 'package:nsb_remit/utils/constants/routes.dart';
import 'package:nsb_remit/utils/mixins/responsive_layout_mixin.dart';
import 'package:nsb_remit/widgets/common/common_button.dart';
import 'package:nsb_remit/widgets/common/custom_text_form_field.dart';
import 'package:nsb_remit/widgets/common/common_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/api_endpoints.dart';
import '../../../utils/constants/api_service.dart';
import '../../../widgets/common/common_layout.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({
    super.key,
  });

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(child: Text('Loding .....')),
            backgroundColor: Colors.white.withOpacity(0.2),
            content: const SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.secondary,
                ),
              ),
            ),
          );
        });
  }

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
                  SizedBox(
                    height: Dimension.height15,
                  ),
                   CommonText(
                    text: 'Enter Your PIN*',
                    whiteTextSize: Dimension.textSize_11,
                    alignment: Alignment.topLeft,
                    // textColor: AppColors.secondary,
                  ),
                   SizedBox(
                    height: Dimension.height10,
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
                      fieldHeight: Dimension.height25,
                      fieldWidth: Dimension.width40,
                      inactiveColor: AppColors.subHeddingColor,
                      activeColor: AppColors.secondary,
                      selectedColor: AppColors.subHeddingColor,
                      disabledColor: AppColors.subHeddingColor,
                    ),
                    controller: _pinController,
                    onCompleted: (value) => print("Completed"),
                    autoDisposeControllers: false,
                  ),
                   Row(
                    children: [
                      CommonText(
                        text: 'Forgot your ',
                        whiteTextSize: Dimension.textSize_11,
                        // alignment: Alignment.topLeft
                      ),
                      CommonText(
                        text: 'PIN?',
                        whiteTextSize: Dimension.textSize_11,
                        textColor: AppColors.secondary,
                        underLine: TextDecoration.underline,
                        underlineColor: AppColors.secondary,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       SizedBox(
                        height: Dimension.height25,
                      ),
                      CommonButton(
                        bordercolor: AppColors.secondary,
                        borderWidth: 1.0,
                        color: AppColors.secondary,
                        boxShape: BoxShape.rectangle,
                        buttonText: 'Sign In',
                        btnTextColor: AppColors.primary,
                        btnFontSize: Dimension.textSize_14,
                        btnFontWeight: FontWeight.w500,
                        onTap: () {
                          var loginBody = {
                            "Username": context
                                .read<UserDetailsProvider>()
                                .userDetails
                                .emailAddress,
                            "Password": context
                                .read<UserDetailsProvider>()
                                .userDetails
                                .pin,
                            "isBiometric": false,
                            "deviceUuid": "N6F26Q",
                            "signature":
                                "QX+r1rRzD9tZJEWR0lyAbuSRXnADbt+EztbaG3lbTFPH9kCWhd8jcy1GPxU3GR244vXGQoElqcTflx1B1mxyyFQbRd/Wsci8DzsTV6mDzk1rrrpXDdFW60b6KXlY/mtmVDOgq228vXpHqlGjdeeXMIx+hKzC90FmGVUM4kzuqkj46oCGwWGXeaC/PlKeBbd2H39TKDziF0sfNcu0z6mHYSGCW5K/10IBshWeN5wfyTHM0b0lcx+vWA8gFddUOp2OntrziEaNsdObuD8/PkdM6mRY4wJ0SAUzO9PQeSy4ryxP1Cs7Vt5ztLEGSfm6/dvwzhav023szgqxiu9kqnmBTQ=="
                          };
                          print(
                              "EMAIL ::::${context.read<UserDetailsProvider>().userDetails.emailAddress}");
                          print(
                              "PIN ::::${context.read<UserDetailsProvider>().userDetails.pin}");
                          Provider.of<UserDetailsProvider>(context,
                                  listen: false)
                              .addLoginDetails(
                                  emailAddress: _emailController.text,
                                  pin: _pinController.text);
                          final email = Provider.of<UserDetailsProvider>(
                                  context,
                                  listen: false)
                              .userDetails
                              .emailAddress;
                          print(email);

                          _displayDialog(context);
                          ApiService.callApi(
                              ApiEndpoints.loginUser, RequestType.post,
                              requestBody: loginBody, errorMessages: {}).then(
                            (value) {
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .pushNamed(Routes.homeScreen);
                            },
                          );

                          // Navigator.of(context).pushNamed(Routes.homeScreen);
                        },
                      ),
                       SizedBox(
                        height: Dimension.height15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           CommonText(
                            text: "Don’t have Account? ",
                            whiteTextSize: Dimension.textSize_11,
                          ),
                          CommonText(
                            text: 'Sign Up',
                            whiteTextSize: Dimension.textSize_11,
                            textColor: AppColors.secondary,
                            underLine: TextDecoration.underline,
                            underlineColor: AppColors.secondary,
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.signUpDetailsScreen);
                            },
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
