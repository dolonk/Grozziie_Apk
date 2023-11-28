import 'package:flutter/material.dart';
import 'package:grozziieapk/presentation_layer/providers/qrcode_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../global_variable.dart';

class QrCodeContainerClass extends StatelessWidget {
  final String qrcodeData;
  int? qrIndex;

  QrCodeContainerClass({super.key, required this.qrcodeData, this.qrIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<QrCodeProvider>(
      builder: (context, qrCodeModel, child) {
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: qrcodeBorderWidget
                      ? Border.all(
                          color: selectedQRCodeIndex == qrIndex
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2.0)
                      : null),
              child: QrImageView(
                data: qrcodeData,
                backgroundColor: Colors.transparent,
                version: QrVersions.auto,
                //size: qrcodeSize,
                size: updateQrcodeSize[qrIndex!],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onPanUpdate: (details) {
                  qrCodeModel.handleResizeGesture(details, qrIndex);
                },
                child: Visibility(
                  visible: selectedQRCodeIndex == qrIndex
                      ? qrcodeBorderWidget
                      : false,
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset('assets/icons/zoom_icon.png'),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
