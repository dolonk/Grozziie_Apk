
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/example/show_texediting_container.dart';
import 'package:provider/provider.dart';

import '../providers/text_editing_provider.dart';
import '../ui/created_label/widgets/app_bar.dart';
import '../ui/created_label/widgets/bottom_app_bar.dart';
import 'create_label_container.dart';

double textValueSize = 15;
double screenWidth = ScreenUtil().screenWidth;
class CreateLabel extends StatefulWidget {
  const CreateLabel({Key? key}) : super(key: key);

  @override
  State<CreateLabel> createState() => _CreateLabelState();
}

class _CreateLabelState extends State<CreateLabel> {
  @override
  Widget build(BuildContext context,) {
    print("Rebuilding _CreateLabelState");

    double containerHeight = 200;
    double containerWidth = 400;

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: MyAppBar().buildAppBar(context),
      body: Consumer<TextEditingProvider>(
        builder: (context, textEditingProvider, _) {
          return Column(
            children: [
              CreatedLabelContainer(
                containerHeight: containerHeight,
                containerWidth: containerWidth,
              ),
              if (textEditingProvider.showTextEditingContainerFlag)
                Expanded(child: 
                ShowTextEditingContainer(textEditingProvider: textEditingProvider)
                )
              else
                Expanded(child: buildOptionsContainer(context, screenWidth,textEditingProvider)),
            ],
          );
        },
      ),
      bottomNavigationBar: MyBottomAppBar().buildBottomAppBarButton(screenWidth),
    );
  }

  Widget buildOptionsContainer(BuildContext context, double screenWidth,TextEditingProvider textEditingProvider) {
    return Stack(children: [
      Container(
        padding: REdgeInsets.only(bottom: 30.h),
        margin: REdgeInsets.only(top: 10.h),
        alignment: Alignment.topCenter,
        child: Image.asset('assets/icons/rectangle.png'),
      ),
      Container(
        margin: REdgeInsets.only(top: 10.h),
        width: screenWidth,
        decoration: BoxDecoration(
          color: const Color(0xff5DBCFF).withOpacity(0.13),
          borderRadius: BorderRadius.all(Radius.circular(13.w)),
        ),
        child: Column(
          children: [
            buildOptionRow(
              [
                buildIconButton(
                    'assets/icons/template.png', 'Template', () {}),
                Image.asset('assets/images/line_c.png'),
                buildIconButton('assets/icons/empty.png', 'Empty', () {}),
                buildIconButton(
                    'assets/icons/multiple.png', 'Multiple', () {}),
                buildIconButton('assets/icons/undo (2).png', 'Undo', () {}),
                buildIconButton('assets/icons/redo.png', 'Redo', () {}),
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: SingleChildScrollView(
                child: buildOptions(context, screenWidth,textEditingProvider),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget buildOptions(context, screenWidth,TextEditingProvider textEditingProvider) {
    return Container(
      height: 230.h,
      width: screenWidth,
      color: Colors.white,
      padding: REdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          buildOptionRow(
            [
              buildIconButton('assets/icons/text.png', 'Text', () {
                  textEditingProvider.updateShowTextEditingWidgetFlag(true);
                  textEditingProvider.updateShowTextEditingContainerFlag(true);
              }),
              buildIconButton('assets/icons/barcode.png', 'Barcode', () {}),
              buildIconButton('assets/icons/qrcode.png', 'QR Code', () {}),
              buildIconButton('assets/icons/table.png', 'Table', () {}),
            ],
          ),
          SizedBox(height: 15.h),
          buildOptionRow(
            [
              buildIconButton('assets/icons/images.png', 'Image', () {}),
              buildIconButton('assets/icons/scan.png', 'Scan', () {}),
              buildIconButton(
                  'assets/icons/serial_number.png', 'Serial Number', () {}),
              buildIconButton(
                  'assets/icons/insert_excel.png', 'Insert Excel', () {}),
            ],
          ),
          SizedBox(height: 15.h),
          buildOptionRow(
            [
              buildIconButton('assets/icons/time.png', 'Time', () {}),
              buildIconButton('assets/icons/shape.png', 'Shape', () {}),
              buildIconButton('assets/icons/line.png', 'Line', () {}),
            ],
          ),
        ],
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
}

/*String labelText = 'Double click here ';
final TextEditingController textEditingController = TextEditingController();
bool isBold = false;
bool isItalic = false;
bool? isUnderline = false;
TextAlign textAlignment = TextAlign.left;
double textFontSize = 15.0;
double textValueSize = 15;
double textFieldX = 0.0;
double textFieldY = 0.0;
double textFieldWidth = 200.0;
double textFieldHeight = 50.0;
String currentText = '';
double minTextFieldWidth = 40.0;

List<String> undoStack = [];
List<String> redoStack = [];
bool showTextEditingWidget = false;
bool showTextEditingContainerFlag = false;
int textButtonCounter = 0;
List<Widget> containerWidgets = [];
double textContainerX = 0;
double textContainerY = 0;*/
/*class _CreateLabelState extends State<CreateLabel> {

  late TextEditingProvider textEditingProvider;

  @override
  void initState() {
    super.initState();
    textEditingProvider = TextEditingProvider();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil().screenWidth;
    double containerHeight = 200;
    double containerWidth = 300;

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: MyAppBar().buildAppBar(context),
      body: ChangeNotifierProvider<TextEditingProvider>(
        create: (_) => textEditingProvider,
        child: Column(
          children: [
            CreatedLabelContainer(containerHeight: containerHeight, containerWidth: containerWidth,),
            if (textEditingProvider.showTextEditingContainerFlag)
              Expanded(child: showTextEditingContainer(screenWidth))
            else
              Expanded(child: buildOptionsContainer(context, screenWidth)),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomAppBar().buildBottomAppBarButton(screenWidth),
    );
  }

  Widget buildOptionsContainer(BuildContext context, double screenWidth) {
    return Stack(children: [
      Container(
        padding: REdgeInsets.only(bottom: 30.h),
        margin: REdgeInsets.only(top: 10.h),
        alignment: Alignment.topCenter,
        child: Image.asset('assets/icons/rectangle.png'),
      ),
      Container(
        margin: REdgeInsets.only(top: 10.h),
        width: screenWidth,
        decoration: BoxDecoration(
          color: const Color(0xff5DBCFF).withOpacity(0.13),
          borderRadius: BorderRadius.all(Radius.circular(13.w)),
        ),
        child: Column(
          children: [
            buildOptionRow(
              [
                buildIconButton(
                    'assets/icons/template.png', 'Template', () {}),
                Image.asset('assets/images/line_c.png'),
                buildIconButton('assets/icons/empty.png', 'Empty', () {}),
                buildIconButton(
                    'assets/icons/multiple.png', 'Multiple', () {}),
                buildIconButton('assets/icons/undo (2).png', 'Undo', () {}),
                buildIconButton('assets/icons/redo.png', 'Redo', () {}),
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: SingleChildScrollView(
                child: buildOptions(context, screenWidth),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget buildOptions(context, screenWidth) {
    return Container(
      height: 230.h,
      width: screenWidth,
      color: Colors.white,
      padding: REdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          buildOptionRow(
            [
              buildIconButton('assets/icons/text.png', 'Text', () {
                setState(() {
                  textEditingProvider.showTextEditingContainerFlag = true;
                  textEditingProvider.showTextEditingWidget = true;
                });
              }),
              buildIconButton('assets/icons/barcode.png', 'Barcode', () {}),
              buildIconButton('assets/icons/qrcode.png', 'QR Code', () {}),
              buildIconButton('assets/icons/table.png', 'Table', () {}),
            ],
          ),
          SizedBox(height: 15.h),
          buildOptionRow(
            [
              buildIconButton('assets/icons/images.png', 'Image', () {}),
              buildIconButton('assets/icons/scan.png', 'Scan', () {}),
              buildIconButton(
                  'assets/icons/serial_number.png', 'Serial Number', () {}),
              buildIconButton(
                  'assets/icons/insert_excel.png', 'Insert Excel', () {}),
            ],
          ),
          SizedBox(height: 15.h),
          buildOptionRow(
            [
              buildIconButton('assets/icons/time.png', 'Time', () {}),
              buildIconButton('assets/icons/shape.png', 'Shape', () {}),
              buildIconButton('assets/icons/line.png', 'Line', () {}),
            ],
          ),
        ],
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

  Widget showTextEditingContainer(double screenWidth) {
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
                  setState(() {
                    textEditingProvider.showTextEditingContainerFlag = false;
                  });
                }),
                Image.asset('assets/images/line_c.png'),
                buildTextIonButton(
                    'assets/icons/delete_icon.png', 'Delete', () {
                      setState(() {
                        textEditingProvider.showTextEditingWidget = false;
                        textEditingProvider.showTextEditingContainerFlag = false;
                      });
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
                    child: textEditingOptions(context, screenWidth))),
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

  Widget textEditingOptions(context, screenWidth) {
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
                    textEditingProvider.isBold ? Icons.format_bold : Icons.format_bold,
                    color: textEditingProvider.isBold ? Colors.black : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: textEditingProvider.toggleUnderline,
                  icon: Icon(
                    textEditingProvider.isUnderline!
                        ? Icons.format_underline
                        : Icons.format_underline,
                    color: textEditingProvider.isUnderline! ? Colors.black : Colors.grey,
                  ),
                ),
                IconButton(
                    onPressed: textEditingProvider.toggleItalic,
                    icon: Icon(
                      textEditingProvider.isItalic ? Icons.format_italic : Icons.format_italic,
                      color: textEditingProvider.isItalic ? Colors.black : Colors.grey,
                    )),
                SizedBox(width: 60.w),
                IconButton(
                  onPressed: () => textEditingProvider.changeAlignment(TextAlign.left),
                  icon: Icon(
                    Icons.format_align_left,
                    color: textEditingProvider.textAlignment == TextAlign.left
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () => textEditingProvider.changeAlignment(TextAlign.center),
                  icon: Icon(
                    Icons.format_align_center,
                    color: textEditingProvider.textAlignment == TextAlign.center
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () => textEditingProvider.changeAlignment(TextAlign.right),
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
}*/
/*createdLabelContainer(
      double containerHeight, double containerWidth, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          textBorderWidget = false;
          textIconBorder = false;
        });

      },
      child: Container(
        margin: REdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius:
            BorderRadius.all(Radius.circular(ScreenUtil().setWidth(13))),
          ),
          child: Stack(
            children: [
              if (showTextEditingWidget)
                Positioned(
                  left: textContainerX,
                  top: textContainerY,
                  child: GestureDetector(
                      onPanUpdate: (details) {
                        setState(() {
                          textContainerX += details.delta.dx;
                          textContainerY += details.delta.dy;
                        });
                      },
                      onTapDown: (details) {
                        setState(() {
                          textBorderWidget = true;
                          textIconBorder = true;
                          showTextEditingContainerFlag = true;
                        });
                      },
                      // Add the drag gesture handler
                      child: Container(
                        constraints: const BoxConstraints(
                          minHeight: 30,
                        ),
                        decoration: BoxDecoration(
                          border: textBorderWidget
                              ? Border.all(color: Colors.blue, width: 2)
                              : null,
                        ),
                        child: SizedBox(
                          width: textFieldWidth > 0 ? textFieldWidth : 1.0,
                          child: Stack(
                            children: [
                              GestureDetector(
                                onDoubleTap: () =>
                                    showTextInputDialog(context),
                                child: Text(
                                  labelText,
                                  style: TextStyle(
                                    fontWeight: isBold
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontStyle: isItalic
                                        ? FontStyle.italic
                                        : FontStyle.normal,
                                    decoration: isUnderline!
                                        ? TextDecoration.underline
                                        : null,
                                    fontSize: textFontSize,
                                  ),
                                  textAlign: textAlignment,
                                  maxLines:
                                  null, // Allow unlimited number of lines
                                ),
                              ),
                              Positioned(
                                right: -32,
                                bottom: -35,
                                // Adjust bottom position
                                child: GestureDetector(
                                  onPanUpdate: handleResizeGesture,
                                  child: Visibility(
                                    visible: textIconBorder,
                                    child: const SizedBox(
                                      width: 64,
                                      height: 64,
                                      child: Icon(
                                        Icons.touch_app,
                                        color: Colors.blue,
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ),
            ],
          ),
        ),
      ),
    );
  }*/
/*
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

  // text functionality
  void toggleBold() {
    setState(() {
      final previousText = textEditingController.text;
      isBold = !isBold;
      undoStack.add(previousText);
      applyChanges();
    });
  }

  void toggleUnderline() {
    setState(() {
      final previousText = textEditingController.text;
      isUnderline = !isUnderline!;
      undoStack.add(previousText);
      applyChanges();
    });
  }

  void toggleItalic() {
    setState(() {
      final previousText = textEditingController.text;
      isItalic = !isItalic;
      undoStack.add(previousText);
      applyChanges();
    });
  }

  void changeAlignment(TextAlign alignment) {
    setState(() {
      final previousText = textEditingController.text;
      textAlignment = alignment;
      undoStack.add(previousText);
      applyChanges();
    });
  }

  void changeFontSize(double fontSize) {
    setState(() {
      final previousText = textEditingController.text;
      textFontSize = fontSize;
      undoStack.add(previousText);
      applyChanges();
    });
  }

  void applyChanges() {
    textEditingController.value = TextEditingValue(
      text: currentText,
      selection: TextSelection.collapsed(offset: currentText.length),
    );
    updateTextFieldSize();
  }

  void updateTextFieldSize() {
    final textSpan = TextSpan(
      text: currentText,
      style: TextStyle(
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        decoration: isUnderline! ? TextDecoration.underline : null,
        fontSize: textFontSize,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: textFieldWidth);

    final textWidth = textPainter.size.width;
    final textHeight = textPainter.size.height;

    // Calculate the number of lines required based on the available width
    final availableWidth = textFieldWidth - 16.0; // Adjust for padding
    final lines = (textWidth / availableWidth).ceil();

    // Ensure a minimum height for the TextField
    final minHeight = textFontSize + 12.0; // Minimum height based on font size
    setState(() {
      textFieldHeight =
          (textHeight * lines + 16.0).clamp(minHeight, double.infinity);
    });
  }

  void handleResizeGesture(DragUpdateDetails details) {
    setState(() {
      final newWidth = textFieldWidth + details.delta.dx;
      const minWidth = 50.0; // Set the minimum width for the TextField
      if (newWidth >= minWidth) {
        textFieldWidth = newWidth;
      } else {
        textFieldWidth =
            minWidth; // Set the TextField width to the minimum value
      }
    });
  }

  // show text editing input data dialog
  final FocusNode inputFocusNode = FocusNode();
  void showTextInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          alignment: Alignment.bottomCenter,
          insetPadding: REdgeInsets.symmetric(vertical: 5, horizontal: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            margin: REdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              border: Border.all(color: Colors.black12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.center,
                    focusNode: inputFocusNode,
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        labelText = value; // Update labelText
                        updateTextFieldSize();
                      });
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    final inputBarcodeText = textEditingController.text;
                    if (inputBarcodeText.isNotEmpty) {
                      setState(() {
                        labelText =
                            textEditingController.text; // Update barcode data
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Confirm'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }*/
/* Widget showTextEditingContainer(double screenWidth, TextEditingProvider textEditingProvider) {
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
                  setState(() {
                    textEditingProvider.showTextEditingContainerFlag = false;
                  });
                }),
                Image.asset('assets/images/line_c.png'),
                buildTextIonButton(
                    'assets/icons/delete_icon.png', 'Delete', () {
                  setState(() {
                    textEditingProvider.showTextEditingWidget = false;
                    textEditingProvider.showTextEditingContainerFlag = false;
                  });
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
                    child: textEditingOptions(context, screenWidth,textEditingProvider))),
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
  }*/

