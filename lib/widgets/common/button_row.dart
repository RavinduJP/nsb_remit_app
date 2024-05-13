import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsb_remit/widgets/common/custom_back_button.dart';
import 'package:nsb_remit/widgets/common/gray_button.dart';
import 'package:nsb_remit/widgets/common/next_button.dart';


class ButtonRow extends StatelessWidget {
  const ButtonRow({
    super.key,
    required this.onTap,
    this.isEnableGreyBtn = false,
    this.onTapGreyButton,
    this.grayButtonText,
  });

  final Function() onTap;
  final Function()? onTapGreyButton;
  final bool? isEnableGreyBtn;
  final String? grayButtonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                flex: 2,
                child: CustomBackButton(),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Flexible(
                flex: 4,
                child: NextButton(onTap: onTap),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        isEnableGreyBtn!
            ? GrayButton(
                grayButtonText: grayButtonText ?? '',
                onTap: onTapGreyButton ?? () {},
              )
            : Container(
            ),
      ],
    );
  }
}
