import 'package:flutter/cupertino.dart';
import 'package:nsb_remit/utils/constants/routes.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/camera_view.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';

import '../../../utils/constants/app_colors.dart';

class ProofDocuments extends StatefulWidget {
  const ProofDocuments({super.key});

  @override
  State<ProofDocuments> createState() => _ProofDocumentsState();
}

class _ProofDocumentsState extends State<ProofDocuments> {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hedingTitle: 'Proof Document',
      hedingSubTitle:
          'Palace your document in well lit  area\nto scan clearly accurately\n(You can add Minimum 1 & Maximum 2 Documents Only).',
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 200,
            width: double.maxFinite,
            child: CameraView(
              dottedBorderColor: AppColors.secondary,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 200,
            width: double.maxFinite,
            child: CameraView(
              dottedBorderColor: AppColors.secondary,
            ),
          ),
        ],
      ),
      bottomButton: ButtonRow(onTap: () {
        Navigator.of(context).pushNamed(Routes.uploadSelfieScreen);
      }),
    );
  }
}
