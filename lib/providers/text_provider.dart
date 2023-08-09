

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextProvider extends ChangeNotifier{
  String labelText = 'Double click here';
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
  int textButtonCounter = 0;
  List<Widget> containerWidgets = [];
  double textContainerX = 0;
  double textContainerY = 0;

  bool showTextEditingWidget = false;
  bool showTextEditingContainerFlag = false;

  void toggleBold() {
    isBold = !isBold;
    applyChanges();
  }

  void toggleUnderline() {
    isUnderline = !isUnderline!;
    applyChanges();
  }

  void toggleItalic() {
    isItalic = !isItalic;
    applyChanges();
  }

  void changeAlignment(TextAlign alignment) {
    textAlignment = alignment;
    applyChanges();
  }

  void changeFontSize(double fontSize) {
    textFontSize = fontSize;
    applyChanges();
  }

  void applyChanges() {
    textEditingController.value = TextEditingValue(
      text: currentText,
      selection: TextSelection.collapsed(offset: currentText.length),
    );
    updateTextFieldSize();
    notifyListeners();
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

    final availableWidth = textFieldWidth - 16.0; // Adjust for padding
    final lines = (textWidth / availableWidth).ceil();

    final minHeight = textFontSize + 12.0; // Minimum height based on font size
    textFieldHeight = (textHeight * lines + 16.0).clamp(minHeight, double.infinity);
  }

  void handleResizeGesture(DragUpdateDetails details) {
    final newWidth = textFieldWidth + details.delta.dx;
    const minWidth = 50.0; // Set the minimum width for the TextField
    textFieldWidth = newWidth >= minWidth ? newWidth : minWidth;
  }

  void showTextInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          alignment: Alignment.bottomCenter,
          insetPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.black12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      labelText = value;
                      notifyListeners();
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    final inputText = textEditingController.text;
                    if (inputText.isNotEmpty) {
                      labelText = inputText;
                      notifyListeners();
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Confirm'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}