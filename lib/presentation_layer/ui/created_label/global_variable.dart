import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


double screenWidth = ScreenUtil().screenWidth;

// TextEditingController variable
FocusNode inputFocusNode = FocusNode();
Map<int, TextEditingController> textControllers = {};
Map<int, TextEditingController> serialTextControllers = {};
Map<int, TextEditingController> barCodesControllers = {};
Map<int, TextEditingController> qrCodesControllers = {};

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

// serial number
List<String> prefixNumber = [];
List<String> suffixNumber = [];
List<int> incrementNumber = [];
bool showSerialContainerFlag = false;
int selectedSerialCodeIndex = 0;

// Multiple Barcode function variable
List<String> barCodes = [];
List<Offset> barCodeOffsets = [];
List<double> brFontSizeData = [];
List<double> calculatedWidth = [];
List<double> barCodesContainerRotations = [];
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

//Multiple Image  function variable List
List<String> imageCodes = [];
List<Offset> imageOffsets = [];
List<double> updateImageSize = [];
List<double> imageCodesContainerRotations = [];
bool showImageWidget = false;
bool showImageContainerFlag = false;
bool imageBorderWidget = false;
int selectedImageCodeIndex = 0;

//scan function variable
String scanRes = '';
bool showTextResult = false;
bool showBarcode = false;
bool showQRCode = false;

// Multiple Time Date function Variable
List<int> selectTimeTextScanInt = [];
//bool showDateContainerWidget = false;
bool showDateContainerFlag = false;
int selectedTimeCodeIndex = 0;




// Icon Widget Variable
String? selectedIconCategory;
dynamic selectDolon;
bool showIconWidget = false;
bool showIconContainerFlag = false;
bool iconBorderWidget = false;
// Multiple emoji  function variable
List<String> iconCodes = [];
List<Offset> iconCodeOffsets = [];
List<dynamic> selectedIcons = [];
List<double> iconCodesContainerRotations = [];
List<double> updatedIconWidth = [];
int selectedIconCodeIndex = 0;




// Figure Widget Variable
bool showFigureWidget = false;
bool showFigureContainerFlag = false;
bool figureBorderWidget = false;
bool fixedFigureSize = false;
//Multiple Figure function variable List
List<String> figureCodes = [];
List<Offset> figureOffsets = [];
List<bool> isRectangaleUpdate = [];
List<bool> isRoundRectangaleUpdate = [];
List<bool> isCircularFixedUpdate = [];
List<bool> isCircularNotFixedUpdate = [];
List<double> updateFigureLineWidthSize = [];
List<double> updateFigureWidth = [];
List<double> updateFigureHeight = [];
List<double> figureCodesContainerRotations = [];
int selectedFigureCodeIndex = 0;

// Line Widget Variable
bool showLineWidget = false;
bool showLineContainerFlag = false;
bool lineBorderWidget = false;
//Multiple line function variable List
List<String> lineCodes = [];
List<Offset> lineOffsets = [];
List<double> lineCodesContainerRotations = [];
List<double> updateSliderLineWidth = [];
List<bool> isDottedLineUpdate = [];
List<double> updateLineWidth = [];
int selectedLineCodeIndex = 0;



//background image
dynamic selectedImage;
String? selectedBackgroundCategory;
bool showBackgroundImageContainerWidget = false;
bool showBackgroundImageContainerFlag = false;
bool isConnected = true;
bool isLoadingDataCheck = false;
