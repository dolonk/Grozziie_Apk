import 'package:flutter/material.dart';
import 'package:grozziieapk/presentation_layer/providers/barcode_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/date_time_editing_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/qrcode_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/table_provider.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/show_widget_class/barcode_container_class.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/show_widget_class/qrcode_container_class.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/show_widget_class/show_table_editing_class.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/show_widget_class/textediting_container_class.dart';
import 'package:provider/provider.dart';
import '../../providers/text_editing_provider.dart';
import 'global_variable.dart';

class TemplateContainer extends StatefulWidget {
  const TemplateContainer({super.key});

  @override
  State<TemplateContainer> createState() => _TemplateContainerState();
}

class _TemplateContainerState extends State<TemplateContainer> {
  @override
  Widget build(BuildContext context) {
    double containerHeight = 300;
    double containerWidth = 400;
    return Consumer<TextEditingProvider>(
      builder: (context, textModel, _) {
        return Consumer<DateTimeProvider>(
          builder: (context, dateTimeModel, _) {
            return Consumer<BarcodeProvider>(
              builder: (context, barcodeModel, child) {
                return Consumer<QrCodeProvider>(
                  builder: (context, qrCodeModel, child) {
                    return Consumer<TableProvider>(
                      builder: (context, tableModel, child) {
                        return InkWell(
                          onTap: () {
                            textModel.setTextBorderWidgetFlag(false);
                          },
                          child: Container(
                            height: containerHeight,
                            width: containerWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(13)),
                            ),
                            child: Stack(
                              children: [

                                if (showTextEditingWidget ||
                                    showDateContainerWidget)
                                  for (var i = 0; i < textCodes.length; i++)
                                    textDateWidgetModel(
                                        i, textModel, dateTimeModel),

                                if (showBarcodeWidget)
                                  for (var i = 0; i < barCodes.length; i++)
                                    barcodeWidgetModel(i, barcodeModel),

                                if (showQrcodeWidget)
                                  for (var i = 0; i < qrCodes.length; i++)
                                    qrcodeWidgetModel(i, qrCodeModel),

                                if (showTableWidget)
                                  for (var i = 0; i < tableCodes.length; i++)
                                    tableWidgetModel(i, tableModel)

                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Widget textDateWidgetModel(
      int i, TextEditingProvider textModel, DateTimeProvider dateTimeModel) {
    return Positioned(
      left: textCodeOffsets[i].dx,
      top: textCodeOffsets[i].dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          textModel.movingWidget(details, i);
        },
        onTapDown: (details) {
          textModel.onTouchFunction(details);
          selectedTextCodeIndex = i;
          selectedScanCodeIndex = i;
          if (selectTimeTextScanInt[i] == 1) {
            textModel.setShowTextEditingContainerFlag(true);
            dateTimeModel.setDateTimeContainerFlag(false);
          }
          if (selectTimeTextScanInt[i] == 3) {
            dateTimeModel.setDateTimeContainerFlag(true);
            textModel.setShowTextEditingContainerFlag(false);
          }
        },
        onDoubleTap: () {
          if (selectTimeTextScanInt[i] == 1) {
            textModel.showTextInputDialog(selectedTextCodeIndex, context);
          }
        },
        child: Transform.rotate(
          angle: -textContainerRotations[i],
          child: TextEditingContainerClass(
            textIndex: i,
            labelText: textCodes[i],
            isBold: updateTextBold[i],
            isItalic: updateTextItalic[i],
            isUnderline: updateTextUnderline[i],
            textAlignment: updateTextAlignment[i],
            textFontSize: updateTextFontSize[i],
          ),
        ),
      ),
    );
  }

  Widget barcodeWidgetModel(int i, BarcodeProvider barcodeModel) {
    return Positioned(
      left: barCodeOffsets[i].dx,
      top: barCodeOffsets[i].dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          barcodeModel.movingWidget(details, i);
        },
        onTapDown: (details) {
          selectedBarCodeIndex = i;
          barcodeModel.onTouchFunction(details);
        },
        onDoubleTap: () {
          barcodeModel.showBarcodeInputDialog(selectedBarCodeIndex, context);
        },
        child: Transform.rotate(
          angle: -barCodesContainerRotations[i],
          child: BarcodeContainerClass(
            barcodeData: barCodes[i],
            brIndex: i,
            encodingType: barcodeModel.encodingType,
          ),
        ),
      ),
    );
  }

  Widget qrcodeWidgetModel(int i, QrCodeProvider qrCodeModel) {
    return Positioned(
      left: qrCodeOffsets[i].dx,
      top: qrCodeOffsets[i].dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          qrCodeModel.movingWidget(details, i);
        },
        onTapDown: (details) {
          selectedQRCodeIndex = i;
          qrCodeModel.onTouchFunction(details);
        },
        onDoubleTap: () {
          qrCodeModel.showQrcodeInputDialog(selectedQRCodeIndex, context);
        },
        child: QrCodeContainerClass(
          qrcodeData: qrCodes[i],
          qrIndex: i,
        ),
      ),
    );
  }

  Widget tableWidgetModel(int i, TableProvider tableModel) {
    return Positioned(
      left: tableOffsets[i].dx,
      top: tableOffsets[i].dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          tableModel.movingWidget(details, i);
        },
        onTapDown: (details) {
          selectedTableCodeIndex = i;
          tableModel.onTouchFunction(details);
        },
        child: TableEditingContainerClass(
          tableIndex: i,
        ),
      ),
    );
  }
}
