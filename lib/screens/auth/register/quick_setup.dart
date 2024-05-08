import 'package:flutter/material.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';
import 'package:nsb_remit/utils/constants/routes.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
import 'package:nsb_remit/widgets/common/common_text.dart';

class QuickSetUp extends StatefulWidget {
  const QuickSetUp({super.key});

  @override
  State<QuickSetUp> createState() => _QuickSetUpState();
}

class _QuickSetUpState extends State<QuickSetUp> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.amber;
        }
        return null;
      },
    );
    return CommonLayout(
      hedingTitle: 'Quick Setup',
      hedingSubTitle:
          'Please fill the following details for your \n Security purpose ',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  alignment: Alignment.topLeft,
                  text: 'Biometrics',
                  whiteTextSize: 11.0,
                  fontWeight: FontWeight.w600,
                ),
                CommonText(
                  alignment: Alignment.topLeft,
                  text: 'Enable biometrics for secure and \nfast sign-in.',
                  whiteTextSize: 12.0,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.bottomSubHeddingColor,
                )
              ],
            ),
            Switch(
              value: light,
              activeColor: AppColors.secondary,
              trackColor: trackColor,
              thumbColor:
                  const MaterialStatePropertyAll<Color>(AppColors.whiteColor),
              onChanged: (bool value) {
                setState(
                  () {
                    light = value;
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomButton: ButtonRow(onTap: () {
        Navigator.of(context).pushNamed(Routes.homeScreen);
      }),
    );
  }
}
