import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../utils/app_style.dart';
import '../../../providers/barcode_provider.dart';
import '../../../providers/qrcode_provider.dart';
import '../../../providers/scan_provider.dart';
import '../../../providers/text_editing_provider.dart';
import '../global_variable.dart';

class ScanService {
  final ScanProvider scanModel;
  final BuildContext context;

  ScanService(this.scanModel, this.context);

  Future<void> scanTextBarcodeQrcode(
    context,
    TextEditingProvider textModel,
    BarcodeProvider brModel,
    QrCodeProvider qrModel,
  ) async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        '#FF0000',
        'Cancel',
        true,
        ScanMode.DEFAULT,
      );
    } catch (e) {
      scanResult = 'Failed to get the barcode or QR code: $e';
    }

    showScanDialog(context, textModel, qrModel, brModel);

    scanModel.updateScanResult(scanResult);
    scanModel.updateShowTextResult(false);
    scanModel.updateShowBarcode(false);
    scanModel.updateShowQRCode(false);
  }

  Future<void> showScanDialog(context, TextEditingProvider textModel,
      QrCodeProvider qrModel, BarcodeProvider brModel) async {
    if (scanRes != '-1') {
      bool isButtonClick = true;
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                margin: REdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Text(
                      'Scanning Result',
                      style: bodyMedium,
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: REdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Choose insertion type',
                          style: bodySmall,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      height: 150.h,
                      width: 260.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(11.r)),
                      ),
                      child: Center(child: buildResultWidget()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              showTextResult = true;
                              showBarcode = false;
                              showQRCode = false;
                            });
                          },
                          child: Text(
                            'Text',
                            style: (showTextResult == true ||
                                    isButtonClick == true)
                                ? const TextStyle(color: Colors.blue)
                                : bodySmall,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isButtonClick = false;
                              showBarcode = true;
                              showQRCode = false;
                              showTextResult = false;
                            });
                          },
                          child: Text(
                            'Bar Code',
                            style: showBarcode
                                ? const TextStyle(color: Colors.blue)
                                : bodySmall,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isButtonClick = false;
                              showQRCode = true;
                              showBarcode = false;
                              showTextResult = false;
                            });
                          },
                          child: Text(
                            'QR Code',
                            style: showQRCode
                                ? const TextStyle(color: Colors.blue)
                                : bodySmall,
                          ),
                        ),
                      ],
                    ),
                    ReusableButton(
                      width: 170.w,
                      height: 45.h,
                      text: 'Confirm',
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          if (showBarcode || showQRCode || showTextResult) {
                            if (showQRCode) {
                              qrModel.setShowQrcodeWidget(true);
                              qrModel.setShowQrcodeContainerFlag(true);
                              qrModel.generateQRCode(scanRes, 2);
                            } else if (showBarcode) {
                              brModel.setShowBarcodeWidget(true);
                              brModel.setShowBarcodeContainerFlag(true);
                              brModel.generateBarCode(scanRes, 2);
                            } else if (showTextResult) {
                              textModel.setShowTextEditingWidget(true);
                              textModel.setShowTextEditingContainerFlag(true);
                              textModel.generateTextCode(scanRes, 2);
                            }
                          } else {
                            showTextResult = true;
                            textModel.setShowTextEditingWidget(true);
                            textModel.setShowTextEditingContainerFlag(true);
                            textModel.generateTextCode(scanRes, 2);
                          }
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }
  }

  Widget buildResultWidget() {
    if (showBarcode) {
      return BarcodeWidget(
        barcode: Barcode.code128(),
        data: scanRes,
        color: Colors.black,
        width: 200,
        height: 80,
      );
    } else if (showQRCode) {
      return QrImageView(
        data: scanRes,
        backgroundColor: Colors.transparent,
        version: QrVersions.auto,
        size: 100,
      );
    } else {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          height: 150,
          width: 250,
          child: Center(
            child: Text(
              scanRes,
              style: bodySmall,
            ),
          ),
        ),
      );
    }
  }
}
