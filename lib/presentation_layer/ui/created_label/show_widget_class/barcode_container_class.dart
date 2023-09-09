import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:grozziieapk/presentation_layer/providers/barcode_provider.dart';
import 'package:provider/provider.dart';
import '../global_variable.dart';

class BarcodeContainerClass extends StatelessWidget {
  final String barcodeData;
  final String? encodingType;
  int? brIndex;

  BarcodeContainerClass(
      {super.key, required this.barcodeData, this.encodingType, this.brIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<BarcodeProvider>(
      builder: (context, barcodeModel, child) {
        return Stack(
          children: [
            if (isSupportedType)
              Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: barcodeModel.barcodeBorderWidget
                        ? Border.all(
                            color: selectedBarCodeIndex == brIndex
                                ? Colors.blue
                                : Colors.transparent,
                            width: 2.0)
                        : null),
                child: BarcodeWidget(
                  barcode: getBarcode(),
                  data: barcodeData,
                  drawText: showBarData,
                  color: Colors.black,
                  width: updateBarcodeWidth[brIndex ?? 0],
                  height: updateBarcodeHeight[brIndex ?? 0],
                ),
              ),
            if (!isSupportedType)
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    border: barcodeModel.barcodeBorderWidget
                        ? Border.all(
                            color: selectedBarCodeIndex == brIndex
                                ? Colors.blue
                                : Colors.transparent,
                            width: 2.0)
                        : null),
                child: UnsupportedBarcode(
                  barcodeWidth: barcodeModel.barcodeWidth,
                  barcodeHeight: barcodeModel.barcodeHeight,
                  barcodeData: barcodeData,
                ),
              ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onPanUpdate: (details) {
                  barcodeModel.handleResizeGesture(details, brIndex);
                },
                child: Visibility(
                  visible: selectedBarCodeIndex == brIndex
                      ? barcodeModel.barcodeBorderWidget
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

  final codeBarRegex = RegExp(r'^[0-9]+$');

  final code39Regex = RegExp(r'^[0-9A-Za-z \-\.$/+%*]+$');

  Barcode getBarcode() {
    switch (encodingType) {
      case 'Code128':
        isSupportedType = true;
        return Barcode.code128();
      case 'UPC-A':
        if (barcodeData.length == 12) {
          isSupportedType = true;
          return Barcode.upcA();
        } else {
          isSupportedType = false;
          return Barcode.code128();
        }
      case 'EAN-8':
        if (barcodeData.length == 8) {
          isSupportedType = true;
          return Barcode.ean8();
        } else {
          isSupportedType = false;
          return Barcode.code128();
        }
      case 'EAN-13':
        if (barcodeData.length == 13) {
          isSupportedType = true;
          return Barcode.ean13();
        } else {
          isSupportedType = false;
          return Barcode.code128();
        }
      case 'Code93':
        if (code39Regex.hasMatch(barcodeData)) {
          isSupportedType = true;
          return Barcode.code93();
        } else {
          isSupportedType = false;
          return Barcode.code128();
        }
      case 'Code39':
        if (code39Regex.hasMatch(barcodeData)) {
          isSupportedType = true;
          return Barcode.code39();
        } else {
          isSupportedType = false;
          return Barcode.code128();
        }
      case 'CodeBar':
        if (codeBarRegex.hasMatch(barcodeData)) {
          isSupportedType = true;
          return Barcode.codabar();
        } else {
          isSupportedType = false;
          return Barcode.code128();
        }
      default:
        isSupportedType = false;
        return Barcode.code128();
    }
  }
}

class UnsupportedBarcode extends StatelessWidget {
  final double barcodeWidth;
  final double barcodeHeight;
  String barcodeData;

  UnsupportedBarcode({
    super.key,
    required this.barcodeWidth,
    required this.barcodeHeight,
    required this.barcodeData,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BarcodeWidget(
          barcode: Barcode.code128(),
          data: barcodeData,
          drawText: true,
          color: Colors.black,
          width: barcodeWidth,
          height: barcodeHeight,
        ),
        Positioned.fill(
          child: Center(
            child: Container(
              height: 20,
              width: 100,
              color: Colors.white,
              child: const Text(
                "Unsupported Type",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EncodingTypePicker extends StatelessWidget {
  final String selectedType;
  final ValueChanged<String> onTypeChanged;
  final ValueChanged<String> onConfirm;
  final List<String> supportedTypes;

  const EncodingTypePicker({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
    required this.onConfirm,
    required this.supportedTypes,
  });

  void _showPicker(BuildContext context) {
    Picker(
      adapter: PickerDataAdapter<String>(pickerData: supportedTypes),
      hideHeader: true,
      selecteds: [supportedTypes.indexOf(selectedType)],
      title: const Text('Select Encoding Type'),
      onConfirm: (Picker picker, List<int> value) {
        final selectedValue = supportedTypes[value.first];
        onConfirm(selectedValue);
      },
    ).showDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: InkWell(
        onTap: () => _showPicker(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(child: Text(selectedType)),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
