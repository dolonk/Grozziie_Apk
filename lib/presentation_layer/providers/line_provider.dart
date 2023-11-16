import 'package:flutter/material.dart';

import '../ui/created_label/global_variable.dart';

class LineProvide extends ChangeNotifier {
  void setShowLineWidget(bool flag) {
    showLineWidget = flag;
    notifyListeners();
  }

  void setShowLineContainerFlag(bool flag) {
    showLineContainerFlag = flag;
    notifyListeners();
  }

  void setIsDottedLineUpdateFlag(bool flag) {
    isDottedLineUpdate[selectedLineCodeIndex] = flag;
    notifyListeners();
  }

  void setSliderValue(double value) {
    updateSliderLineWidth[selectedLineCodeIndex] = value;
    notifyListeners();
  }

  void movingWidget(DragUpdateDetails details, int lineIndex) {
    lineOffsets[lineIndex] = Offset(
      lineOffsets[lineIndex].dx + details.delta.dx,
      lineOffsets[lineIndex].dy + details.delta.dy,
    );
    notifyListeners();
  }

  void generateLineCode() {
    lineCodes.add('Line');
    lineOffsets.add(Offset(0, (lineCodes.length * 5).toDouble()));
    isDottedLineUpdate.add(false);
    updateSliderLineWidth.add(2);
    lineCodesContainerRotations.add(0);
    updateLineWidth.add(100);
    selectedLineCodeIndex = lineCodes.length - 1;
    lineBorderWidget = true;
    notifyListeners();
  }

  void deleteLineCode(int lineIndex) {
    if (lineIndex >= 0 && lineIndex < lineCodes.length) {
      lineCodes.removeAt(lineIndex);
      lineOffsets.removeAt(lineIndex);

      if (lineIndex < lineCodesContainerRotations.length) {
        lineCodesContainerRotations.removeAt(lineIndex);
      }
      if (lineIndex < updateSliderLineWidth.length) {
        updateSliderLineWidth.removeAt(lineIndex);
      }
      if (lineIndex < isDottedLineUpdate.length) {
        isDottedLineUpdate.removeAt(lineIndex);
      }
      if (lineIndex < updateLineWidth.length) {
        updateLineWidth.removeAt(lineIndex);
      }
    }
    notifyListeners();
  }

  void handleResizeGesture(DragUpdateDetails details, int lineIndex) {
    if (selectedLineCodeIndex == lineIndex) {
      final newWidth =
          updateLineWidth[selectedLineCodeIndex] + details.delta.dx;
      const minWidth = 50.0;

      if (newWidth >= minWidth) {
        updateLineWidth[selectedLineCodeIndex] = newWidth;
      } else {
        updateLineWidth[selectedLineCodeIndex] = minWidth;
      }
    }
    notifyListeners();
  }
}
