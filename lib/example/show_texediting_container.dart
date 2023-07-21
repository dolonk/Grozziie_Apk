
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_style.dart';
import '../providers/text_editing_provider.dart';
import 'example.dart';

class ShowTextEditingContainer extends StatefulWidget {
  final TextEditingProvider textEditingProvider;

  const ShowTextEditingContainer({super.key, required this.textEditingProvider});

  @override
  State<ShowTextEditingContainer> createState() => _ShowTextEditingContainerState();
}

class _ShowTextEditingContainerState extends State<ShowTextEditingContainer> {
  double textValueSize = 15;
  @override
  Widget build(BuildContext context) {
    print('Show text editing container');
    return Stack(children: [
      Container(
        padding: REdgeInsets.only(bottom: 25.h),
        margin: REdgeInsets.only(top: 10.h),
        alignment: Alignment.topCenter,
        child: Image.asset('assets/icons/rectangle.png'),
      ),
      Container(
        margin: REdgeInsets.only(top: 15.h),
        height: double.infinity,
        width: screenWidth,
        decoration: BoxDecoration(
          color: const Color(0xff5DBCFF).withOpacity(0.13),
          borderRadius: BorderRadius.all(Radius.circular(13.w)),
        ),
        child: Column(
          children: [
            buildOptionRow(
              [
                buildIconButton('assets/icons/template.png', 'Template', () {
                   widget.textEditingProvider.updateShowTextEditingContainerFlag(false);
                }),
                Image.asset('assets/images/line_c.png'),
                buildTextIonButton(
                    'assets/icons/delete_icon.png', 'Delete', () {
                    widget.textEditingProvider.updateShowTextEditingWidgetFlag(false);
                    widget.textEditingProvider.updateShowTextEditingContainerFlag(false);
                }),
                buildTextIonButton(
                    'assets/icons/multiple.png', 'Multiple', () {}),
                buildTextIonButton(
                    'assets/icons/mirroring_icon.png', 'Mirroring', () {}),
                buildTextIonButton(
                    'assets/icons/lock_icon.png', 'Lock', () {}),
                buildTextIonButton(
                    'assets/icons/rotated_icon.png', 'Rotate', () {}),
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(
                child: SingleChildScrollView(
                    child: textEditingOptions(context, screenWidth,widget.textEditingProvider))),
          ],
        ),
      ),
    ]);
  }

  Widget buildTextIonButton(
      String imagePath, String label, VoidCallback onPressed) {
    return SizedBox(
      child: Column(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Image.asset(
              imagePath,
              width: 24.w,
              height: 24.h,
            ),
            color: Colors.grey,
          ),
          SizedBox(height: 5.h),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black45,
              fontFamily: 'Poppins-Regular',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget textEditingOptions(context, screenWidth, TextEditingProvider textEditingProvider) {
    return SingleChildScrollView(
      child: Container(
        height: 210.h,
        width: screenWidth,
        color: Colors.white,
        padding: REdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            textEditingOptionRow(
              [
                IconButton(
                  onPressed: textEditingProvider.toggleBold,
                  icon: Icon(
                    textEditingProvider.isBold
                        ? Icons.format_bold
                        : Icons.format_bold,
                    color:
                    textEditingProvider.isBold ? Colors.black : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: textEditingProvider.toggleUnderline,
                  icon: Icon(
                    textEditingProvider.isUnderline!
                        ? Icons.format_underline
                        : Icons.format_underline,
                    color: textEditingProvider.isUnderline!
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: textEditingProvider.toggleItalic,
                  icon: Icon(
                    textEditingProvider.isItalic
                        ? Icons.format_italic
                        : Icons.format_italic,
                    color:
                    textEditingProvider.isItalic ? Colors.black : Colors.grey,
                  ),
                ),
                SizedBox(width: 60.w),
                IconButton(
                  onPressed: () =>
                      textEditingProvider.changeAlignment(TextAlign.left),
                  icon: Icon(
                    Icons.format_align_left,
                    color: textEditingProvider.textAlignment == TextAlign.left
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      textEditingProvider.changeAlignment(TextAlign.center),
                  icon: Icon(
                    Icons.format_align_center,
                    color: textEditingProvider.textAlignment == TextAlign.center
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      textEditingProvider.changeAlignment(TextAlign.right),
                  icon: Icon(
                    Icons.format_align_right,
                    color: textEditingProvider.textAlignment == TextAlign.right
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Text font size',
                    style: bodySmall.copyWith(fontFamily: pMedium)),
                SizedBox(width: 10.w),
                Slider(
                  min: 15,
                  max: 30,
                  value: textValueSize,
                  onChanged: (value) {
                    textEditingProvider.changeFontSize(value);
                    setState(() {
                      textValueSize = value;
                    });
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
                      textValueSize.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Character arrangement',
                    style: bodySmall.copyWith(fontFamily: pMedium)),
                SizedBox(width: 18.w),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/icons/horizontal_icon.png',
                      height: 25,
                      width: 25,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/vertical_icon.png')),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/curved_icon.png')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Wrap by word', style: bodySmall),
                SizedBox(width: 150.w),
                GestureDetector(
                  onTap: warpByWordSwitch,
                  child: Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: _wrapByWord ? Colors.green : Colors.grey,
                    ),
                    child: Row(
                      mainAxisAlignment: _wrapByWord
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
                  onTap: reverseTypeSwitch,
                  child: Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: _reverseType ? Colors.green : Colors.grey,
                    ),
                    child: Row(
                      mainAxisAlignment: _reverseType
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
  }
  Widget buildOptionRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: children,
    );
  }
  Widget buildIconButton(
      String imagePath, String label, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: 60.w,
        child: Column(
          children: [
            IconButton(
              onPressed: onPressed,
              icon: Image.asset(
                imagePath,
                width: 24.w,
                height: 24.h,
              ),
              color: Colors.grey,
            ),
            SizedBox(height: 5.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                color: Colors.black45,
                fontFamily: 'Poppins-Regular',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget textEditingOptionRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  bool _wrapByWord = false;

  bool _reverseType = false;

  void warpByWordSwitch() {
    setState(() {
      _wrapByWord = !_wrapByWord;
    });
  }

  void reverseTypeSwitch() {
    setState(() {
      _reverseType = !_reverseType;
    });
  }
}
