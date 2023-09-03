
import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



//Multiple Text  function variable
List<String> textCodes = [];
List<Offset> textCodeOffsets = [];
List<double> textContainerRotations = [];
List<bool> updateTextBold = [];
List<bool> updateTextItalic = [];
List<bool> updateTextUnderline = [];
List<TextAlign> updateTextAlignment = [];
List<double> updateTextFontSize = [];
List<double> updateTextWidthSize = [];
int selectedTextCodeIndex = 0;

// multiple scan function variable
List<String> scanCodes = [];
List<Offset> scanCodeOffsets = [];
bool imageBorderWidget = false;
int selectedScanCodeIndex = 0;

// Multiple Time Date function Variable
int selectedTimeCodeIndex = 0;
List<int> selectTimeTextScanInt = [];
DateFormat? selectedFormatDate;
TimeOfDayFormat selectFormat = TimeOfDayFormat.h_colon_mm_space_a;
TimeOfDay selectTime =  TimeOfDay.now();
DateTime selectDate = DateTime.now();
bool timeFormat = false;
bool dateFormat = false;
bool timeBorderWidget = false;

enum TimeOfDayFormat {
  h_colon_mm_space_a,
  h_colon_mm_colon_ss_space_a,
  H_colon_mm,
  H_colon_mm_colon_ss,
  None,
}


// serial number
int selectedSerialCodeIndex = 0;
List<String> prefixNumber = [];
List<int> incrementNumber = [];
List<String> suffixNumber = [];