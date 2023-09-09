import 'dart:math';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../ui/created_label/global_variable.dart';

class BarcodeProvider extends ChangeNotifier {
  String barcodeData = '1234';
  double barcodeWidth = 100.0;
  double barcodeHeight = 80.0;
  double minBarcodeWidth = 80.0;
  double minBarcodeHeight = 50.0;
  Map<int, TextEditingController> barCodesControllers = {};
  FocusNode inputFocusNode = FocusNode();
  bool showBarcodeContainerFlag = false;
  bool showBarcodeWidget = false;
  bool barcodeBorderWidget = false;
  bool showBarData = true;
  bool isBarcodeTextCleared = true;
  String encodingType = 'Code128';
  String errorMessage = "";
  final List<String> supportedEncodingTypes = [
    'Code128',
    'UPC-A',
    'EAN-8',
    'EAN-13',
    'Code93',
    'Code39',
    'CodeBar',
  ];

  void setShowBarcodeContainerFlag(bool flag) {
    showBarcodeContainerFlag = flag;
    notifyListeners();
  }

  void setShowBarcodeWidget(bool flag) {
    showBarcodeWidget = flag;
    notifyListeners();
  }

  void setBarcodeBorderWidget(bool flag) {
    barcodeBorderWidget = flag;
    notifyListeners();
  }

  handleResizeGesture(DragUpdateDetails details, int? brIndex) {
    if (selectedBarCodeIndex == brIndex) {
      final newWidth =
          updateBarcodeWidth[selectedBarCodeIndex] + details.delta.dx;

      final newHeight =
          updateBarcodeHeight[selectedBarCodeIndex] + details.delta.dy;

      updateBarcodeWidth[selectedBarCodeIndex] =
          newWidth >= minBarcodeWidth ? newWidth : minBarcodeWidth;

      updateBarcodeHeight[selectedBarCodeIndex] =
          newHeight >= minBarcodeHeight ? newHeight : minBarcodeHeight;
    }
    notifyListeners();
  }

  void onTouchFunction(TapDownDetails details) {
    barcodeBorderWidget = true;
    notifyListeners();
  }

  void showBarcodeDataSwitch(bool flag) {
    showBarData = flag;
    notifyListeners();
  }

  checkDataLength(String encodingType) {
    switch (encodingType) {
      case 'Code128':
        isSupportedType = true;
        return Barcode.code128();
      case 'UPC-A':
        isSupportedType = true;
        return Barcode.upcA();
      case 'EAN-8':
        isSupportedType = true;
        return Barcode.ean8(drawSpacers: false);
      case 'EAN-13':
        isSupportedType = true;
        return Barcode.ean13(drawEndChar: false);
      case 'Code93':
        isSupportedType = true;
        return Barcode.code93();
      case 'Code39':
        isSupportedType = true;
        return Barcode.code39();
      case 'CodeBar':
        isSupportedType = true;
        return Barcode.codabar();
      default:
        isSupportedType = false;
        return Barcode.code128();
    }
  }

  void setSelectedType(String value) {
    encodingType = value;
    errorMessage = '';
    notifyListeners();
  }

  void updateErrorMessage(String value) {
    errorMessage =
        checkDataLength(value) ? '' : 'Invalid data length for $value';
    notifyListeners();
  }


  void rotationFunction() {
    if (barCodesContainerRotations[selectedBarCodeIndex] == 0.0) {
      barCodesContainerRotations[selectedBarCodeIndex] = -90 * pi / 180;
    } else if (barCodesContainerRotations[selectedBarCodeIndex] ==
        -90 * pi / 180) {
      barCodesContainerRotations[selectedBarCodeIndex] = pi;
    } else if (barCodesContainerRotations[selectedBarCodeIndex] == pi) {
      barCodesContainerRotations[selectedBarCodeIndex] = 90 * pi / 180;
    } else if (barCodesContainerRotations[selectedBarCodeIndex] == 90 * pi / 180) {
      barCodesContainerRotations[selectedBarCodeIndex] = 0.0;
    }
    notifyListeners();
  }

  void showBarcodeInputDialog(int selectIndex, BuildContext context) {
    if (!barCodesControllers.containsKey(selectIndex)) {
      barCodesControllers[selectIndex] = TextEditingController(text: "");
    }
    final TextEditingController? inputBarCodesEditingController =
        barCodesControllers[selectIndex];
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: TextField(
                      textAlign: TextAlign.center,
                      maxLength: 20,
                      focusNode: inputFocusNode,
                      controller: inputBarCodesEditingController,
                      textInputAction: TextInputAction.newline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write Barcodes Text here",
                        counterText: '',
                        //errorText: 'only twenty character you can input',
                        counterStyle: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onChanged: (value) {
                        barCodes[selectIndex] = value;
                        isBarcodeTextCleared = value.isEmpty;
                        notifyListeners();
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.08,
                    child: const Text(
                      '(20)',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      final inputTextCode =
                          inputBarCodesEditingController?.text;
                      if (inputTextCode!.isNotEmpty) {
                        barcodeData = inputTextCode;
                        notifyListeners();
                      } else {
                        barcodeData = "1234";
                        notifyListeners();
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
      // This code executes when the dialog is closed
      if (isBarcodeTextCleared) {
        barCodes[selectIndex] = "1234";
        isBarcodeTextCleared = false;
        notifyListeners();
      }
    });
  }

  void generateBarCode(String barcodeValue, int barCodeFlag) {
    if (barCodeFlag == 1) {
      barCodes.add('1234');
      barCodeOffsets.add(Offset(0, (barCodes.length * 5).toDouble()));
      barCodesContainerRotations.add(0);
      selectedBarCodeIndex = barCodes.length - 1;
      barcodeBorderWidget = true;
      updateBarcodeWidth.add(100);
      updateBarcodeHeight.add(80);
    } else if (barCodeFlag == 2) {
      barCodes.add('$barcodeValue ${barCodes.length + 1}');
      barCodeOffsets.add(Offset(0, (barCodes.length * 5).toDouble()));
      barCodesContainerRotations.add(0);
      selectedBarCodeIndex = barCodes.length - 1;
      barcodeBorderWidget = true;
      updateBarcodeWidth.add(100);
      updateBarcodeHeight.add(80);
    }
    notifyListeners();
  }

  void deleteBarCode(int barcodeIndex) {
    if (barcodeIndex >= 0 && barcodeIndex < barCodes.length) {
      barCodes.removeAt(barcodeIndex);
      barCodesControllers.remove(barcodeIndex);
      barCodeOffsets.removeAt(barcodeIndex);

      if (barcodeIndex < updateBarcodeWidth.length) {
        updateBarcodeWidth.removeAt(barcodeIndex);
      }
      if (barcodeIndex < updateBarcodeHeight.length) {
        updateBarcodeHeight.removeAt(barcodeIndex);
      }
      if (barcodeIndex < barCodesContainerRotations.length) {
        barCodesContainerRotations.removeAt(barcodeIndex);
      }
      barcodeBorderWidget = false;
    }
  }
}
