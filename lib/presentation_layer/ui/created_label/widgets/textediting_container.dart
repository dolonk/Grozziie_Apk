import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_style.dart';
import '../../../../utils/reuseable_class.dart';
import '../../../providers/text_editing_provider.dart';

class ShowTextEditingContainer extends StatelessWidget {
  const ShowTextEditingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TextEditingProvider>(
      builder: (context, textModel, _) {
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
                        textModel.setShowTextEditingContainerFlag(false);
                      }),
                      Image.asset('assets/images/line_c.png'),
                      ReuseAbleClass().buildIconButton(
                          'assets/icons/delete_icon.png', 'Delete', () {
                        textModel.setShowTextEditingWidget(false);
                        textModel.setShowTextEditingContainerFlag(false);
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
                          'assets/icons/rotated_icon.png', 'Rotate', () {}),
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
                        textModel.isBold
                            ? Icons.format_bold
                            : Icons.format_bold,
                        color: textModel.isBold ? Colors.black : Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: textModel.toggleUnderline,
                      icon: Icon(
                        textModel.isUnderline!
                            ? Icons.format_underline
                            : Icons.format_underline,
                        color:
                            textModel.isUnderline! ? Colors.black : Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: textModel.toggleItalic,
                      icon: Icon(
                        textModel.isItalic
                            ? Icons.format_italic
                            : Icons.format_italic,
                        color: textModel.isItalic ? Colors.black : Colors.grey,
                      ),
                    ),
                    SizedBox(width: 60.w),
                    IconButton(
                      onPressed: () =>
                          textModel.changeAlignment(TextAlign.left),
                      icon: Icon(
                        Icons.format_align_left,
                        color: textModel.textAlignment == TextAlign.left
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () =>
                          textModel.changeAlignment(TextAlign.center),
                      icon: Icon(
                        Icons.format_align_center,
                        color: textModel.textAlignment == TextAlign.center
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () =>
                          textModel.changeAlignment(TextAlign.right),
                      icon: Icon(
                        Icons.format_align_right,
                        color: textModel.textAlignment == TextAlign.right
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Text font size',
                      style: bodySmall.copyWith(fontFamily: pMedium),
                    ),
                    SizedBox(width: 10.w),
                    Slider(
                      min: 15,
                      max: 40,
                      value: textModel.textValueSize,
                      onChanged: (value) {
                        // Update the viewModel.textValueSize variable here
                        textModel.textValueSize = value;
                        // Call the method to apply changes to the label text
                        textModel.changeFontSize(value);
                      },
                    ),
                    Container(
                      height: 20,
                      width: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          textModel.textValueSize.toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Wrap by word', style: bodySmall),
                    SizedBox(width: 150.w),
                    GestureDetector(
                      onTap: textModel.warpByWordSwitch,
                      child: Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color:
                              textModel.wrapByWord ? Colors.green : Colors.grey,
                        ),
                        child: Row(
                          mainAxisAlignment: textModel.wrapByWord
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              margin: REdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Reverse Type', style: bodySmall),
                    SizedBox(width: 150.w),
                    GestureDetector(
                      onTap: textModel.reverseTypeSwitch,
                      child: Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: textModel.reverseType
                              ? Colors.green
                              : Colors.grey,
                        ),
                        child: Row(
                          mainAxisAlignment: textModel.reverseType
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(12),
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
        );
      },
    );
  }
}
