import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/providers/figure_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/on_tap_function_provider.dart';
import 'package:grozziieapk/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_style.dart';
import '../global_variable.dart';

class ShowFigureContainer extends StatelessWidget {
  const ShowFigureContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FigureProvider>(
      builder: (context, figureModel, child) {
        return Consumer<OnTouchFunctionProvider>(
          builder: (context, onTouch, child) {
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
                          figureModel.setShowFigureWidget(true);
                          await onTouch.showBorderContainerFlag(
                              'figure', false);
                        }),
                        Image.asset('assets/images/line_c.png'),
                        ReuseAbleClass().buildTextIonButton(
                            'assets/icons/delete_icon.png', 'Delete', () {
                          figureModel.deleteFigureCode(selectedFigureCodeIndex);
                          figureModel.setShowFigureContainerFlag(false);
                        }),
                        /*_buildTextIonButton('assets/icons/empty.png', 'Empty', () {}),
                _buildTextIonButton(
                    'assets/icons/multiple.png', 'Multiple', () {}),
                _buildTextIonButton('assets/icons/undo (2).png', 'Undo', () {}),
                _buildTextIonButton('assets/icons/redo.png', 'Redo', () {}),*/
                        ReuseAbleClass().buildTextIonButton(
                          'assets/icons/rotated_icon.png',
                          'Rotate',
                          () {
                            onTouch.rotateFunction(
                                figureCodesContainerRotations,
                                selectedFigureCodeIndex);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          height: 170.h,
                          width: screenWidth,
                          color: Colors.white,
                          child: Padding(
                            padding: REdgeInsets.symmetric(
                                horizontal: 12, vertical: 20),
                            child: SizedBox(
                              height: 250.h,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Figure Type',
                                        style: bodySmall,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              figureModel.onCallFunction(
                                                  'isRectangale');
                                            },
                                            child: SizedBox(
                                              height: 20.h,
                                              width: 45.w,
                                              child: Image.asset(
                                                  'assets/icons/rectangle_button.png'),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              figureModel.onCallFunction(
                                                  'roundRectangale');
                                            },
                                            child: SizedBox(
                                              height: 20.h,
                                              width: 45.w,
                                              child: Image.asset(
                                                  'assets/icons/round_rectangle.png'),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              figureModel
                                                  .onCallFunction('circle');
                                            },
                                            child: SizedBox(
                                              height: 20.h,
                                              width: 45.w,
                                              child: Image.asset(
                                                  'assets/icons/circle_button.png'),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              figureModel
                                                  .onCallFunction('eggCircle');
                                            },
                                            child: SizedBox(
                                              height: 20.h,
                                              width: 45.w,
                                              child: Image.asset(
                                                  'assets/icons/egg_circle_button.png'),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Figure width',
                                        style: bodySmall,
                                      ),
                                      SizedBox(width: 15.w),
                                      Slider(
                                        value: updateFigureLineWidthSize[
                                            selectedFigureCodeIndex],
                                        min: 2,
                                        max: 10,
                                        onChanged: (value) {
                                          figureModel.setSliderValue(value);
                                        },
                                      ),
                                      Container(
                                        height: 20.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 1)),
                                        child: Center(
                                            child: Text(
                                                updateFigureLineWidthSize[
                                                        selectedFigureCodeIndex]
                                                    .toStringAsFixed(2))),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Fixed Figure Size',
                                          style: bodySmall),
                                      GestureDetector(
                                        onTap:
                                            figureModel.fixedFigureSizeSwitch,
                                        child: Container(
                                          width: 60,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: fixedFigureSize
                                                ? Colors.green
                                                : Colors.grey,
                                          ),
                                          child: Row(
                                            mainAxisAlignment: fixedFigureSize
                                                ? MainAxisAlignment.end
                                                : MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 24,
                                                height: 24,
                                                margin:
                                                    const EdgeInsets.symmetric(
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
                                  ),
                                ],
                              ),
                            ),
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
