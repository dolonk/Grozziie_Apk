import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../utils/app_style.dart';
import '../ui/created_label/global_variable.dart';

enum TimeOfDayFormat {
  h_colon_mm_space_a,
  h_colon_mm_colon_ss_space_a,
  H_colon_mm,
  H_colon_mm_colon_ss,
  None,
}

class DateTimeProvider with ChangeNotifier {

  DateFormat? selectedFormatDate = DateFormat('MMMM d, yyyy');
  DateTime selectDate = DateTime.now();
  TimeOfDayFormat selectFormat = TimeOfDayFormat.h_colon_mm_space_a;
  TimeOfDay selectTime = TimeOfDay.now();

  bool timeFormat = false;
  bool dateFormat = false;
  bool showStyleContainer = false;

  void setShowDateContainerWidget(bool flag) {
    showDateContainerWidget = flag;
    notifyListeners();
  }

  void setDateTimeContainerFlag(bool flag) {
    showDateContainerFlag = flag;
    notifyListeners();
  }

  void setShowStyleContainer(bool flag) {
    showStyleContainer = flag;
    notifyListeners();
  }

  void showDatePickerDialog(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
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
                                  getFormattedDateTime();
                              notifyListeners();
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
                                  getFormattedDateTime();
                              notifyListeners();
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
    return CupertinoDatePicker(
      mode: CupertinoDatePickerMode.date,
      initialDateTime: selectDate,
      minimumYear: 1900,
      maximumYear: 2100,
      onDateTimeChanged: (DateTime newDateTime) {
        selectDate = newDateTime;
        notifyListeners();
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
            default:
              selectedFormatDate = DateFormat('MMMM d, yyyy');
          }
          notifyListeners();
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
        selectTime = TimeOfDay.fromDateTime(newDateTime);
        notifyListeners();
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
              selectFormat = TimeOfDayFormat.h_colon_mm_space_a;
              break;
            case 1:
              selectFormat = TimeOfDayFormat.h_colon_mm_colon_ss_space_a;
              break;
            case 2:
              selectFormat = TimeOfDayFormat.H_colon_mm;
              break;
            case 3:
              selectFormat = TimeOfDayFormat.H_colon_mm_colon_ss;
              break;
            case 4:
              selectFormat = TimeOfDayFormat.None;
              break;
          }
          notifyListeners();
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

  String getFormattedDate() {
    if (selectedFormatDate == null) {
      return '';
    }
    return selectedFormatDate!.format(selectDate);
  }

  String getFormattedTime() {
    if (selectFormat == TimeOfDayFormat.None) {
      return '';
    }

    final dateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      selectTime.hour,
      selectTime.minute,
    );

    switch (selectFormat) {
      case TimeOfDayFormat.h_colon_mm_space_a:
        return DateFormat('h:mm a').format(dateTime);
      case TimeOfDayFormat.h_colon_mm_colon_ss_space_a:
        return DateFormat('h:mm:ss a').format(dateTime);
      case TimeOfDayFormat.H_colon_mm:
        return DateFormat('HH:mm').format(dateTime);
      case TimeOfDayFormat.H_colon_mm_colon_ss:
        return DateFormat('HH:mm:ss').format(dateTime);
      default:
        return 'Invalid TimeOfDayFormat'; // Return a default message for invalid format
    }
  }

  String getFormattedDateTime() {
    String formattedDate = getFormattedDate();
    String formattedTime = getFormattedTime();

    if (formattedTime.isNotEmpty) {
      formattedDate += ' $formattedTime';
    }
    return formattedDate;
  }
}
