import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/providers/barcode_provider.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/reuseable_class.dart';
import '../created_label.dart';
import '../global_variable.dart';
import '../show_widget_class/barcode_container_class.dart';

class ShowBarcodeContainer extends StatefulWidget {
  const ShowBarcodeContainer({super.key});

  @override
  State<ShowBarcodeContainer> createState() => _ShowBarcodeContainerState();
}

class _ShowBarcodeContainerState extends State<ShowBarcodeContainer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BarcodeProvider>(
      builder: (context, barcodeModel, child) {
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
                          'assets/icons/template.png', 'Template', () {
                        barcodeModel.setShowBarcodeContainerFlag(false);
                        barcodeModel.setBarcodeBorderWidget(false);
                      }),
                      Image.asset('assets/images/line_c.png'),
                      ReuseAbleClass().buildTextIonButton(
                          'assets/icons/delete_icon.png', 'Delete', () {
                        barcodeModel.deleteBarCode(selectedBarCodeIndex);
                        barcodeModel.setShowBarcodeContainerFlag(false);
                      }),
                      /*_buildTextIonButton('assets/icons/empty.png', 'Empty', () {}),
                    _buildTextIonButton(
                        'assets/icons/multiple.png', 'Multiple', () {}),
                    _buildTextIonButton('assets/icons/undo (2).png', 'Undo', () {}),
                    _buildTextIonButton('assets/icons/redo.png', 'Redo', () {}),*/
                      ReuseAbleClass().buildTextIonButton(
                          'assets/icons/rotated_icon.png', 'Rotate', () {
                        barcodeModel.rotationFunction();
                      }),
                    ],
                  ),
                  SizedBox(height: 13.h),
                  SizedBox(
                    height: 160.h,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        padding:
                            REdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                                    barcodeModel.showBarcodeInputDialog(
                                        selectedBarCodeIndex, context);
                                  },
                                  child: Container(
                                    height: 35.h,
                                    width: 230.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.r))),
                                    child: Center(
                                      child: Text(
                                        barCodes.isNotEmpty
                                            ? barCodes[selectedBarCodeIndex]
                                            : barcodeModel.barcodeData,
                                        style: bodySmall,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20.h),
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8.r))),
                                  child:EncodingTypePicker(
                                    selectedType: barcodeModel.encodingType,
                                    supportedTypes: barcodeModel.supportedEncodingTypes,
                                    onTypeChanged: (value) {
                                      setState(() {
                                        barcodeModel.encodingType = value;
                                        barcodeModel.errorMessage =
                                        ""; // Reset error message when the encoding type changes
                                      });
                                    },
                                    onConfirm: (value) {
                                      setState(() {
                                        barcodeModel.encodingType = value;
                                         barcodeModel.setEncodingType(value);
                                        if (!isSupportedType) {
                                          barcodeModel.errorMessage = 'Invalid data length for $value';
                                        } else {
                                          barcodeModel.errorMessage = "";
                                        }

                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Show Barcode Data', style: bodySmall),
                                GestureDetector(
                                  onTap: () {
                                    barcodeModel.showBarcodeDataSwitch();
                                  },
                                  child: Container(
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: barcodeModel.showBarData
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: barcodeModel.showBarData
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 24,
                                          height: 24,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 2),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        );
      },
    );
  }
}
