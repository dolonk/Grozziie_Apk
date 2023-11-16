import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../ui/created_label/global_variable.dart';

class QrCodeProvider extends ChangeNotifier {
  String qrcodeData = '';
  double minQrcodeSize = 50.0;
  bool isQrCodesTextCleared = true;

  void setShowQrcodeContainerFlag(bool flag) {
    showQrcodeContainerFlag = flag;
    notifyListeners();
  }

  void setShowQrcodeWidget(bool flag) {
    showQrcodeWidget = flag;
    notifyListeners();
  }

  void movingWidget(DragUpdateDetails details, int index) {
    qrCodeOffsets[index] = Offset(
      qrCodeOffsets[index].dx + details.delta.dx,
      qrCodeOffsets[index].dy + details.delta.dy,
    );
    notifyListeners();
  }

  void handleResizeGesture(DragUpdateDetails details, int? qrIndex) {
    if (selectedQRCodeIndex == qrIndex) {
      final newQrcodeSize =
          updateQrcodeSize[selectedQRCodeIndex] + details.delta.dx;

      updateQrcodeSize[selectedQRCodeIndex] =
          newQrcodeSize >= minQrcodeSize ? newQrcodeSize : minQrcodeSize;
    }
    notifyListeners();
  }

  void generateQRCode(String qrCodeValue, int qrFlag) {
    if (qrFlag == 1) {
      qrCodes.add('5678 ${qrCodes.length + 1}');
      qrCodeOffsets.add(Offset(0, (qrCodes.length * 5).toDouble()));
      updateQrcodeSize.add(100);
      selectedQRCodeIndex = qrCodes.length - 1;
      qrcodeBorderWidget = true;
    } else if (qrFlag == 2) {
      qrCodes.add(qrCodeValue);
      qrCodeOffsets.add(Offset(0, (qrCodes.length * 5).toDouble()));
      updateQrcodeSize.add(100);
      selectedQRCodeIndex = qrCodes.length - 1;
      qrcodeBorderWidget = true;
    }
    notifyListeners();
  }

  void deleteQRCode(int qrCodeIndex) {
    if (qrCodeIndex >= 0 && qrCodeIndex < qrCodes.length) {
      qrCodes.removeAt(qrCodeIndex);
      qrCodesControllers.remove(qrCodeIndex);
      qrCodeOffsets.removeAt(qrCodeIndex);

      if (qrCodeIndex < updateQrcodeSize.length) {
        updateQrcodeSize.removeAt(qrCodeIndex);
      }
      qrcodeBorderWidget = false;
    }
    notifyListeners();
  }

  void showQrcodeInputDialog(int selectIndex, BuildContext context) {
    if (!qrCodesControllers.containsKey(selectIndex)) {
      qrCodesControllers[selectIndex] = TextEditingController(text: "");
    }
    final TextEditingController? inputQrCodesTextEditingController =
        qrCodesControllers[selectIndex];
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
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      textAlign: TextAlign.center,
                      focusNode: inputFocusNode,
                      controller: inputQrCodesTextEditingController,
                      textInputAction: TextInputAction.newline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write Qr codes Text here",
                      ),
                      onChanged: (value) {
                        qrCodes[selectIndex] = value;
                        isQrCodesTextCleared = value.isEmpty;
                        notifyListeners();
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      final inputTextCode =
                          inputQrCodesTextEditingController?.text;
                      if (inputTextCode!.isNotEmpty) {
                        qrcodeData = inputTextCode;
                      } else {
                        qrcodeData = "56789";
                      }
                      notifyListeners();
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
      if (isQrCodesTextCleared) {
        qrCodes[selectIndex] = "56789";
        isQrCodesTextCleared = false;
        notifyListeners();
      }
    });
  }
}
