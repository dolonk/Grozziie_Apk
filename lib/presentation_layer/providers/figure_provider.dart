import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/global_variable.dart';

class FigureProvider extends ChangeNotifier {

  void setShowFigureWidget(bool flag) {
    showFigureWidget = flag;
    notifyListeners();
  }

  void setShowFigureContainerFlag(bool flag) {
    showFigureContainerFlag = flag;
    notifyListeners();
  }

  void setFixedFigureSize(bool flag) {
    showFigureWidget = flag;
    notifyListeners();
  }

  void onCallFunction(String flagToSet) {
    if (flagToSet == 'isRectangale') {
      isRectangaleUpdate[selectedFigureCodeIndex] = true;
      isRoundRectangaleUpdate[selectedFigureCodeIndex] = false;
      isCircularFixedUpdate[selectedFigureCodeIndex] = false;
      isCircularNotFixedUpdate[selectedFigureCodeIndex] = false;
    } else if (flagToSet == 'roundRectangale') {
      isRectangaleUpdate[selectedFigureCodeIndex] = false;
      isRoundRectangaleUpdate[selectedFigureCodeIndex] = true;
      isCircularFixedUpdate[selectedFigureCodeIndex] = false;
      isCircularNotFixedUpdate[selectedFigureCodeIndex] = false;
    } else if (flagToSet == 'circle') {
      isRectangaleUpdate[selectedFigureCodeIndex] = false;
      isRoundRectangaleUpdate[selectedFigureCodeIndex] = false;
      isCircularFixedUpdate[selectedFigureCodeIndex] = true;
      isCircularNotFixedUpdate[selectedFigureCodeIndex] = false;
    } else if (flagToSet == 'eggCircle') {
      isRectangaleUpdate[selectedFigureCodeIndex] = false;
      isRoundRectangaleUpdate[selectedFigureCodeIndex] = false;
      isCircularFixedUpdate[selectedFigureCodeIndex] = false;
      isCircularNotFixedUpdate[selectedFigureCodeIndex] = true;
    }
    notifyListeners();
  }

  void setSliderValue(double value) {
    updateFigureLineWidthSize[selectedFigureCodeIndex] = value;
    notifyListeners();
  }

  void fixedFigureSizeSwitch() {
    fixedFigureSize = !fixedFigureSize;
    notifyListeners();
  }

  void movingWidget(DragUpdateDetails details, int figureIndex) {
    figureOffsets[figureIndex] = Offset(
      figureOffsets[figureIndex].dx + details.delta.dx,
      figureOffsets[figureIndex].dy + details.delta.dy,
    );
    notifyListeners();
  }

  void generateFigureCode() {
    figureCodes.add('Figure');
    figureOffsets.add(Offset(0, (figureCodes.length * 5).toDouble()));
    isRectangaleUpdate.add(true);
    isRoundRectangaleUpdate.add(false);
    isCircularFixedUpdate.add(false);
    isCircularNotFixedUpdate.add(false);
    updateFigureLineWidthSize.add(2);
    updateFigureWidth.add(60);
    updateFigureHeight.add(60);
    figureCodesContainerRotations.add(0);
    selectedFigureCodeIndex = figureCodes.length - 1;
    figureBorderWidget = true;
    notifyListeners();
  }

  void deleteFigureCode(int figureIndex) {
    if (figureIndex >= 0 && figureIndex < figureCodes.length) {
      figureCodes.removeAt(figureIndex);
      figureOffsets.removeAt(figureIndex);

      if (figureIndex < isRectangaleUpdate.length) {
        isRectangaleUpdate.removeAt(figureIndex);
      }
      if (figureIndex < isRoundRectangaleUpdate.length) {
        isRoundRectangaleUpdate.removeAt(figureIndex);
      }
      if (figureIndex < isCircularFixedUpdate.length) {
        isCircularFixedUpdate.removeAt(figureIndex);
      }
      if (figureIndex < isCircularNotFixedUpdate.length) {
        isCircularNotFixedUpdate.removeAt(figureIndex);
      }
      if (figureIndex < updateFigureLineWidthSize.length) {
        updateFigureLineWidthSize.removeAt(figureIndex);
      }
      if (figureIndex < updateFigureWidth.length) {
        updateFigureWidth.removeAt(figureIndex);
      }
      if (figureIndex < updateFigureHeight.length) {
        updateFigureHeight.removeAt(figureIndex);
      }
      if (figureIndex < figureCodesContainerRotations.length) {
        figureCodesContainerRotations.removeAt(figureIndex);
      }
      figureBorderWidget = false;
    }
  }

  void handleResizeGesture(DragUpdateDetails details) {
    final newWidth =
        updateFigureWidth[selectedFigureCodeIndex] + details.delta.dx;
    final newHeight =
        updateFigureHeight[selectedFigureCodeIndex] + details.delta.dy;
    const minWidth = 3.0;
    const minHeight = 3.0;

    if (newWidth >= minWidth) {
      updateFigureWidth[selectedFigureCodeIndex] = newWidth;
    } else {
      updateFigureWidth[selectedFigureCodeIndex] = minWidth;
    }

    if (newHeight >= minHeight) {
      updateFigureHeight[selectedFigureCodeIndex] = newHeight;
    } else {
      updateFigureHeight[selectedFigureCodeIndex] = minHeight;
    }
    notifyListeners();
  }
}
