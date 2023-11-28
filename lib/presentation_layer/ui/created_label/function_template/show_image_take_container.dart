import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/providers/image_take_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/on_tap_function_provider.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/utils.dart';
import '../global_variable.dart';

class ShowImageTakeContainer extends StatelessWidget {
  const ShowImageTakeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageTakeProvider>(
      builder: (context, imageModel, child) {
        return Consumer<OnTouchFunctionProvider>(
          builder: (context, onTap, child) {
            return Stack(children: [
              Container(
                padding: REdgeInsets.only(bottom: 30.h),
                margin: REdgeInsets.only(top: 10.h),
                alignment: Alignment.topCenter,
                child: Image.asset('assets/icons/rectangle.png'),
              ),
              Container(
                margin: REdgeInsets.only(top: 15.h),
                width: screenWidth,
                decoration: BoxDecoration(
                  color: const Color(0xff5DBCFF).withOpacity(0.13),
                  borderRadius: BorderRadius.all(Radius.circular(13.w)),
                ),
                child: Column(
                  children: [
                    ReuseAbleClass().buildOptionRow(
                      [
                        ReuseAbleClass().buildIconButton(
                            'assets/icons/template.png', 'Template', () async {
                          await onTap.showBorderContainerFlag('image', false);
                        }),
                        Image.asset('assets/images/line_c.png'),
                        ReuseAbleClass().buildTextIonButton(
                            'assets/icons/delete_icon.png', 'Delete', () {
                          imageModel.deleteImageCode(selectedImageCodeIndex);
                         imageModel.setShowImageContainerFlag(false);
                        }),
                        /*_buildTextIonButton(
                    'assets/icons/multiple.png', 'Multiple', () {}),
                _buildTextIonButton('assets/icons/undo (2).png', 'Undo', () {}),
                _buildTextIonButton('assets/icons/redo.png', 'Redo', () {}),*/
                        ReuseAbleClass().buildTextIonButton(
                            'assets/icons/rotated_icon.png', 'Rotate', () {
                          onTap.rotateFunction(imageCodesContainerRotations,
                              selectedImageCodeIndex);
                        }),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          height: 173.h,
                          width: screenWidth,
                          color: Colors.white,
                          padding: REdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Select Image from Gallery: ',
                                    style: bodySmall,
                                  ),
                                  SizedBox(width: 10.w),
                                  CustomButton(
                                    text: 'Gallery',
                                    width: 120.h,
                                    height: 43.w,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black54,
                                    onTap: () {
                                      //imageModel.setShowImageWidget(true);
                                      imageModel.generateImageCode(1);
                                    },
                                  )
                                ],
                              ),
                              SizedBox(height: 40.h),
                              Row(
                                children: [
                                  Text(
                                    'Select Image from Phone: ',
                                    style: bodySmall,
                                  ),
                                  SizedBox(width: 10.w),
                                  CustomButton(
                                    text: 'Camera',
                                    width: 120.h,
                                    height: 43.w,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black54,
                                    onTap: () {
                                      //imageModel.setShowImageWidget(true);
                                      imageModel.generateImageCode(0);
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]);
          },
        );
      },
    );
  }
}
