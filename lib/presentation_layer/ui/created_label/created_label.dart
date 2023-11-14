import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/providers/barcode_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/image_take_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/qrcode_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/table_provider.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/teamplate_container.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/my_app_bar.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/my_bottom_bar.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/show_barcode_editing_container.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/show_date_time_editing_container.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/show_image_take_container.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/show_qrcode_editing_container.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/show_table_editing_container.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/show_text_editing_container.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../utils/app_style.dart';
import '../../../utils/utils.dart';
import '../../providers/date_time_editing_provider.dart';
import '../../providers/on_tap_function_provider.dart';
import '../../providers/text_editing_provider.dart';
import 'global_variable.dart';
import '../../providers/date_time_editing_provider.dart' as flutter_timer;

class CreateLabel extends StatefulWidget {
  const CreateLabel({Key? key}) : super(key: key);

  @override
  State<CreateLabel> createState() => _CreateLabelState();
}

class _CreateLabelState extends State<CreateLabel> {
  TextEditingProvider textModel = TextEditingProvider();
  DateTimeProvider dateTimeModel = DateTimeProvider();
  ImageTakeProvider imageModel = ImageTakeProvider();

  @override
  void initState() {
    inputFocusNode = FocusNode();
    dateTimeModel.selectTime = TimeOfDay.now();
    dateTimeModel.selectFormat =
        flutter_timer.TimeOfDayFormat.h_colon_mm_space_a;
    dateTimeModel.selectDate = DateTime.now();
    dateTimeModel.selectedFormatDate = DateFormat.yMMMMd();
    imageModel.imagePicker = ImagePicker();
    super.initState();
  }

