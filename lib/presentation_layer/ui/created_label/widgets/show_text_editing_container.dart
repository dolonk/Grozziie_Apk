import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/reuseable_class.dart';
import '../../../providers/on_tap_function_provider.dart';
import '../../../providers/text_editing_provider.dart';
import '../global_variable.dart';

class ShowTextEditingContainer extends StatelessWidget {
  const ShowTextEditingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TextEditingProvider>(
      builder: (context, textModel, _) {
        return Consumer<OnTouchFunctionProvider>(builder: (context, onTap, child) {
          return Stack(
            children: [
              Container(
                padding: REdgeInsets.only(bottom: 25.h),
                margin: REdgeInsets.only(top: 10.h),
                alignment: Alignment.topCenter,
                child: Image.asset('assets/icons/rectangle.png'),
              ),
              Container(
                margin: REdgeInsets.only(top: 15.h),
                height: double.infinity,
                width: ScreenUtil().screenWidth,
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
                          textModel.setTextBorderWidgetFlag(false);
                          onTap.clearContainerFlag();
                        }),
                        Image.asset('assets/images/line_c.png'),
                        ReuseAbleClass().buildIconButton(
                            'assets/icons/delete_icon.png', 'Delete', () {
                          textModel.setShowTextEditingContainerFlag(false);
                          textModel.deleteTextCode(selectedTextCodeIndex);
                        }),
                        ReuseAbleClass().buildIconButton(
                            'assets/icons/multiple.png', 'Multiple', () {}),
                        ReuseAbleClass().buildIconButton(
                            'assets/icons/mirroring_icon.png',
                            'Mirroring',
                                () {}),
                        ReuseAbleClass().buildIconButton(
                            'assets/icons/lock_icon.png', 'Lock', () {}),
                        ReuseAbleClass().buildIconButton(
                            'assets/icons/rotated_icon.png', 'Rotate', () {
                          textModel.rotationFunction();
                        }),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: SingleChildScrollView(
                        child: textEditingOptions(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },);
      },
    );
  }

  Widget textEditingOptions(BuildContext context) {
    return Consumer<TextEditingProvider>(
      builder: (context, textModel, _) {
        return SingleChildScrollView(
          child: Container(
            height: 210.h,
            width: ScreenUtil().screenWidth,
            color: Colors.white,
            padding: REdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Column(
              children: [
                ReuseAbleClass().buildOptionRow(
                  [
                    IconButton(
                      onPressed: textModel.toggleBold,
                      icon: Icon(
                        //textModel.isBold
                        updateTextBold[selectedTextCodeIndex]
                            ? Icons.format_bold
                            : Icons.format_bold,
                        color: updateTextBold[selectedTextCodeIndex]
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: textModel.toggleUnderline,
                      icon: Icon(
                        updateTextUnderline[selectedTextCodeIndex]
                            ? Icons.format_underline
                            : Icons.format_underline,
                        color: updateTextUnderline[selectedTextCodeIndex]
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: textModel.toggleItalic,
                      icon: Icon(
                        updateTextItalic[selectedTextCodeIndex]
                            ? Icons.format_italic
                            : Icons.format_italic,
                        color: updateTextItalic[selectedTextCodeIndex]
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                    SizedBox(width: 60.w),
                    IconButton(
                      onPressed: () {
                        textModel.changeAlignment(TextAlign.left);
                        updateTextAlignment[selectedTextCodeIndex] =
                            TextAlign.left;
                      },
                      icon: Icon(
                        selectedTextCodeIndex >= 0 &&
                                selectedTextCodeIndex <
                                    updateTextAlignment.length
                            ? Icons.format_align_left
                            : Icons.error,
                        color: updateTextAlignment[selectedTextCodeIndex] ==
                                TextAlign.left
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        textModel.changeAlignment(TextAlign.center);
                        updateTextAlignment[selectedTextCodeIndex] =
                            TextAlign.center;
                      },
                      icon: Icon(
                        selectedTextCodeIndex >= 0 &&
                                selectedTextCodeIndex <
                                    updateTextAlignment.length
                            ? Icons.format_align_center
                            : Icons.error,
                        color: TextAlign.center ==
                                updateTextAlignment[selectedTextCodeIndex]
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        textModel.changeAlignment(TextAlign.right);
                        updateTextAlignment[selectedTextCodeIndex] =
                            TextAlign.right;
                      },
                      icon: Icon(
                        selectedTextCodeIndex >= 0 &&
                                selectedTextCodeIndex <
                                    updateTextAlignment.length
                            ? Icons.format_align_right
                            : Icons.error,
                        color: TextAlign.right ==
                                updateTextAlignment[selectedTextCodeIndex]
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Text font size',
                          style: bodySmall.copyWith(fontFamily: pMedium)),
                      Slider(
                        min: 15,
                        max: 30,
                        value: updateTextFontSize[selectedTextCodeIndex],
                        onChanged: (value) {
                          textModel.changeFontSize(value);
                          textModel.textValueSize = value;
                        },
                      ),
                      Container(
                        height: 20,
                        width: 32,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: Center(
                          child: Text(
                            updateTextFontSize[selectedTextCodeIndex]
                                .toString(),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Character arrangement',
                      style: bodySmall.copyWith(fontFamily: pMedium),
                    ),
                    SizedBox(width: 18.w),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/horizontal_icon.png',
                        height: 25,
                        width: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/vertical_icon.png'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icons/curved_icon.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
