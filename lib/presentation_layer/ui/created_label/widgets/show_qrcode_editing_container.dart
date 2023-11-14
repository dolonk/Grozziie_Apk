import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/providers/qrcode_provider.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/utils.dart';
import '../../../providers/on_tap_function_provider.dart';
import '../global_variable.dart';

class ShowQrcodeContainer extends StatelessWidget {
  ShowQrcodeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QrCodeProvider>(
      builder: (context, qrCodeModel, child) {
        return Consumer<OnTouchFunctionProvider>(
          builder: (context, onTouch, child) {
            return SingleChildScrollView(
              child: Stack(children: [
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
                              'assets/icons/template.png', 'Template',
                              () async {
                            qrCodeModel.setQrcodeBorderWidget(false);
                            await onTouch.showBorderContainerFlag('qrcode', false);
                          }),
                          Image.asset('assets/images/line_c.png'),
                          ReuseAbleClass().buildTextIonButton(
                              'assets/icons/delete_icon.png', 'Delete', () {
                            qrCodeModel.deleteQRCode(selectedQRCodeIndex);
                            qrCodeModel.setShowQrcodeContainerFlag(false);
                          }),
                          /*_buildTextIonButton('assets/icons/empty.png', 'Empty', () {}),
                  _buildTextIonButton(
                      'assets/icons/multiple.png', 'Multiple', () {}),
                  _buildTextIonButton('assets/icons/undo (2).png', 'Undo', () {}),
                  _buildTextIonButton('assets/icons/redo.png', 'Redo', () {}),*/
                          ReuseAbleClass().buildTextIonButton(
                              'assets/icons/rotated_icon.png', 'Rotate', () {}),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      SingleChildScrollView(
                        child: Container(
                          height: 170.h,
                          width: screenWidth,
                          color: Colors.white,
                          padding: REdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 30.h),
                                  Text(
                                    'Content',
                                    style: bodySmall,
                                  ),
                                  SizedBox(width: 30.w),
                                  InkWell(
                                    onTap: () {
                                      qrCodeModel.showQrcodeInputDialog(
                                          selectedQRCodeIndex, context);
                                    },
                                    child: Container(
                                      height: 35.h,
                                      width: 230.w,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.r))),
                                      child: Center(
                                        child: Text(
                                          qrCodes.isNotEmpty
                                              ? qrCodes[selectedQRCodeIndex]
                                              : qrCodeModel.qrcodeData,
                                          style: bodySmall,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 30.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 30.h),
                                  Text(
                                    'Encoding\n type',
                                    style: bodySmall,
                                  ),
                                  SizedBox(width: 30.w),
                                  Container(
                                    height: 35.h,
                                    width: 230.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.r))),
                                    child: Center(
                                      child: Text('QR_CODE', style: bodySmall),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            );
          },
        );
      },
    );
  }
}
