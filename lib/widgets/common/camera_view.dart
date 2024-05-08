import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';
import 'package:nsb_remit/utils/constants/asset_paths.dart';
import 'package:nsb_remit/widgets/common/common_text.dart';

import '../../utils/constants/dimensions.dart';

enum PickMethod { camera, gallery }

class CameraView extends StatefulWidget {
  CameraView(
      {super.key,
      this.dottedBorderColor = AppColors.bottomSubHeddingColor,
      required this.capturedImageController});

  final Color? dottedBorderColor;
  final TextEditingController capturedImageController;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  File? image;

  Future PickImage({required PickMethod pickMethod}) async {
    try {
      final image = await ImagePicker().pickImage(
          source: pickMethod == PickMethod.camera
              ? ImageSource.camera
              : ImageSource.gallery);
      if (image == null) return;

      final temporaryImage = File(image.path);
      setState(() => this.image = temporaryImage);

      final bytes = File(temporaryImage!.path).readAsBytesSync();
      String base64Image = base64Encode(bytes);
      widget.capturedImageController.text = base64Image;
      print("img_pan : $base64Image");
    } on PlatformException catch (e) {
      print('Failed to pick Image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: widget.dottedBorderColor!,
      // AppColors.bottomSubHeddingColor,
      strokeWidth: 2.0,
      dashPattern: const [15, 4],
      radius: const Radius.circular(20.0),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      borderPadding: const EdgeInsets.symmetric(horizontal: 30.0),
      borderType: BorderType.RRect,
      child: SizedBox(
        width: double.maxFinite,
        //height: Dimension.passportImageHeight,
        child: GestureDetector(
          child: Center(
            child: image == null
                ? Container(
                    height: double.maxFinite,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.captureViewGrayColor,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        width: 1.0,
                        color: AppColors.bottomSubHeddingColor,
                      ),
                      image: const DecorationImage(
                          image: AssetImage(AssetPaths.documentUploadIcon),
                          scale: 3),
                    ),
                  )
                : Center(
                    child: Container(
                      height: Dimension.passportImageHeight,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all()),
                      child: Column(
                        children: [
                          Image.file(image!),
                          Container(
                            height: 20.0,
                            width: double.maxFinite,
                            color: AppColors.secondary,
                            child: GestureDetector(
                              child: const Text(
                                'Recapture',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              onTap: () {
                                bottomSheet(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
          onTap: () {
            bottomSheet(context);
          },
        ),
      ),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: AppColors.bottomSheetBackgroundColor,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: Dimension.screenHeight*0.35,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 50.0,
                  height: 2.0,
                  color: AppColors.bottomSubHeddingColor,
                  margin: const EdgeInsets.only(top: 10.0),
                ),
                 CommonText(
                  text:
                      'Please select the relevant method\nof uploading your passport image',
                  whiteTextSize: Dimension.textSize_14,
                  fontWeight: FontWeight.w500,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    captureMethod(
                        imageName: AssetPaths.bottomSheetGalleryIcon,
                        captureMethodText: 'Gallery',
                        onMethodTap: () {
                          PickImage(pickMethod: PickMethod.gallery)
                              .then((value) {
                            Navigator.of(context).pop();
                          });
                        }),
                    captureMethod(
                        imageName: AssetPaths.bottomSheetCameraIcon,
                        captureMethodText: 'Camera',
                        onMethodTap: () {
                          PickImage(pickMethod: PickMethod.camera)
                              .then((value) {
                            Navigator.of(context).pop();
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Column captureMethod(
      {required String imageName,
      required String captureMethodText,
      required Function() onMethodTap}) {
    return Column(
      children: [
        InkWell(
          onTap: onMethodTap,
          child: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.secondary),
            child: Center(
              child: Image.asset(
                imageName,
                width: 40,
              ),
            ),
          ),
        ),
        CommonText(
          text: captureMethodText,
          whiteTextSize: 14.0,
          fontWeight: FontWeight.w500,
          textColor: AppColors.whiteColor,
        ),
        const SizedBox(
          height: 15.0,
        )
      ],
    );
  }
}
