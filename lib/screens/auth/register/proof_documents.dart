import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsb_remit/utils/constants/routes.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/camera_view.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_details_provider.dart';
import '../../../utils/constants/app_colors.dart';

class ProofDocuments extends StatefulWidget {
  ProofDocuments({super.key});
  final proofDocumentOneImageController = TextEditingController();
  final proofDocumentTwoImageController = TextEditingController();

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 185.h,
            width: double.maxFinite,
            child: CameraView(
              dottedBorderColor: AppColors.secondary,
              capturedImageController: widget.proofDocumentOneImageController,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 185.h,
            width: double.maxFinite,
            child: CameraView(
              dottedBorderColor: AppColors.secondary,
              capturedImageController: widget.proofDocumentTwoImageController,
            ),
          ),
        ],
      ),
      bottomButton: ButtonRow(onTap: () {
        Provider.of<UserDetailsProvider>(context, listen: false)
            .addProofDocumentationImage(
                // proofDocument: widget.proofDocumentOneImageController.text);
                proofDocument: []);
        Provider.of<UserDetailsProvider>(context, listen: false)
            .addProofDocumentationImage(
                // proofDocument: widget.proofDocumentTwoImageController.text);
                proofDocument: []);
        final proofDocument =
            Provider.of<UserDetailsProvider>(context, listen: false)
                .userDetails
                .proofDocument;
        print(proofDocument);
        Navigator.of(context).pushNamed(Routes.uploadSelfieScreen);
      }),
    );
  }
}
