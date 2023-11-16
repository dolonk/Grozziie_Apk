import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grozziieapk/presentation_layer/providers/barcode_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/date_time_editing_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/figure_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/image_take_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/on_tap_function_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/qrcode_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/table_provider.dart';
import 'package:grozziieapk/presentation_layer/serial_provider.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/show_widget_class/barcode_container_class.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/show_widget_class/figure_container_class.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/show_widget_class/image_take_container_class.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/show_widget_class/line_container_class.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/show_widget_class/qrcode_container_class.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/show_widget_class/show_table_editing_class.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/show_widget_class/textediting_container_class.dart';
import 'package:provider/provider.dart';
import '../../providers/line_provider.dart';
import '../../providers/text_editing_provider.dart';
import 'global_variable.dart';

class TemplateContainer extends StatelessWidget {
  final BuildContext context;

  const TemplateContainer({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    double containerHeight = 300;
    double containerWidth = 400;
    return Consumer<OnTouchFunctionProvider>(
      builder: (context, onTouchModel, child) {
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
                            return Consumer<ImageTakeProvider>(
                              builder: (context, imageModel, child) {
                                return Consumer<SerialProvider>(
                                  builder: (context, serialModel, child) {
                                    return Consumer<FigureProvider>(
                                      builder: (context, figureModel, child) {
                                        return Consumer<LineProvide>(
                                          builder: (context, lineModel, child) {
                                            return Container(
                                              height: containerHeight,
                                              width: containerWidth,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(13)),
                                              ),
                                              child: Stack(
                                                children: [
                                                  if (showFigureWidget)
                                                    for (var i = 0;
                                                        i < figureCodes.length;
                                                        i++)
                                                      figureWidgetModel(
                                                          i,
                                                          figureModel,
                                                          onTouchModel),
                                                  if (showLineWidget)
                                                    for (var i = 0;
                                                        i < lineCodes.length;
                                                        i++)
                                                      lineWidgetModel(
                                                          i,
                                                          lineModel,
                                                          onTouchModel),
                                                  if (showTextEditingWidget)
                                                    for (var i = 0;
                                                        i < textCodes.length;
                                                        i++)
                                                      textDateWidgetModel(
                                                        i,
                                                        textModel,
                                                        dateTimeModel,
                                                        serialModel,
                                                        onTouchModel,
                                                      ),
                                                  if (showBarcodeWidget)
                                                    for (var i = 0;
                                                        i < barCodes.length;
                                                        i++)
                                                      barcodeWidgetModel(
                                                          i,
                                                          barcodeModel,
                                                          onTouchModel),
                                                  if (showQrcodeWidget)
                                                    for (var i = 0;
                                                        i < qrCodes.length;
                                                        i++)
                                                      qrcodeWidgetModel(
                                                          i,
                                                          qrCodeModel,
                                                          onTouchModel),
                                                  if (showTableWidget)
                                                    for (var i = 0;
                                                        i < tableCodes.length;
                                                        i++)
                                                      tableWidgetModel(
                                                          i,
                                                          tableModel,
                                                          onTouchModel),
                                                  if (showImageWidget)
                                                    for (var i = 0;
                                                        i < imageCodes.length;
                                                        i++)
                                                      if (imageCodes[i] !=
                                                          'demoImage')
                                                        imageWidgetModel(
                                                            i,
                                                            imageModel,
                                                            onTouchModel)
                                                ],
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
      int i,
      TextEditingProvider textModel,
      DateTimeProvider dateTimeModel,
      SerialProvider serialModel,
      OnTouchFunctionProvider onTouchModel) {
    return Positioned(
      left: textCodeOffsets[i].dx,
      top: textCodeOffsets[i].dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          textModel.movingWidget(details, i);
        },
        onTapDown: (details) async {
          selectedTextCodeIndex = i;

          if (selectTimeTextScanInt[i] == 1) {
            await onTouchModel.showBorderContainerFlag('textEditing', true);
          }
          if (selectTimeTextScanInt[i] == 3) {
            await onTouchModel.showBorderContainerFlag('date', true);
          }
          if (selectTimeTextScanInt[i] == 4) {
            selectedSerialCodeIndex = i;
            await onTouchModel.showBorderContainerFlag('serial', true);
          }
        },
        onDoubleTap: () {
          if (selectTimeTextScanInt[i] == 1) {
            textModel.showTextInputDialog(selectedTextCodeIndex, context);
          } else if (selectTimeTextScanInt[i] == 2) {
            textModel.showTextInputDialog(selectedTextCodeIndex, context);
          }
        },
        child: Transform.rotate(
          angle: -textContainerRotations[i],
          child: TextEditingContainerClass(
            textIndex: i,
            labelText: prefixNumber[i] + textCodes[i] + suffixNumber[i],
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

  Widget barcodeWidgetModel(int i, BarcodeProvider barcodeModel,
      OnTouchFunctionProvider onTouchModel) {
    return Positioned(
      left: barCodeOffsets[i].dx,
      top: barCodeOffsets[i].dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          barcodeModel.movingWidget(details, i);
        },
        onTapDown: (details) async {
          await onTouchModel.showBorderContainerFlag('barcode', true);
          selectedBarCodeIndex = i;
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

  Widget qrcodeWidgetModel(
      int i, QrCodeProvider qrCodeModel, OnTouchFunctionProvider onTouchModel) {
    return Positioned(
      left: qrCodeOffsets[i].dx,
      top: qrCodeOffsets[i].dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          qrCodeModel.movingWidget(details, i);
        },
        onTapDown: (details) async {
          await onTouchModel.showBorderContainerFlag('qrcode', true);
          selectedQRCodeIndex = i;
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

  Widget tableWidgetModel(
      int i, TableProvider tableModel, OnTouchFunctionProvider onTouchModel) {
    return Positioned(
      left: tableOffsets[i].dx,
      top: tableOffsets[i].dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          tableModel.movingWidget(details, i);
        },
        onTapDown: (details) async {
          await onTouchModel.showBorderContainerFlag('table', true);
          selectedTableCodeIndex = i;
        },
        child: TableEditingContainerClass(
          tableIndex: i,
        ),
      ),
    );
  }

  Widget imageWidgetModel(int i, ImageTakeProvider imageModel,
      OnTouchFunctionProvider onTouchModel) {
    return Positioned(
      left: imageOffsets[i].dx,
      top: imageOffsets[i].dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          imageModel.movingWidget(details, i);
        },
        onTapDown: (details) async {
          selectedImageCodeIndex = i;
          await onTouchModel.showBorderContainerFlag('image', true);
        },
        child: Transform.rotate(
          angle: -imageCodesContainerRotations[i],
          child: ImagesTakeContainer(
            imageIndex: i,
            imageDate: Image.file(
              File(imageCodes[i]),
            ),
          ),
        ),
      ),
    );
  }

  Widget figureWidgetModel(
      int i, FigureProvider figureModel, OnTouchFunctionProvider onTouchModel) {
    return Positioned(
      left: figureOffsets[i].dx,
      top: figureOffsets[i].dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          figureModel.movingWidget(details, i);
        },
        onTapDown: (details) async {
          selectedFigureCodeIndex = i;
          await onTouchModel.showBorderContainerFlag('figure', true);
        },
        child: Transform.rotate(
          angle: -figureCodesContainerRotations[i],
          child: FigureContainerClass(
            figureLineWidth: updateFigureLineWidthSize[i],
            selectIndex: i,
            isRectangale: isRectangaleUpdate[i],
            isRoundRectangale: isRoundRectangaleUpdate[i],
            isCircularFixed: isCircularFixedUpdate[i],
            isCircularNotFixed: isCircularNotFixedUpdate[i],
          ),
        ),
      ),
    );
  }

  Widget lineWidgetModel(
      int i, LineProvide lineModel, OnTouchFunctionProvider onTouchModel) {
    return Positioned(
      left: lineOffsets[i].dx,
      top: lineOffsets[i].dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          lineModel.movingWidget(details, i);
        },
        onTapDown: (details) async {
          selectedFigureCodeIndex = i;
          await onTouchModel.showBorderContainerFlag('line', true);
        },
        child: Transform.rotate(
          angle: -lineCodesContainerRotations[i],
          child: LineWidgetContainerClass(
            selectIndex: i,
            borderLineWidth: updateSliderLineWidth[i],
            isDottedLine: isDottedLineUpdate[i],
          ),
        ),
      ),
    );
  }
}
