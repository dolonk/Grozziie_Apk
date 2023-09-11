
import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


FocusNode inputFocusNode = FocusNode();

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


// Multiple Barcode function variable
List<String> barCodes = [];
List<Offset> barCodeOffsets = [];
List<double> barCodesContainerRotations =[] ;
List<double> updateBarcodeWidth = [];
List<double> updateBarcodeHeight = [];
int selectedBarCodeIndex = 0;
bool isSupportedType = true;




// Multiple Time Date function Variable
int selectedTimeCodeIndex = 0;
List<int> selectTimeTextScanInt = [];
bool showDateContainerWidget = false;
bool showDateContainerFlag = false;


// serial number
int selectedSerialCodeIndex = 0;
List<String> prefixNumber = [];
List<int> incrementNumber = [];
List<String> suffixNumber = [];