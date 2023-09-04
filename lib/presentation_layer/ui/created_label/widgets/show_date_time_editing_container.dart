import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/time.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/ui/created_label/widgets/show_text_editing_container.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/reuseable_class.dart';
import '../../../providers/date_time_editing_provider.dart';
import '../../../providers/text_editing_provider.dart';
import '../created_label.dart';
import '../global_variable.dart';
import '../global_variable.dart' as flutter_time;



class ShowDateTimeEditingContainer extends StatelessWidget {
  const ShowDateTimeEditingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DateTimeProvider>(
      builder: (context, dateTimeModel, _) {
        return Consumer<TextEditingProvider>(
          builder: (context, textModel, _) {
            return Stack(children: [
              Container(
                padding: REdgeInsets.only(bottom: 30.h),
                margin: REdgeInsets.only(top: 10.h),
                alignment: Alignment.topCenter,
                child: Image.asset('assets/icons/rectangle.png'),
              ),
              Container(
                margin: REdgeInsets.only(top: 15.h),
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
                            'assets/icons/template.png', 'Template', () {
                          /*setState(() {
                        showTextEditingContainerFlag = false;
                        showBarcodeContainerFlag = false;
                        showQrcodeContainerFlag = false;
                        showTableContainerFlag = false;
                        showImageContainerFlag = false;
                        showDateContainerFlag = false;
                        showEmojiContainerFlag = false;
                      });*/
                          dateTimeModel.setDateTimeContainerFlag(false);
                        }),
                        Image.asset('assets/images/line_c.png'),
                        ReuseAbleClass().buildTextIonButton(
                            'assets/icons/delete_icon.png', 'Delete', () {
                          dateTimeModel.setDateTimeContainerFlag(false);
                          textModel.deleteTextCode(selectedTextCodeIndex);
                        }),
                        /*  _buildTextIonButton('assets/icons/empty.png', 'Empty', () {}),
                _buildTextIonButton(
                    'assets/icons/multiple.png', 'Multiple', () {}),
                _buildTextIonButton('assets/icons/undo (2).png', 'Undo', () {}),
                _buildTextIonButton('assets/icons/redo.png', 'Redo', () {}),*/
                        ReuseAbleClass().buildTextIonButton(
                            'assets/icons/rotated_icon.png', 'Rotate', () {
                          textModel.rotationFunction();
                        }),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    if (dateTimeModel.showStyleContainer)
                      Expanded(
                          child: SingleChildScrollView(
                              child: const ShowTextEditingContainer()
                                  .textEditingOptions(context)))
                    else
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            height: 150.h,
                            width: screenWidth,
                            color: Colors.white,
                            padding: REdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Date & Format:',
                                      style: bodySmall,
                                    ),
                                    SizedBox(width: 10.w),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey),
                                        onPressed: () {
                                          showDatePickerDialog(context);
                                        },
                                        child:
                                            const Text('Select Date & Format')),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  children: [
                                    Text(
                                      'Time & Format :',
                                      style: bodySmall,
                                    ),
                                    SizedBox(width: 10.w),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey),
                                        onPressed: () {
                                          showTimeDatePickerDialog(context);
                                        },
                                        child:
                                            const Text('Select Time & Format')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Container(
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      height: 50,
                      width: screenWidth,
                      color: Colors.grey.shade300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                              onPressed: () {
                                dateTimeModel.setDateFormatStyleFlag(false);
                              },
                              child: Text(
                                'Format',
                                style: dateTimeModel.showStyleContainer
                                    ? bodySmall
                                    : bodySmall.copyWith(color: Colors.blue),
                              )),
                          TextButton(
                              onPressed: () {
                                dateTimeModel.setShowStyleContainer(true);
                              },
                              child: Text(
                                'Style',
                                style: dateTimeModel.showStyleContainer
                                    ? bodySmall.copyWith(color: Colors.blue)
                                    : bodySmall,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]);
          },
        );
      },
    );
  }

  void showDatePickerDialog(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
      ),
      context: context,
      builder: (context) {
        return Consumer<DateTimeProvider>(
          builder: (context, dateTimeModel, _) {
            return SizedBox(
              height: 300,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: REdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 2)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close, size: 20),
                        ),
                        TextButton(
                            onPressed: () {
                              dateTimeModel.setDateFormatStyleFlag(false);
                            },
                            child: Text('Date',
                                style: !dateFormat
                                    ? const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)
                                    : bodySmall)),
                        TextButton(
                          onPressed: () {
                            dateTimeModel.setDateFormatStyleFlag(true);
                          },
                          child: Text('Format',
                              style: dateFormat
                                  ? const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)
                                  : bodySmall),
                        ),
                        IconButton(
                            onPressed: () {
                              String formattedDateTime = dateTimeModel.getFormattedDateTime();
                              print("Formatted Date Time: $formattedDateTime");
                              textCodes[selectedTextCodeIndex] =
                                  dateTimeModel.getFormattedDateTime();
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.done, size: 20)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: dateFormat
                        ? dateFormatSelectionWidget()
                        : showDatePickerWidget(),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void showTimeDatePickerDialog(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
      ),
      context: context,
      builder: (context) {
        return Consumer<DateTimeProvider>(
          builder: (context, dateTimeModel, child) {
            return SizedBox(
              height: 300,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: REdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey, width: 2)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close, size: 20),
                        ),
                        TextButton(
                            onPressed: () {
                              dateTimeModel.setTimeFormatStyleFlag(false);
                            },
                            child: Text('Time',
                                style: !timeFormat
                                    ? const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)
                                    : bodySmall)),
                        TextButton(
                          onPressed: () {
                            dateTimeModel.setTimeFormatStyleFlag(true);
                          },
                          child: Text('Format',
                              style: timeFormat
                                  ? const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)
                                  : bodySmall),
                        ),
                        IconButton(
                            onPressed: () {
                              String formattedDateTime = dateTimeModel.getFormattedDateTime();
                              print("Formatted Date Time: $formattedDateTime");  // Debugging line
                              textCodes[selectedTextCodeIndex] = formattedDateTime ;
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.done, size: 20)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: timeFormat
                        ? timeFormatSelectionDialog()
                        : timePickerDialog(),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }



  Widget showDatePickerWidget() {
    return Consumer<DateTimeProvider>(
      builder: (context, dateTimeModel, _) {
        return CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: selectDate, // Use from Provider
          minimumYear: 1900,
          maximumYear: 2100,
          onDateTimeChanged: (DateTime newDateTime) {
            dateTimeModel.updateDate(newDateTime);
          },
        );
      },
    );
  }

  Widget dateFormatSelectionWidget() {
    return SizedBox(
      height: 200.0,
      child: CupertinoPicker(
        itemExtent: 50.0,
        onSelectedItemChanged: (int index) {
          switch (index) {
            case 0:
              selectedFormatDate = DateFormat('MMMM d, yyyy');
              break;
            case 1:
              selectedFormatDate = DateFormat('yyyy-MM-dd');
              break;
            case 2:
              selectedFormatDate = DateFormat('dd/MM/yyyy');
              break;
            case 3:
              selectedFormatDate = null;
              break;
          }
        },
        children: const [
          Text('yyyy-MM-dd'),
          Text('dd/MM/yyyy'),
          Text('MMMM d, yyyy'),
          Text('No'),
        ],
      ),
    );
  }

  Widget timePickerDialog() {
    return Consumer<DateTimeProvider>(
      builder: (context, dateTimeModel, child) {
        return CupertinoDatePicker(
          mode: CupertinoDatePickerMode.time,
          initialDateTime: selectDate ?? DateTime.now(),
          onDateTimeChanged: (DateTime newDateTime) {
            TimeOfDay newTime = TimeOfDay.fromDateTime(newDateTime);
            dateTimeModel.updateTime(newTime);
          },
        );
      },
    );
  }

  Widget timeFormatSelectionDialog() {
    return SizedBox(
      height: 200.0,
      child: CupertinoPicker(
        itemExtent: 50,
        onSelectedItemChanged: (int index) {
          // Update the selected format but do not call setState here.
          switch (index) {
            case 0:
              selectFormat = flutter_time.TimeOfDayFormat .h_colon_mm_space_a ;
              break;
            case 1:
              selectFormat = flutter_time.TimeOfDayFormat.h_colon_mm_colon_ss_space_a;
              break;
            case 2:
              selectFormat = flutter_time.TimeOfDayFormat.H_colon_mm;
              break;
            case 3:
              selectFormat = flutter_time.TimeOfDayFormat.H_colon_mm_colon_ss;
              break;
            case 4:
              selectFormat = flutter_time.TimeOfDayFormat.None;
              break;
          }
        },
        children: const [
          Text('h:mm a'),
          Text('h:mm:ss a'),
          Text('HH:mm'),
          Text('HH:mm:ss'),
          Text('No'),
        ],
      ),
    );
  }
}


