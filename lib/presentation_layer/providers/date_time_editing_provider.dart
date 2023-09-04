import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../ui/created_label/global_variable.dart';

import '../ui/created_label/global_variable.dart' as flutter_time;


bool showDateContainerWidget = false;
bool showDateContainerFlag = false;

class DateTimeProvider with ChangeNotifier {

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
    showStyleContainer = !showStyleContainer;
    notifyListeners();
  }

  void setDateFormatStyleFlag(bool flag) {
    dateFormat = flag;
    notifyListeners();
  }

  void setTimeFormatStyleFlag(bool flag) {
    timeFormat = flag;
    notifyListeners();
  }


  void updateDate(DateTime newDate) {
    selectDate = newDate;
    print("Date updated: $selectDate");
    notifyListeners();
  }

  void updateTime(TimeOfDay newTime) {
    selectTime = newTime;
    print("Date updated: $selectTime");
    notifyListeners();
  }


  String getFormattedDate() {
    if (selectedFormatDate == null) {
      return '';
    }
    return selectedFormatDate!.format(selectDate);

  }

  String getFormattedTime() {
    if (selectFormat == flutter_time.TimeOfDayFormat.None) {
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
      case flutter_time.TimeOfDayFormat.h_colon_mm_space_a:
        return DateFormat('h:mm a').format(dateTime);
      case flutter_time.TimeOfDayFormat.h_colon_mm_colon_ss_space_a:
        return DateFormat('h:mm:ss a').format(dateTime);
      case flutter_time.TimeOfDayFormat.H_colon_mm:
        return DateFormat('HH:mm').format(dateTime);
      case flutter_time.TimeOfDayFormat.H_colon_mm_colon_ss:
        return DateFormat('HH:mm:ss').format(dateTime);
      default:
        return 'Invalid TimeOfDayFormat';
    }
  }

  String getFormattedDateTime() {
    final formattedDate = getFormattedDate();
    final formattedTime = getFormattedTime();

    if (formattedTime.isNotEmpty) {
      final formattedDateTime = '$formattedDate $formattedTime';
      return formattedDateTime;
    }
    return formattedDate;
  }

  void result(){
    textCodes[selectedTextCodeIndex] = getFormattedDateTime();
    notifyListeners();
  }

}

