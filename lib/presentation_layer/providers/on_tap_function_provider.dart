

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../ui/created_label/global_variable.dart';

class OnTouchFunctionProvider extends ChangeNotifier{

  /*void onTouchFunction(TapDownDetails details, bool flag, bool selectedBorderWidgetFlag) {
    selectedBorderWidgetFlag = true;
    textBorderWidget = flag;
    qrcodeBorderWidget = flag;
    qrcodeBorderWidget = flag;
    notifyListeners();
  }*/


  Future<void> clearContainerFlag() async {
    showTextEditingContainerFlag = false;
    showBarcodeContainerFlag = false;
    showQrcodeContainerFlag = false;
    showTableContainerFlag = false;
    //showImageContainerFlag = false;
    showDateContainerFlag = false;
    //showEmojiContainerFlag = false;
    //showLineContainerFlag = false;
    //showFigureContainerFlag = false;
    //showSerialContainerFlag = false;
    //showBackgroundImageContainerFlag = false;
    notifyListeners();
  }


}