  @override
  void dispose() {
    inputFocusNode.dispose();
    for (var controller in textModel.textControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OnTouchFunctionProvider>(
          create: (_) => OnTouchFunctionProvider(),
        ),
        ChangeNotifierProvider<OnTouchFunctionProvider>(
          create: (_) => OnTouchFunctionProvider(),
        ),
        ChangeNotifierProvider<TextEditingProvider>(
          create: (_) => TextEditingProvider(),
        ),
        ChangeNotifierProvider<BarcodeProvider>(
          create: (_) => BarcodeProvider(),
        ),
        ChangeNotifierProvider<QrCodeProvider>(
          create: (_) => QrCodeProvider(),
        ),
        ChangeNotifierProvider<DateTimeProvider>(
          create: (_) => DateTimeProvider(),
        ),
        ChangeNotifierProvider<TableProvider>(
          create: (_) => TableProvider(),
        ),
        ChangeNotifierProvider<ImageTakeProvider>(
          create: (_) => ImageTakeProvider(),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: MyAppBar().buildAppBar(context),
        body: Consumer<OnTouchFunctionProvider>(
          builder: (context, onTouch, _) {
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
                                    return Column(
                                      children: [
                                        const Expanded(
                                            child: TemplateContainer()),
                                        if (showTextEditingContainerFlag)
                                          const Expanded(
                                              child: ShowTextEditingContainer())
                                        else if (showBarcodeContainerFlag)
                                          const Expanded(
                                              child: ShowBarcodeContainer())
                                        else if (showQrcodeContainerFlag)
                                          Expanded(child: ShowQrcodeContainer())
                                        else if (showTableContainerFlag)
                                          const Expanded(
                                              child:
                                                  ShowTableEditingContainer())
                                        else if (showDateContainerFlag)
                                          const Expanded(
                                              child:
                                                  ShowDateTimeEditingContainer())
                                        else if (showImageContainerFlag)
                                          const Expanded(
                                              child: ShowImageTakeContainer())
                                        else
                                          Expanded(
                                            child: buildOptionsContainer(
                                                context,
                                                /*onTouch,*/
                                                textModel,
                                                dateTimeModel,
                                                barcodeModel,
                                                qrCodeModel,
                                                tableModel,
                                                imageModel),
                                          ),
                                      ],
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
        ),
        bottomNavigationBar:
            MyBottomAppBar().buildBottomAppBarButton(screenWidth),
      ),
    );
  }

  Widget buildOptionsContainer(
      BuildContext context,
      TextEditingProvider textModel,
      DateTimeProvider dateTimeModel,
      BarcodeProvider barcodeModel,
      QrCodeProvider qrCodeModel,
      TableProvider tableModel,
      ImageTakeProvider imageModel) {
    return Stack(children: [
      Container(
        padding: REdgeInsets.only(bottom: 30.h),
        margin: REdgeInsets.only(top: 10.h),
        alignment: Alignment.topCenter,
        child: Image.asset('assets/icons/rectangle.png'),
      ),
      Container(
        margin: REdgeInsets.only(top: 10.h),
        width: screenWidth,
        decoration: BoxDecoration(
          color: const Color(0xff5DBCFF).withOpacity(0.13),
          borderRadius: BorderRadius.all(Radius.circular(13.w)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 65.h,
              width: screenWidth,
              child: ReuseAbleClass().buildOptionRow(
                [
                  ReuseAbleClass().buildIconButton(
                      'assets/icons/template.png', 'Template', () {}),
                  Image.asset('assets/images/line_c.png'),
                  ReuseAbleClass().buildIconButton(
                      'assets/icons/empty.png', 'Empty', () {}),
                  ReuseAbleClass().buildIconButton(
                      'assets/icons/multiple.png', 'Multiple', () {}),
                  ReuseAbleClass().buildIconButton(
                      'assets/icons/undo (2).png', 'Undo', () {}),
                  ReuseAbleClass()
                      .buildIconButton('assets/icons/redo.png', 'Redo', () {}),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: 230.h,
                  width: screenWidth,
                  color: Colors.white,
                  padding: REdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      ReuseAbleClass().buildOptionRow(
                        [
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/text.png', 'Text', () {
                            textModel.setShowTextEditingWidget(true);
                            textModel.setShowTextEditingContainerFlag(true);
                            textModel.generateTextCode('Double Click Here', 1);
                          }),
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/barcode.png', 'Barcode', () {
                            barcodeModel.setShowBarcodeWidget(true);
                            barcodeModel.setShowBarcodeContainerFlag(true);
                            barcodeModel.generateBarCode('1234', 1);
                          }),
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/qrcode.png', 'QR Code', () {
                            qrCodeModel.setShowQrcodeWidget(true);
                            qrCodeModel.setShowQrcodeContainerFlag(true);
                            qrCodeModel.generateQRCode('5678', 1);
                          }),
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/table.png', 'Table', () {
                            tableModel.setShowTableEditingWidget(true);
                            tableModel.setShowTableEditingContainerFlag(true);
                            tableModel.generateTableCode();
                          }),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      ReuseAbleClass().buildOptionRow(
                        [
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/images.png', 'Image', () {
                            imageModel.setShowImageContainerFlag(true);
                          }),
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/scan.png', 'Scan', () {
                            scanTextBarcodeQrcode(
                              context,
                              textModel,
                              qrCodeModel,
                              barcodeModel,
                            );
                            //scanTextBarcodeQrcode(context);
                          }),
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/serial_number.png',
                              'Serial Number',
                              () {}),
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/insert_excel.png',
                              'Insert Excel',
                              () {}),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      ReuseAbleClass().buildOptionRow(
                        [
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/time.png', 'Time', () {
                            dateTimeModel.setShowDateContainerWidget(true);
                            dateTimeModel.setDateTimeContainerFlag(true);
                            textModel.generateTextCode(
                                dateTimeModel.getFormattedDateTime(), 3);
                          }),
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/shape.png', 'Shape', () {}),
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/line.png', 'Line', () {}),
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/emoji_icon.png', 'Emoji', () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }

  Future<void> scanTextBarcodeQrcode(
      BuildContext context,
      TextEditingProvider textModel,
      QrCodeProvider qrModel,
      BarcodeProvider brModel) async {
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
    await showScanDialog(textModel, qrModel, brModel);
    setState(() {
      scanRes = scanResult;
      showTextResult = false;
      showBarcode = false;
      showQRCode = false;
    });
  }

  Future<void> showScanDialog(TextEditingProvider textModel,
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
