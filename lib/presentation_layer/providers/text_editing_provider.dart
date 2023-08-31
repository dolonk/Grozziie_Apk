import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../ui/created_label/global_variable.dart';

class TextEditingProvider extends ChangeNotifier {
  String labelText = 'Double click here ';
  final TextEditingController textEditingController = TextEditingController();
  bool isBold = false;
  bool isItalic = false;
  bool? isUnderline = false;
  TextAlign textAlignment = TextAlign.left;
  double textFontSize = 25.0;
  double textValueSize = 25;
  String currentText = '';
  List<String> undoStack = [];
  bool showTextEditingWidget = false;
  bool showTextEditingContainerFlag = false;
  bool textBorderWidget = false;



  void setTextBorderWidgetFlag(bool flag) {
    textBorderWidget = flag;
    notifyListeners();
  }

  void setShowTextEditingWidget(bool flag) {
    showTextEditingWidget = flag;
    notifyListeners();
  }

  void setShowTextEditingContainerFlag(bool flag) {
    showTextEditingContainerFlag = flag;
    notifyListeners();
  }

  void handleResizeGesture(DragUpdateDetails details, int textIndex) {
    if (selectedTextCodeIndex == textIndex) {
      final newWidth =
          updateTextWidthSize[selectedTextCodeIndex] + details.delta.dx;
      const minWidth = 20.0;
      if (newWidth >= minWidth) {
        updateTextWidthSize[selectedTextCodeIndex] = newWidth;
      } else {
        updateTextWidthSize[selectedTextCodeIndex] = minWidth;
      }
    }
    notifyListeners();
  }

  void onTouchFunction(TapDownDetails details) {
    showTextEditingContainerFlag = true;
    textBorderWidget = true;
    notifyListeners();
  }

  void toggleBold() {
    final previousText = textEditingController.text;
    isBold = !isBold;
    if (isBold) {
      updateTextBold[selectedTextCodeIndex] = true;
    } else {
      updateTextBold[selectedTextCodeIndex] = false;
    }
    undoStack.add(previousText);
    applyChanges();
    notifyListeners();
  }

  void toggleUnderline() {
    final previousText = textEditingController.text;
    isUnderline = !isUnderline!;
    if (isUnderline!) {
      updateTextUnderline[selectedTextCodeIndex] = true;
    } else {
      updateTextUnderline[selectedTextCodeIndex] = false;
    }
    undoStack.add(previousText);
    applyChanges();
    notifyListeners();
  }

  void toggleItalic() {
    final previousText = textEditingController.text;
    isItalic = !isItalic;
    if (isItalic) {
      updateTextItalic[selectedTextCodeIndex] = true;
    } else {
      updateTextItalic[selectedTextCodeIndex] = false;
    }
    undoStack.add(previousText);
    applyChanges();
    notifyListeners();
  }

  void changeAlignment(TextAlign alignment) {
    final previousText = textEditingController.text;
    textAlignment = alignment;
    updateTextAlignment[selectedTextCodeIndex] = alignment;
    undoStack.add(previousText);
    applyChanges();
    notifyListeners();
  }

  void changeFontSize(double fontSize) {
    final previousText = textEditingController.text;
    textFontSize = fontSize;
    if (fontSize == textFontSize) {
      updateTextFontSize[selectedTextCodeIndex] = fontSize;
    } else {
      updateTextFontSize[selectedTextCodeIndex] = 15;
    }
    undoStack.add(previousText);
    applyChanges();
    notifyListeners();
  }

  void applyLabelChanges(String label) {
    final previousText = textEditingController.text;
    labelText = label;
    undoStack.add(previousText);
    applyChanges();
    notifyListeners();
  }

  void applyChanges() {
    currentText = labelText;
    notifyListeners();
  }

  void rotationFunction() {
    if (textContainerRotations[selectedTextCodeIndex] == 0.0) {
      textContainerRotations[selectedTextCodeIndex] = -90 * pi / 180;
    } else if (textContainerRotations[selectedTextCodeIndex] ==
        -90 * pi / 180) {
      textContainerRotations[selectedTextCodeIndex] = pi;
    } else if (textContainerRotations[selectedTextCodeIndex] == pi) {
      textContainerRotations[selectedTextCodeIndex] = 90 * pi / 180;
    } else if (textContainerRotations[selectedTextCodeIndex] == 90 * pi / 180) {
      textContainerRotations[selectedTextCodeIndex] = 0.0;
    }
    notifyListeners();
  }

