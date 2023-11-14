import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/providers/table_provider.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/custome_slider.dart';
import '../../../../utils/utils.dart';
import '../../../providers/on_tap_function_provider.dart';
import '../global_variable.dart';

class ShowTableEditingContainer extends StatelessWidget {
  const ShowTableEditingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TableProvider>(
      builder: (context, tableModel, child) {
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
                          await onTap.showBorderContainerFlag('table', false);
                        }),
                        Image.asset('assets/images/line_c.png'),
                        ReuseAbleClass().buildTextIonButton(
                            'assets/icons/delete_icon.png', 'Delete', () {
                          //tableModel.setShowTableEditingContainerFlag(false);
                          tableModel.deleteTableCode(selectedTableCodeIndex);
                          tableModel.setShowTableEditingContainerFlag(false);
                        }),

                        /*_buildTextIonButton('assets/icons/empty.png', 'Empty', () {}),
                _buildTextIonButton(
                    'assets/icons/multiple.png', 'Multiple', () {}),
                _buildTextIonButton('assets/icons/undo (2).png', 'Undo', () {}),
                _buildTextIonButton('assets/icons/redo.png', 'Redo', () {}),*/
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          height: 217.h,
                          width: screenWidth,
                          color: Colors.white,
                          padding: REdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      tableModel.addColumn();
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/icons/inset_colum_icon.png'),
                                        SizedBox(
                                          height: 14.h,
                                          child: const Text('Insert colum'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      tableModel.addRow();
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/icons/insert_row_icon.png'),
                                        SizedBox(
                                          height: 14.h,
                                          child: const Text('Insert Row'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      tableModel.removeColumn();
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/icons/delete_colum_icon.png'),
                                        SizedBox(
                                          height: 14.h,
                                          child: const Text('Delete colum'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      tableModel.removeRow();
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/icons/delete_row_icon.png'),
                                        const SizedBox(height: 8),
                                        SizedBox(
                                          height: 14.h,
                                          child: const Text('Delete Row'),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                children: [
                                  Text(
                                    'Line width',
                                    style: bodySmall,
                                  ),
                                  SizedBox(width: 15.w),
                                  CustomSlider(
                                    initialValue: tableModel.lineWidthValue,
                                    minValue: 2.0,
                                    maxValue: 30.0,
                                    onChanged: (value) {
                                      tableModel.lineWidthValue = value;
                                    },
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Row height',
                                    style: bodySmall,
                                  ),
                                  SizedBox(width: 9.w),
                                  CustomSlider(
                                    initialValue: tableModel.lineWidthValue,
                                    minValue: 2.0,
                                    maxValue: 30.0,
                                    onChanged: (value) {
                                      tableModel.lineWidthValue = value;
                                    },
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Colum width',
                                    style: bodySmall,
                                  ),
                                  SizedBox(width: 1.w),
                                  CustomSlider(
                                    initialValue: tableModel.lineWidthValue,
                                    minValue: 2.0,
                                    maxValue: 30.0,
                                    onChanged: (value) {
                                      tableModel.lineWidthValue = value;
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
