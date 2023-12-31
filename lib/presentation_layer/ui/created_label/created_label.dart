import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/providers/background_image_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/barcode_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/figure_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/icon-provider.dart';
import 'package:grozziieapk/presentation_layer/providers/image_take_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/qrcode_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/scan_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/table_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/serial_provider.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/show_widget_class/scan_service_widget_class.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/template_container.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../utils/utils.dart';
import '../../providers/date_time_editing_provider.dart';
import '../../providers/line_provider.dart';
import '../../providers/on_tap_function_provider.dart';
import '../../providers/text_editing_provider.dart';
import 'function_template/my_app_bar.dart';
import 'function_template/my_bottom_bar.dart';
import 'function_template/showBackgroundImageContainer.dart';
import 'function_template/show_barcode_editing_container.dart';
import 'function_template/show_date_time_editing_container.dart';
import 'function_template/show_figure_container.dart';
import 'function_template/show_icon_container.dart';
import 'function_template/show_image_take_container.dart';
import 'function_template/show_line_container.dart';
import 'function_template/show_qrcode_editing_container.dart';
import 'function_template/show_serial_number_container.dart';
import 'function_template/show_table_editing_container.dart';
import 'function_template/show_text_editing_container.dart';
import 'global_variable.dart';
import '../../providers/date_time_editing_provider.dart' as flutter_timer;

class CreateLabel extends StatefulWidget {
  const CreateLabel({Key? key}) : super(key: key);

  @override
  State<CreateLabel> createState() => _CreateLabelState();
}

class _CreateLabelState extends State<CreateLabel> {
  DateTimeProvider dateTimeModel = DateTimeProvider();
  ImageTakeProvider imageModel = ImageTakeProvider();
  IconProvider iconProvider = IconProvider();

  @override
  void initState() {
    inputFocusNode = FocusNode();
    dateTimeModel.selectTime = TimeOfDay.now();
    dateTimeModel.selectFormat =
        flutter_timer.TimeOfDayFormat.h_colon_mm_space_a;
    dateTimeModel.selectDate = DateTime.now();
    dateTimeModel.selectedFormatDate = DateFormat.yMMMMd();
    imageModel.imagePicker = ImagePicker();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      iconProvider.fetchIconCategoriesApi();
    });
    super.initState();
  }

  @override
  void dispose() {
    inputFocusNode.dispose();
    for (var controller in textControllers.values) {
      controller.dispose();
    }
    for (var controller in serialTextControllers.values) {
      controller.dispose();
    }
    for (var controller in barCodesControllers.values) {
      controller.dispose();
    }
    for (var controller in qrCodesControllers.values) {
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
        ChangeNotifierProvider<ScanProvider>(
          create: (_) => ScanProvider(),
        ),
        ChangeNotifierProvider<SerialProvider>(
          create: (_) => SerialProvider(),
        ),
        ChangeNotifierProvider<FigureProvider>(
          create: (_) => FigureProvider(),
        ),
        ChangeNotifierProvider<LineProvide>(
          create: (_) => LineProvide(),
        ),
        ChangeNotifierProvider<BackgroundImageProvider>(
          create: (_) => BackgroundImageProvider(),
        ),
        ChangeNotifierProvider<IconProvider>(
          create: (_) => IconProvider(),
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
                                    return Consumer<ScanProvider>(
                                      builder: (context, scanModel, child) {
                                        return Consumer<IconProvider>(
                                          builder: (context, iconModel, child) {
                                            return Consumer<SerialProvider>(
                                              builder: (context, serialModel,
                                                  child) {
                                                return Consumer<FigureProvider>(
                                                  builder: (context,
                                                      figureModel, child) {
                                                    return Consumer<
                                                        LineProvide>(
                                                      builder: (context,
                                                          lineModel, child) {
                                                        return Consumer<
                                                            BackgroundImageProvider>(
                                                          builder: (context,
                                                              bImageModel,
                                                              child) {
                                                            return Column(
                                                              children: [
                                                                Expanded(
                                                                    child:
                                                                        TemplateContainer(
                                                                  context:
                                                                      context,
                                                                  containerWidth:
                                                                      400,
                                                                  containerHeight:
                                                                      300,
                                                                )),
                                                                if (showTextEditingContainerFlag)
                                                                  const Expanded(
                                                                      child:
                                                                          ShowTextEditingContainer())
                                                                else if (showBarcodeContainerFlag)
                                                                  const Expanded(
                                                                      child:
                                                                          ShowBarcodeContainer())
                                                                else if (showQrcodeContainerFlag)
                                                                  const Expanded(
                                                                      child:
                                                                          ShowQrcodeContainer())
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
                                                                      child:
                                                                          ShowImageTakeContainer())
                                                                else if (showSerialContainerFlag)
                                                                  const Expanded(
                                                                      child:
                                                                          ShowSerialNumberContainer())
                                                                else if (showFigureContainerFlag)
                                                                  const Expanded(
                                                                      child:
                                                                          ShowFigureContainer())
                                                                else if (showIconContainerFlag)
                                                                  Expanded(
                                                                      child: ShowIconContainer(
                                                                          iconProvider:
                                                                              iconModel))
                                                                else if (showLineContainerFlag)
                                                                  const Expanded(
                                                                      child:
                                                                          ShowLineContainer())
                                                                else if (showBackgroundImageContainerFlag)
                                                                  Expanded(
                                                                      child: ShowBackgroundImageContainer(
                                                                          backgroundImageModel:
                                                                              bImageModel))
                                                                else
                                                                  Expanded(
                                                                    child: buildOptionsContainer(
                                                                        context,
                                                                        textModel,
                                                                        dateTimeModel,
                                                                        barcodeModel,
                                                                        qrCodeModel,
                                                                        tableModel,
                                                                        imageModel,
                                                                        scanModel,
                                                                        iconModel,
                                                                        serialModel,
                                                                        figureModel,
                                                                        lineModel,
                                                                        bImageModel),
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
      ImageTakeProvider imageModel,
      ScanProvider scanModel,
      IconProvider iconModel,
      SerialProvider serialModel,
      FigureProvider figureModel,
      LineProvide lineModel,
      BackgroundImageProvider bImageModel) {
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
                            ScanService(scanModel, context)
                                .scanTextBarcodeQrcode(context, textModel,
                                    barcodeModel, qrCodeModel);
                          }),
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/time.png', 'Time', () {
                            textModel.setShowTextEditingWidget(true);
                            dateTimeModel.setDateTimeContainerFlag(true);
                            textModel.generateTextCode(
                                dateTimeModel.getFormattedDateTime(), 3);
                          }),
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/emoji_icon.png', 'Emoji', () {
                            iconModel.setIconContainerFlag(true);
                          }),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      ReuseAbleClass().buildOptionRow(
                        [
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/serial_number.png', 'Serial Number',
                              () {
                            textModel.setShowTextEditingWidget(true);
                            textModel.generateTextCode('01', 4);
                            serialModel.setShowSerialContainerFlag(true);
                          }),
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/shape.png', 'Shape', () {
                            figureModel.setShowFigureWidget(true);
                            figureModel.setShowFigureContainerFlag(true);
                            figureModel.generateFigureCode();
                          }),
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/line.png', 'Line', () {
                            lineModel.setShowLineWidget(true);
                            lineModel.setShowLineContainerFlag(true);
                            lineModel.generateLineCode();
                          }),
                          ReuseAbleClass().buildIconButton(
                              'assets/icons/insert_excel.png', 'Insert Excel',
                              () {
                            bImageModel.setBackgroundImageContainerFlag(true);
                          }),
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
}
