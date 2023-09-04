import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/teamplate_container.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/my_app_bar.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/my_bottom_bar.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/show_date_time_editing_container.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/show_text_editing_container.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../utils/reuseable_class.dart';
import '../../providers/date_time_editing_provider.dart';
import '../../providers/text_editing_provider.dart';
import 'global_variable.dart';
import '../../providers/date_time_editing_provider.dart' as flutter_timer;


double screenWidth = ScreenUtil().screenWidth;
bool showTextEditingWidget = false;
bool showTextEditingContainerFlag = false;

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
    dateTimeProvider.selectTime = TimeOfDay.now();
    dateTimeProvider.selectFormat = flutter_timer.TimeOfDayFormat.h_colon_mm_space_a;
    dateTimeProvider.selectDate = DateTime.now();
    dateTimeProvider.selectedFormatDate = DateFormat.yMMMMd();

    super.initState();
  }

  @override
  void dispose() {
    textEditingProvider.inputFocusNode.dispose();
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
        ChangeNotifierProvider<TextEditingProvider>(
          create: (_) => TextEditingProvider(),
        ),
        ChangeNotifierProvider<DateTimeProvider>(
          create: (_) => DateTimeProvider(),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: MyAppBar().buildAppBar(context),
        body: Consumer<TextEditingProvider>(
          builder: (context, textModel, _) {
            return Consumer<DateTimeProvider>(
              builder: (context, dateTimeModel, _) {
                return Column(
                  children: [
                    const Expanded(child: TemplateContainer()),
                    if (textModel.showTextEditingContainerFlag)
                      const Expanded(child: ShowTextEditingContainer())
                    else if (showDateContainerFlag)
                      const Expanded(child: ShowDateTimeEditingContainer())
                    else
                      Expanded(
                        child: buildOptionsContainer(context, textModel,dateTimeModel),
                      ),
                  ],
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
      BuildContext context, TextEditingProvider textModel, DateTimeProvider dateTimeModel) {
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
                child: buildOptions(context, textModel,  dateTimeModel),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget buildOptions(BuildContext context, TextEditingProvider textModel, DateTimeProvider dateTimeModel) {
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
                textModel.setShowTextEditingContainerFlag(true);
                textModel.setShowTextEditingWidget(true);
                textModel.generateTextCode('Double Click Here', 1);
              }),
              ReuseAbleClass().buildIconButton(
                  'assets/icons/barcode.png', 'Barcode', () {}),
              ReuseAbleClass()
                  .buildIconButton('assets/icons/qrcode.png', 'QR Code', () {}),
              ReuseAbleClass()
                  .buildIconButton('assets/icons/table.png', 'Table', () {}),
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
