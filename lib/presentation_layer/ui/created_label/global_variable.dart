
import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


FocusNode inputFocusNode = FocusNode();
double screenWidth = ScreenUtil().screenWidth;

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
bool showTextEditingWidget = false;
bool showTextEditingContainerFlag = false;
bool textBorderWidget = false;
int selectedTextCodeIndex = 0;


// Multiple Barcode function variable
List<String> barCodes = [];
List<Offset> barCodeOffsets = [];
List<double> barCodesContainerRotations =[] ;
List<double> updateBarcodeWidth = [];
List<double> updateBarcodeHeight = [];
bool showBarcodeWidget = false;
bool showBarcodeContainerFlag = false;
bool isSupportedType = true;
bool barcodeBorderWidget = false;
int selectedBarCodeIndex = 0;



// Multiple Qrcode function variable
List<String> qrCodes = [];
List<Offset> qrCodeOffsets = [];
List<double> updateQrcodeSize = [];
bool showQrcodeWidget = false;
bool showQrcodeContainerFlag = false;
bool qrcodeBorderWidget = false;
int selectedQRCodeIndex = 0;


// multiple Table Widget variable
List<double> updateTableWidth = [];
List<double> updateTableHeight = [];
List<String> tableCodes = [];
List<Offset> tableOffsets = [];
List<int> updateTableRow = [];
List<int> updateTableColumn = [];
bool showTableWidget = false;
bool showTableContainerFlag = false;
bool tableBorderWidget = false;
int selectedTableCodeIndex = 0;


// multiple scan function variable
List<String> scanCodes = [];
List<Offset> scanCodeOffsets = [];
bool imageBorderWidget = false;
int selectedScanCodeIndex = 0;


// Multiple Time Date function Variable
List<int> selectTimeTextScanInt = [];
bool showDateContainerWidget = false;
bool showDateContainerFlag = false;
int selectedTimeCodeIndex = 0;


// serial number
int selectedSerialCodeIndex = 0;
List<String> prefixNumber = [];
List<int> incrementNumber = [];
List<String> suffixNumber = [];