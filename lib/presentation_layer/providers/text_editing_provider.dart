import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextEditingProvider extends ChangeNotifier {
  String labelText = 'Double click here ';
  final TextEditingController textEditingController = TextEditingController();
  bool isBold = false;
  bool isItalic = false;
  bool? isUnderline = false;
  TextAlign textAlignment = TextAlign.left;
  double textFontSize = 25.0;
  double textValueSize = 15;
  double textFieldX = 0.0;
  double textFieldY = 0.0;
  double textFieldWidth = 200.0;
  double textFieldHeight = 50.0;
  String currentText = '';
  double minTextFieldWidth = 40.0;
  List<String> undoStack = [];
  List<String> redoStack = [];
  int textButtonCounter = 0;
  List<Widget> containerWidgets = [];
  double textContainerX = 0;
  double textContainerY = 0;
  bool _wrapByWord = false;
  bool _reverseType = false;

  bool get wrapByWord => _wrapByWord;

  bool get reverseType => _reverseType;

  bool showTextEditingWidget = false;
  bool showTextEditingContainerFlag = false;
  bool textBorderWidget = false;

  void setTextBorderWidgetFlag(bool flag) {
    textBorderWidget = flag;
    notifyListeners();
  }

  void setShowTextEditingContainerFlag(bool flag) {
    showTextEditingContainerFlag = flag;
    notifyListeners();
  }

  void setShowTextEditingWidget(bool flag) {
    showTextEditingWidget = flag;
    notifyListeners();
  }

  void setTextContainerPosition(double dx, double dy) {
    textContainerX += dx;
    textContainerY += dy;
    notifyListeners();
  }

  void toggleBold() {
    final previousText = textEditingController.text;
    isBold = !isBold;
    undoStack.add(previousText);
    applyChanges();
    notifyListeners();
  }

  void toggleUnderline() {
    final previousText = textEditingController.text;
    isUnderline = !(isUnderline ?? false); // If null, assume false
    undoStack.add(previousText);
    applyChanges();
    notifyListeners();
  }

  void toggleItalic() {
    final previousText = textEditingController.text;
    isItalic = !isItalic;
    undoStack.add(previousText);
    applyChanges();
    notifyListeners();
  }

  void changeAlignment(TextAlign alignment) {
    final previousText = textEditingController.text;
    textAlignment = alignment;
    undoStack.add(previousText);
    applyChanges();
    notifyListeners();
  }

  void changeFontSize(double fontSize) {
    final previousText = textEditingController.text;
    textFontSize = fontSize;
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
    currentText = labelText; // Apply the changes to currentText
    notifyListeners(); // Notify the listeners about the state change
  }

  void handleResizeGesture(DragUpdateDetails details) {
    final newWidth = textFieldWidth + details.delta.dx;
    const minWidth = 20.0;
    if (newWidth >= minWidth) {
      textFieldWidth = newWidth;
    } else {
      textFieldWidth = minWidth;
    }
    notifyListeners();
  }

  void handleTapDown(TapDownDetails details) {
    showTextEditingContainerFlag = true;
    notifyListeners();
  }

  void handlePanUpdate(DragUpdateDetails details) {
    textContainerX += details.delta.dx;
    textContainerY += details.delta.dy;
    notifyListeners();
  }

  void showTextInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Create a FocusNode and request focus on it
        FocusNode inputFocusNode = FocusNode();
        FocusScope.of(context).requestFocus(inputFocusNode);
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
                    maxLines: null,
                    textAlign: TextAlign.center,
                    focusNode: inputFocusNode,
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      applyLabelChanges(value);
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    final inputText = textEditingController.text;
                    if (inputText.isNotEmpty) {
                      applyLabelChanges(inputText);
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
  }

  void warpByWordSwitch() {
    _wrapByWord = !_wrapByWord;
    notifyListeners();
  }

  void reverseTypeSwitch() {
    _reverseType = !_reverseType;
    notifyListeners();
  }
}