/* Widget showDatePickerWidget() {
    return Consumer<DateTimeProvider>(
      builder: (context, dateTimeModel, _) {
        return CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: selectDate,
          minimumYear: 1900,
          maximumYear: 2100,
          onDateTimeChanged: (DateTime newDateTime) {
            selectDate = newDateTime;
            dateTimeModel.updateDate(selectDate);
          },
        );
      },
    );
  }*/

/*Widget timePickerDialog(int selectIndex) {
    return Consumer<DateTimeProvider>(
      builder: (context, dateTimeModel, child) {
        return CupertinoDatePicker(
          mode: CupertinoDatePickerMode.time,
          initialDateTime: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            selectTime.hour,
            selectTime.minute,
          ),
          onDateTimeChanged: (DateTime newDateTime) {
            // Update the selected time but do not call setState here.
            selectTime = TimeOfDay.fromDateTime(newDateTime);
            dateTimeModel.updateTime(selectTime);
          },
        );
      },
    );
  }*/

/*  void showDatePickerDialog(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
      ),
      context: context,
      builder: (context) {
        return Consumer<DateTimeProvider>(
          builder: (context, dateTimeModel, child) {
            return  StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        padding: REdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 2)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close, size: 20),
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    dateFormat = false;
                                  });
                                },
                                child: Text('Date',
                                    style: !dateFormat
                                        ? const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)
                                        : bodySmall)),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  dateFormat = !dateFormat;
                                });
                              },
                              child: Text('Format',
                                  style: dateFormat
                                      ? const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)
                                      : bodySmall),
                            ),
                            IconButton(
                                onPressed: () {
                                  textCodes[selectedTextCodeIndex] =
                                      dateTimeModel.getFormattedDateTime();
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.done, size: 20)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: dateFormat
                            ? dateFormatSelectionWidget()
                            : showDatePickerWidget(),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void showTimeDatePickerDialog(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
      ),
      context: context,
      builder: (context) {
        return Consumer<DateTimeProvider>(
          builder: (context, dateTimeModel, child) {
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        padding: REdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey, width: 2)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close, size: 20),
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    timeFormat = false;
                                  });
                                },
                                child: Text('Time',
                                    style: !timeFormat
                                        ? const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)
                                        : bodySmall)),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  timeFormat = !timeFormat;
                                });
                              },
                              child: Text('Format',
                                  style: timeFormat
                                      ? const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)
                                      : bodySmall),
                            ),
                            IconButton(
                                onPressed: () {
                                  textCodes[selectedTextCodeIndex] =
                                      dateTimeModel.getFormattedDateTime();
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.done, size: 20)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: timeFormat
                            ? timeFormatSelectionDialog()
                            : timePickerDialog(),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }*/
