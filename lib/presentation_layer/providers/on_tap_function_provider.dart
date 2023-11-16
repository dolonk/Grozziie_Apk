import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../ui/created_label/global_variable.dart';

class OnTouchFunctionProvider extends ChangeNotifier {

  Future<void> showBorderContainerFlag(String flagToSet, bool value) async {
    if (flagToSet == 'textEditing') {
      textBorderWidget = value;
      showTextEditingContainerFlag = value;

      barcodeBorderWidget = false;
      showBarcodeContainerFlag = false;
      qrcodeBorderWidget = false;
      showQrcodeContainerFlag = false;
      tableBorderWidget = false;
      showTableContainerFlag = false;
      imageBorderWidget = false;
      showImageContainerFlag = false;
      showDateContainerFlag = false;
      showSerialContainerFlag = false;
      figureBorderWidget = false;
      showFigureContainerFlag = false;
      lineBorderWidget = false;
      showLineContainerFlag = false;
    } else if (flagToSet == 'barcode') {
      barcodeBorderWidget = value;
      showBarcodeContainerFlag = value;

      textBorderWidget = false;
      showTextEditingContainerFlag = false;
      showDateContainerFlag = false;
      qrcodeBorderWidget = false;
      showQrcodeContainerFlag = false;
      tableBorderWidget = false;
      showTableContainerFlag = false;
      imageBorderWidget = false;
      showImageContainerFlag = false;
      showSerialContainerFlag = false;
      figureBorderWidget = false;
      showFigureContainerFlag = false;
      lineBorderWidget = false;
      showLineContainerFlag = false;
    } else if (flagToSet == 'qrcode') {
      qrcodeBorderWidget = value;
      showQrcodeContainerFlag = value;

      textBorderWidget = false;
      showTextEditingContainerFlag = false;
      showDateContainerFlag = false;
      barcodeBorderWidget = false;
      showBarcodeContainerFlag = false;
      tableBorderWidget = false;
      showTableContainerFlag = false;
      imageBorderWidget = false;
      showImageContainerFlag = false;
      showSerialContainerFlag = false;
      figureBorderWidget = false;
      showFigureContainerFlag = false;
      lineBorderWidget = false;
      showLineContainerFlag = false;
    } else if (flagToSet == 'table') {
      tableBorderWidget = value;
      showTableContainerFlag = value;

      textBorderWidget = false;
      showTextEditingContainerFlag = false;
      showDateContainerFlag = false;
      barcodeBorderWidget = false;
      showBarcodeContainerFlag = false;
      qrcodeBorderWidget = false;
      showQrcodeContainerFlag = false;
      imageBorderWidget = false;
      showImageContainerFlag = false;
      showSerialContainerFlag = false;
      figureBorderWidget = false;
      showFigureContainerFlag = false;
      lineBorderWidget = false;
      showLineContainerFlag = false;
    } else if (flagToSet == 'image') {
      imageBorderWidget = value;
      showImageContainerFlag = value;

      textBorderWidget = false;
      showTextEditingContainerFlag = false;
      showDateContainerFlag = false;
      barcodeBorderWidget = false;
      showBarcodeContainerFlag = false;
      qrcodeBorderWidget = false;
      showQrcodeContainerFlag = false;
      tableBorderWidget = false;
      showTableContainerFlag = false;
      showSerialContainerFlag = false;
      figureBorderWidget = false;
      showFigureContainerFlag = false;
      lineBorderWidget = false;
      showLineContainerFlag = false;
    } else if (flagToSet == 'date') {
      textBorderWidget = value;
      showDateContainerFlag = value;

      showTextEditingContainerFlag = false;
      barcodeBorderWidget = false;
      showBarcodeContainerFlag = false;
      qrcodeBorderWidget = false;
      showQrcodeContainerFlag = false;
      tableBorderWidget = false;
      showTableContainerFlag = false;
      imageBorderWidget = false;
      showImageContainerFlag = false;
      showSerialContainerFlag = false;
      figureBorderWidget = false;
      showFigureContainerFlag = false;
      lineBorderWidget = false;
      showLineContainerFlag = false;
    } else if (flagToSet == 'serial') {
      textBorderWidget = value;
      showSerialContainerFlag = value;

      showTextEditingContainerFlag = false;
      barcodeBorderWidget = false;
      showBarcodeContainerFlag = false;
      qrcodeBorderWidget = false;
      showQrcodeContainerFlag = false;
      tableBorderWidget = false;
      showTableContainerFlag = false;
      imageBorderWidget = false;
      showImageContainerFlag = false;
      showDateContainerFlag = false;
      figureBorderWidget = false;
      showFigureContainerFlag = false;
      lineBorderWidget = false;
      showLineContainerFlag = false;
    } else if (flagToSet == 'figure') {
      figureBorderWidget = value;
      showFigureContainerFlag = value;

      textBorderWidget = false;
      showSerialContainerFlag = false;
      showTextEditingContainerFlag = false;
      barcodeBorderWidget = false;
      showBarcodeContainerFlag = false;
      qrcodeBorderWidget = false;
      showQrcodeContainerFlag = false;
      tableBorderWidget = false;
      showTableContainerFlag = false;
      imageBorderWidget = false;
      showImageContainerFlag = false;
      showDateContainerFlag = false;
      lineBorderWidget = false;
      showLineContainerFlag = false;
    }else if (flagToSet == 'line') {
      lineBorderWidget = value;
      showLineContainerFlag = value;

      textBorderWidget = false;
      showSerialContainerFlag = false;
      showTextEditingContainerFlag = false;
      barcodeBorderWidget = false;
      showBarcodeContainerFlag = false;
      qrcodeBorderWidget = false;
      showQrcodeContainerFlag = false;
      tableBorderWidget = false;
      showTableContainerFlag = false;
      imageBorderWidget = false;
      showImageContainerFlag = false;
      showDateContainerFlag = false;
      figureBorderWidget = false;
      showFigureContainerFlag = false;
    }
    notifyListeners();
  }

  void rotateFunction(List<double> rotations, int selectedIndex) {
    if (rotations[selectedIndex] == 0.0) {
      rotations[selectedIndex] = -90 * pi / 180;
    } else if (rotations[selectedIndex] == -90 * pi / 180) {
      rotations[selectedIndex] = pi; // 180 degrees
    } else if (rotations[selectedIndex] == pi) {
      rotations[selectedIndex] = 90 * pi / 180;
    } else if (rotations[selectedIndex] == 90 * pi / 180) {
      rotations[selectedIndex] = 0.0;
    }
    notifyListeners();
  }
}
