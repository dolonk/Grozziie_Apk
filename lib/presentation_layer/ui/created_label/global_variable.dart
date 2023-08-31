

//Multiple Text  function variable
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../providers/text_editing_provider.dart';

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

// Time Zone Variable
int selectedTimeCodeIndex = 0;
List<int> selectTimeTextScanInt = [];
bool timeFormat = false;
bool dateFormat = false;
bool timeBorderWidget = false;
late TimeOfDay selectTime;
late TimeOfDayFormatD selectFormat;
late DateTime selectDate;

// serial number
int selectedSerialCodeIndex = 0;
List<String> prefixNumber = [];
List<int> incrementNumber = [];
List<String> suffixNumber = [];