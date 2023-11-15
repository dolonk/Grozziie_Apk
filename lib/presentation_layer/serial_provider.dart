import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/global_variable.dart';

class SerialProvider extends ChangeNotifier {
  bool showStyleContainer = false;
  bool isSerialTextCleared = true;
  String value = "";
  Map<int, TextEditingController> serialTextControllers = {};

  void setShowSerialContainerFlag(bool flag) {
    showSerialContainerFlag = flag;
    notifyListeners();
  }

  void setShowStyleContainer(bool flag) {
    showStyleContainer = flag;
    notifyListeners();
  }

  void showSerialInputDialog(int selectIndex, BuildContext context,
      int inputFlag, String getTextValue) {
    if (!serialTextControllers.containsKey(selectIndex)) {
      serialTextControllers[selectIndex] = TextEditingController(
          text: getTextValue); //TextEditingController(text:getTextValue);
    }
    final TextEditingController inputTextEditingController =
        TextEditingController(
            text: getTextValue); // serialTextControllers[selectIndex];
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
                const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              margin: const EdgeInsets.all(5),
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
                      onChanged: (getTextValue) {
                        if (inputFlag == 1) {
                          prefixNumber[selectIndex] = getTextValue;
                        }

                        if (inputFlag == 2) {
                          suffixNumber[selectIndex] = getTextValue;
                        }

                        if (inputFlag == 3) {
                          textCodes[selectIndex] = getTextValue;
                        }

                        if (inputFlag == 4) {
                          int? parsedValue = int.tryParse(getTextValue);
                          if (parsedValue != null) {
                            incrementNumber[selectIndex] = parsedValue;
                          } else {}
                        }
                        notifyListeners();
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      final inputTextCode = inputTextEditingController.text;
                      if (inputTextCode.isNotEmpty) {
                        value = inputTextCode;
                      } else {
                        value = "01";
                      }
                      Navigator.pop(context);
                      notifyListeners();
                    },
                    child: const Text('Confirm'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
