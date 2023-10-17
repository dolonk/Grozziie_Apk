import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/providers/barcode_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/qrcode_provider.dart';
import 'package:grozziieapk/presentation_layer/providers/table_provider.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/teamplate_container.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/my_app_bar.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/my_bottom_bar.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/show_barcode_editing_container.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/show_date_time_editing_container.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/show_qrcode_editing_container.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/show_table_editing_container.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/show_text_editing_container.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../utils/reuseable_class.dart';
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
  TextEditingProvider textEditingProvider = TextEditingProvider();
  DateTimeProvider dateTimeProvider = DateTimeProvider();


  @override
  void initState() {
    inputFocusNode = FocusNode();
    dateTimeProvider.selectTime = TimeOfDay.now();
    dateTimeProvider.selectFormat = flutter_timer.TimeOfDayFormat.h_colon_mm_space_a;
    dateTimeProvider.selectDate = DateTime.now();
    dateTimeProvider.selectedFormatDate = DateFormat.yMMMMd();
    super.initState();
  }

  @override
  void dispose() {
    inputFocusNode.dispose();
    for (var controller in textEditingProvider.textControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build function 1');
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

      ],
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: MyAppBar().buildAppBar(context),
        body: Consumer<TextEditingProvider>(
          builder: (context, textModel, _) {
            return Consumer<DateTimeProvider>(
              builder: (context, dateTimeModel, _) {
                return Consumer<BarcodeProvider>(
                  builder: (context, barcodeModel, child) {
                    return Consumer<QrCodeProvider>(
                      builder: (context, qrCodeModel, child) {
                        return Consumer<TableProvider>(
                          builder: (context, tableModel, child) {
                            return Column(
                              children: [
                                const Expanded(child: TemplateContainer()),

                                if (showTextEditingContainerFlag)
                                  const Expanded(
                                      child: ShowTextEditingContainer())

                                else if (showBarcodeContainerFlag)
                                  const Expanded(child: ShowBarcodeContainer())

                                else if (showQrcodeContainerFlag)
                                  Expanded(child: ShowQrcodeContainer())

                                else if (showTableContainerFlag)
                                      const Expanded(
                                          child: ShowTableEditingContainer())

                                else if (showDateContainerFlag)
                                  const Expanded(
                                      child: ShowDateTimeEditingContainer())

                                else
                                  Expanded(
                                    child: buildOptionsContainer(
                                        context,
                                        textModel,
                                        dateTimeModel,
                                        barcodeModel,
                                        qrCodeModel,
                                        tableModel
                                    ),
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
        ),
        bottomNavigationBar:
            MyBottomAppBar().buildBottomAppBarButton(ScreenUtil().screenWidth),
      ),
    );
  }

  Widget buildOptionsContainer(
      BuildContext context, TextEditingProvider textModel, DateTimeProvider dateTimeModel, BarcodeProvider barcodeModel, QrCodeProvider qrCodeModel, TableProvider tableModel) {
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
            ReuseAbleClass().buildOptionRow(
              [
                ReuseAbleClass().buildIconButton(
                    'assets/icons/template.png', 'Template', () {}),
                Image.asset('assets/images/line_c.png'),
                ReuseAbleClass()
                    .buildIconButton('assets/icons/empty.png', 'Empty', () {}),
                ReuseAbleClass().buildIconButton(
                    'assets/icons/multiple.png', 'Multiple', () {}),
                ReuseAbleClass().buildIconButton(
                    'assets/icons/undo (2).png', 'Undo', () {}),
                ReuseAbleClass()
                    .buildIconButton('assets/icons/redo.png', 'Redo', () {}),
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: SingleChildScrollView(
                child: buildOptions(context, textModel,  dateTimeModel, barcodeModel,qrCodeModel,tableModel),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget buildOptions(BuildContext context,
      TextEditingProvider textModel,
      DateTimeProvider dateTimeModel,
      BarcodeProvider barcodeModel,
      QrCodeProvider qrCodeModel,
      TableProvider tableModel
      ) {
    return Container(
      height: 230.h,
      width: screenWidth,
      color: Colors.white,
      padding: REdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          ReuseAbleClass().buildOptionRow(
            [
              ReuseAbleClass().buildIconButton('assets/icons/text.png', 'Text',
                  () {
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
              ReuseAbleClass()
                  .buildIconButton('assets/icons/qrcode.png', 'QR Code', () {
                    qrCodeModel.setShowQrcodeWidget(true);
                    qrCodeModel.setShowQrcodeContainerFlag(true);
                    qrCodeModel.generateQRCode('5678', 1);
              }),
              ReuseAbleClass()
                  .buildIconButton('assets/icons/table.png', 'Table', () {
                    tableModel.setShowTableEditingWidget(true);
                    tableModel.setShowTableEditingContainerFlag(true);
                    tableModel.generateTableCode();
              }),
            ],
          ),
          SizedBox(height: 15.h),
          ReuseAbleClass().buildOptionRow(
            [
              ReuseAbleClass()
                  .buildIconButton('assets/icons/images.png', 'Image', () {}),
              ReuseAbleClass()
                  .buildIconButton('assets/icons/scan.png', 'Scan', () {}),
              ReuseAbleClass().buildIconButton(
                  'assets/icons/serial_number.png', 'Serial Number', () {}),
              ReuseAbleClass().buildIconButton(
                  'assets/icons/insert_excel.png', 'Insert Excel', () {}),
            ],
          ),
          SizedBox(height: 15.h),
          ReuseAbleClass().buildOptionRow(
            [
              ReuseAbleClass()
                  .buildIconButton('assets/icons/time.png', 'Time', () {
                dateTimeModel.setShowDateContainerWidget(true);
                dateTimeModel.setDateTimeContainerFlag(true);
                textModel.generateTextCode(dateTimeModel.getFormattedDateTime(), 3);
              }),
              ReuseAbleClass()
                  .buildIconButton('assets/icons/shape.png', 'Shape', () {}),
              ReuseAbleClass()
                  .buildIconButton('assets/icons/line.png', 'Line', () {}),
              ReuseAbleClass().buildIconButton(
                  'assets/icons/emoji_icon.png', 'Emoji', () {}),
            ],
          ),
        ],
      ),
    );
  }
}