  void generateTextCode(String textValue, int textCodeFlag) {
    if (textCodeFlag == 1) {
      textCodes.add('Double Click here');
      selectedTextCodeIndex = textCodes.length - 1;
      textBorderWidget = true;
      textCodeOffsets.add(Offset(0, (textCodes.length * 5).toDouble()));
      updateTextBold.add(false);
      updateTextItalic.add(false);
      updateTextUnderline.add(false);
      updateTextAlignment.add(TextAlign.left);
      updateTextFontSize.add(25.0);
      selectTimeTextScanInt.add(1);
      textContainerRotations.add(0.0);
      updateTextWidthSize.add(200);
      prefixNumber.add('');
      suffixNumber.add('');
      incrementNumber.add(0);
    }
    /*else if (textCodeFlag == 2) {
        textCodes.add(textValue);
        selectedTextCodeIndex = textCodes.length - 1;
        textBorderWidget = true;
        textCodeOffsets.add(Offset(0, (textCodes.length * 5).toDouble()));
        updateTextBold.add(false);
        updateTextItalic.add(false);
        updateTextUnderline.add(false);
        updateTextAlignment.add(TextAlign.left);
        updateTextFontSize.add(15.0);
        SelectTime_Text_Scan_Int.add(2);
        textContainerRotations.add(0.0);
        updateTextWidthSize.add(130);
        prefixNumber.add('');
        suffixNumber.add('');
        incrementNumber.add(0);
      } else if (textCodeFlag == 3) {
        DateTime currentTime = DateTime.now();
        String formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(currentTime);
        String completeTextValue = formattedDateTime;
        textCodes.add(completeTextValue);
        selectedTextCodeIndex = textCodes.length - 1;
        textBorderWidget = true;
        textCodeOffsets.add(Offset(0, (textCodes.length * 5).toDouble()));
        updateTextBold.add(false);
        updateTextItalic.add(false);
        updateTextUnderline.add(false);
        updateTextAlignment.add(TextAlign.left);
        updateTextFontSize.add(15.0);
        SelectTime_Text_Scan_Int.add(3);
        textContainerRotations.add(0.0);
        updateTextWidthSize.add(200);
        prefixNumber.add('');
        suffixNumber.add('');
        incrementNumber.add(0);
      } else if (textCodeFlag == 4) {
        textCodes.add('01');
        selectedTextCodeIndex = textCodes.length-1;
        textBorderWidget = true;
        showSerialContainerFlag = true;
        textCodeOffsets.add(Offset(0, (textCodes.length * 5).toDouble()));
        updateTextBold.add(false);
        updateTextItalic.add(false);
        updateTextUnderline.add(false);
        updateTextAlignment.add(TextAlign.center);
        updateTextFontSize.add(25);
        SelectTime_Text_Scan_Int.add(4);
        textContainerRotations.add(0.0);
        updateTextWidthSize.add(50);
        prefixNumber.add('');
        suffixNumber.add('');
        incrementNumber.add(1);
      }*/
    notifyListeners();
  }

  void deleteTextCode(int textIndex) {
    if (textIndex >= 0 && textIndex < textCodes.length) {
      textCodes.removeAt(textIndex);
      textControllers.remove(textIndex);
      serialTextControllers.remove(textIndex);
      textBorderWidget = false;
      if (textIndex < textCodeOffsets.length) {
        textCodeOffsets.removeAt(textIndex);
      }
      if (textIndex < updateTextBold.length) {
        updateTextBold.removeAt(textIndex);
      }
      if (textIndex < updateTextUnderline.length) {
        updateTextUnderline.removeAt(textIndex);
      }
      if (textIndex < updateTextItalic.length) {
        updateTextItalic.removeAt(textIndex);
      }
      if (textIndex < updateTextFontSize.length) {
        updateTextFontSize.removeAt(textIndex);
      }
      if (textIndex < updateTextAlignment.length) {
        updateTextAlignment.removeAt(textIndex);
      }
      if (textIndex < selectTimeTextScanInt.length) {
        selectTimeTextScanInt.removeAt(textIndex);
      }
      if (textIndex < textContainerRotations.length) {
        textContainerRotations.removeAt(textIndex);
      }
      if (textIndex < updateTextWidthSize.length) {
        updateTextWidthSize.removeAt(textIndex);
      }
      if (textIndex < prefixNumber.length) {
        prefixNumber.removeAt(textIndex);
      }
      if (textIndex < suffixNumber.length) {
        suffixNumber.removeAt(textIndex);
      }
      if (textIndex < incrementNumber.length) {
        incrementNumber.removeAt(textIndex);
      }
    }
    notifyListeners();
  }

  // for show input data dialog
  bool isTextCleared = true;
  bool isSerialTextCleared = true;
  Map<int, TextEditingController> textControllers = {};
  Map<int, TextEditingController> serialTextControllers = {};
  FocusNode inputFocusNode = FocusNode();

  void showTextInputDialog(int selectIndex, BuildContext context) {
    if (!textControllers.containsKey(selectIndex)) {
      textControllers[selectIndex] = TextEditingController(text: "");
    }
    final TextEditingController? inputTextEditingController =
        textControllers[selectIndex];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        FocusScope.of(context).requestFocus(inputFocusNode);
        return WillPopScope(
          onWillPop: () async {
            inputFocusNode.unfocus();
            Navigator.of(context).pop();
            return false;
          },
          child: Dialog(
            alignment: Alignment.bottomCenter,
            insetPadding:
                 REdgeInsets.symmetric(vertical: 5, horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Container(
              margin:  REdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      focusNode: inputFocusNode,
                      controller: inputTextEditingController,
                      textInputAction: TextInputAction.newline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write Text here",
                      ),
                      onChanged: (value) {
                        textCodes[selectIndex] = value;
                        isTextCleared = value.isEmpty;
                        notifyListeners();
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      final inputTextCode = inputTextEditingController?.text;
                      if (inputTextCode!.isNotEmpty) {
                        labelText = inputTextCode;
                        notifyListeners();
                      } else {
                        labelText = "Double click here";
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Confirm'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).then((_) {
      if (isTextCleared) {
        textCodes[selectIndex] = "Double click here";
        isTextCleared = false;
        notifyListeners();
      }
    });
  }
}

enum TimeOfDayFormatD {
  h_colon_mm_space_a,
  h_colon_mm_colon_ss_space_a,
  H_colon_mm,
  H_colon_mm_colon_ss,
  None,
}
