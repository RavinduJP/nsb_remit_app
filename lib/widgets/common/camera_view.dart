import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';
import 'package:nsb_remit/widgets/common/common_text.dart';

enum PickMethod{
  camera,
  gallery
}
class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  File? image;

  Future PickImage({required PickMethod pickMethod}) async {

    
    try {
      final image = await ImagePicker().pickImage(source:pickMethod==PickMethod.camera? ImageSource.camera:ImageSource.gallery);
      if (image == null) return;

      final temporaryImage = File(image.path);
      setState(() => this.image = temporaryImage);
    } on PlatformException catch (e) {
      print('Failed to pick Image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.bottomSubHeddingColor,
      strokeWidth: 2.0,
      dashPattern: const [15, 4],
      radius: const Radius.circular(19.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      borderPadding: const EdgeInsets.symmetric(horizontal: 30.0),
      borderType: BorderType.RRect,
      child: SizedBox(
        width: double.maxFinite,
        height: 380,
        child: GestureDetector(
          child: Center(
            child: image == null
                ? const Text(
                    'please press to open camera',
                  )
                : Image.file(
                    image!,
                    width: 200,
                  ),
          ),
          onTap: () {
            showModalBottomSheet(
              backgroundColor: AppColors.bottomSheetBackgroundColor,
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 200.0,
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
                        const CommonText(
                          text:
                              'Please select the relevant method\nof uploading your passport image',
                          whiteTextSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            captureMethod(
                                imageName: 'assets/images/gallery_icon.png',
                                captureMethodText: 'Gallery',
                                onMethodTap: () {
                                  PickImage(pickMethod: PickMethod.gallery)
                                      .then((value) {
                                    Navigator.of(context).pop();
                                  });
                                }),
                            captureMethod(
                                imageName: 'assets/images/camera_icon.png',
                                captureMethodText: 'Camera',
                                onMethodTap: () {
                                  PickImage(pickMethod: PickMethod.camera).then((value) {
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
          },
        ),
      ),
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
            )),
          ),
        ),
        CommonText(
          text: captureMethodText,
          whiteTextSize: 14.0,
          fontWeight: FontWeight.w500,
          textColor: AppColors.whiteColor,
        )
      ],
    );
  }
}
