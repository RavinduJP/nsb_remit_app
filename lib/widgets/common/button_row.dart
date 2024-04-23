import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nsb_remit/widgets/common/custom_back_button.dart';
import 'package:nsb_remit/widgets/common/gray_button.dart';
import 'package:nsb_remit/widgets/common/next_button.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({
    super.key,
    required this.onTap,
    this.isEnableGreyBtn = false,
    this.onTapGreyButton,
  });

  final Function() onTap;
  final Function()? onTapGreyButton;
  final bool? isEnableGreyBtn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
        isEnableGreyBtn!
            ? GrayButton(
                grayButtonText: 'Don’t Have Passport',
                onTap: onTapGreyButton?? (){},
              )
            : Container(),
      ],
    );
  }
}
