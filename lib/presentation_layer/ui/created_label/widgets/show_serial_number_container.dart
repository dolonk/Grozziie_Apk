import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/providers/on_tap_function_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/text_editing_provider.dart';
import 'package:grozziieapk/presentation_layer/serial_provider.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/show_text_editing_container.dart';
import 'package:grozziieapk/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_style.dart';
import '../global_variable.dart';

class ShowSerialNumberContainer extends StatelessWidget {
  const ShowSerialNumberContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnTouchFunctionProvider>(
      builder: (context, onTouch, child) {
        return Consumer<SerialProvider>(
          builder: (context, serialModel, child) {
            return Consumer<TextEditingProvider>(
              builder: (context, textModel, child) {
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
                                'assets/icons/template.png', 'Template',
                                () async {
                              await onTouch.showBorderContainerFlag(
                                  'serial', false);
                            }),
                            Image.asset('assets/images/line_c.png'),
                            ReuseAbleClass().buildTextIonButton(
                                'assets/icons/delete_icon.png', 'Delete', () {
                              textModel.deleteTextCode(selectedSerialCodeIndex);
                              serialModel.setShowSerialContainerFlag(false);
                            }),
                            /*  _buildTextIonButton('assets/icons/empty.png', 'Empty', () {}),
                _buildTextIonButton(
                    'assets/icons/multiple.png', 'Multiple', () {}),
                _buildTextIonButton('assets/icons/undo (2).png', 'Undo', () {}),
                _buildTextIonButton('assets/icons/redo.png', 'Redo', () {}),*/
                            ReuseAbleClass().buildTextIonButton(
                                'assets/icons/rotated_icon.png', 'Rotate', () {
                              onTouch.rotateFunction(textContainerRotations,
                                  selectedTextCodeIndex);
                            }),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        if (serialModel.showStyleContainer)
                          Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                  color: Colors.white,
                                  child: const ShowTextEditingContainer()
                                      .textEditingOptions(
                                    context,
                                  )),
                            ),
                          )
                        else
                          Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                height: 130.h,
                                width: screenWidth,
                                color: Colors.white,
                                padding: REdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            String getTextValue = prefixNumber[
                                                selectedTextCodeIndex];
                                            serialModel.showSerialInputDialog(
                                                selectedTextCodeIndex,
                                                context,
                                                1,
                                                getTextValue);
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              border: Border.all(
                                                  color: Colors.white30,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding: REdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'prefix \t',
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  Text(prefixNumber.isNotEmpty
                                                      ? prefixNumber[
                                                          selectedTextCodeIndex]
                                                      : ''),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            String getTextValue = suffixNumber[
                                                selectedTextCodeIndex];
                                            serialModel.showSerialInputDialog(
                                                selectedTextCodeIndex,
                                                context,
                                                2,
                                                getTextValue);
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              border: Border.all(
                                                  color: Colors.white30,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'suffix \t',
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  Text(suffixNumber.isNotEmpty
                                                      ? suffixNumber[
                                                          selectedTextCodeIndex]
                                                      : ''),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            String getTextValue = textCodes[
                                                selectedTextCodeIndex];
                                            serialModel.showSerialInputDialog(
                                                selectedTextCodeIndex,
                                                context,
                                                3,
                                                getTextValue);
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              border: Border.all(
                                                  color: Colors.white30,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'starting v.. \t',
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  Text(textCodes.isNotEmpty
                                                      ? textCodes[
                                                          selectedTextCodeIndex]
                                                      : ''),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            String getTextValue =
                                                incrementNumber[
                                                        selectedSerialCodeIndex]
                                                    .toString();
                                            serialModel.showSerialInputDialog(
                                                selectedSerialCodeIndex,
                                                context,
                                                4,
                                                getTextValue);
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              border: Border.all(
                                                  color: Colors.white30,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'Increment\t',
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  Text(incrementNumber
                                                          .isNotEmpty
                                                      ? incrementNumber[
                                                              selectedSerialCodeIndex]
                                                          .toString()
                                                      : ''),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        Container(
                          padding: REdgeInsets.symmetric(horizontal: 15),
                          height: 50,
                          width: screenWidth,
                          color: Colors.grey.shade300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    serialModel.setShowStyleContainer(false);
                                  },
                                  child: Text(
                                    'Format',
                                    style: serialModel.showStyleContainer
                                        ? bodySmall
                                        : bodySmall.copyWith(
                                            color: Colors.blue),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    serialModel.setShowStyleContainer(true);
                                  },
                                  child: Text(
                                    'Style',
                                    style: serialModel.showStyleContainer
                                        ? bodySmall.copyWith(color: Colors.blue)
                                        : bodySmall,
                                  ))
                            ],
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
      },
    );
  }
}
