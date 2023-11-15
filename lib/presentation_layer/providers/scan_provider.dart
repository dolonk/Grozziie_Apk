import 'package:flutter/foundation.dart';
import '../ui/created_label/global_variable.dart';

class ScanProvider with ChangeNotifier {
  void updateScanResult(String newScanRes) {
    scanRes = newScanRes;
    notifyListeners();
  }

  void updateShowTextResult(bool value) {
    showTextResult = value;
    showBarcode = false;
    showQRCode = false;
    notifyListeners();
  }

  void updateShowBarcode(bool value) {
    showBarcode = value;
    showQRCode = false;
    showTextResult = false;
    notifyListeners();
  }

  void updateShowQRCode(bool value) {
    showQRCode = value;
    notifyListeners();
  }
}
