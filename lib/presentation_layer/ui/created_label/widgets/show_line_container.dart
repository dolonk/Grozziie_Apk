import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/utils.dart';
import '../../../providers/line_provider.dart';
import '../../../providers/on_tap_function_provider.dart';
import '../global_variable.dart';

class ShowLineContainer extends StatelessWidget {
  const ShowLineContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LineProvide>(
      builder: (context, lineModel, child) {
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
                          onTouch.showBorderContainerFlag('line', false);
                        }),
                        Image.asset('assets/images/line_c.png'),
                        ReuseAbleClass().buildTextIonButton(
                            'assets/icons/delete_icon.png', 'Delete', () {
                          lineModel.deleteLineCode(selectedLineCodeIndex);
                          lineModel.setShowLineContainerFlag(false);
                        }),
                        /*_buildTextIonButton('assets/icons/empty.png', 'Empty', () {}),
                _buildTextIonButton(
                    'assets/icons/multiple.png', 'Multiple', () {}),
                _buildTextIonButton('assets/icons/undo (2).png', 'Undo', () {}),
                _buildTextIonButton('assets/icons/redo.png', 'Redo', () {}),*/
                        ReuseAbleClass().buildTextIonButton(
                            'assets/icons/rotated_icon.png', 'Rotate', () {
                          onTouch.rotateFunction(lineCodesContainerRotations,
                              selectedLineCodeIndex);
                        }),
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
                                horizontal: 12, vertical: 10),
                            child: SizedBox(
                              height: 200.h,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Line Type',
                                        style: bodySmall,
                                      ),
                                      SizedBox(
                                        width: 135.w,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          lineModel
                                              .setIsDottedLineUpdateFlag(false);
                                        },
                                        child: SizedBox(
                                          height: 20.h,
                                          width: 50.w,
                                          child: !isDottedLineUpdate[
                                                  selectedLineCodeIndex]
                                              ? ColorFiltered(
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.grey
                                                          .withOpacity(0.5),
                                                      BlendMode.srcATop),
                                                  child: Image.asset(
                                                      'assets/icons/g_line.png'),
                                                )
                                              : ColorFiltered(
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.grey
                                                          .withOpacity(1),
                                                      BlendMode.srcATop),
                                                  child: Image.asset(
                                                      'assets/icons/g_line.png'),
                                                ),
                                        ),
                                      ),
                                      SizedBox(width: 20.w),
                                      InkWell(
                                        onTap: () {
                                          lineModel
                                              .setIsDottedLineUpdateFlag(true);
                                        },
                                        child: SizedBox(
                                          height: 20.h,
                                          width: 50.w,
                                          child: isDottedLineUpdate[
                                                  selectedLineCodeIndex]
                                              ? ColorFiltered(
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.grey
                                                          .withOpacity(0.5),
                                                      BlendMode.srcATop),
                                                  child: Image.asset(
                                                      'assets/icons/dot_line.png'),
                                                )
                                              : ColorFiltered(
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.grey
                                                          .withOpacity(1),
                                                      BlendMode.srcATop),
                                                  child: Image.asset(
                                                      'assets/icons/dot_line.png'),
                                                ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Line width',
                                        style: bodySmall,
                                      ),
                                      SizedBox(width: 20.w),
                                      Slider(
                                        value: updateSliderLineWidth[
                                            selectedLineCodeIndex],
                                        min: 2,
                                        max: 10,
                                        activeColor: primaryBlue,
                                        onChanged: (value) {
                                          lineModel.setSliderValue(value);
                                        },
                                      ),
                                      Container(
                                        height: 20.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 1)),
                                        child: Center(
                                            child: Text(updateSliderLineWidth[
                                                    selectedLineCodeIndex]
                                                .toStringAsFixed(2))),
                                      )
                                    ],
                                  )
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
