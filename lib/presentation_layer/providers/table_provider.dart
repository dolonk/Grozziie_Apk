import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../ui/created_label/global_variable.dart';

class TableProvider extends ChangeNotifier {
  double lineWidthValue = 2;
  double minTableWidth = 80.0;
  double minTableHeight = 50.0;


  void movingWidget(DragUpdateDetails details, int tableIndex){
    tableOffsets[tableIndex] = Offset(
      tableOffsets[tableIndex].dx + details.delta.dx,
      tableOffsets[tableIndex].dy + details.delta.dy,
    );
    notifyListeners();
  }


  void onTouchFunction(TapDownDetails details) {
    tableBorderWidget = true;
    textBorderWidget = false;
    barcodeBorderWidget = false;
    qrcodeBorderWidget = false;
    notifyListeners();
  }



  void setTableBorderWidgetFlag(bool flag) {
    tableBorderWidget = flag;
    notifyListeners();
  }

  void setShowTableEditingWidget(bool flag) {
    showTableWidget = flag;
    notifyListeners();
  }

  void setShowTableEditingContainerFlag(bool flag) {
    showTableContainerFlag = flag;
    notifyListeners();
  }

  void addRow() {
    updateTableRow[selectedTableCodeIndex]++;
    notifyListeners();
  }

  void removeRow() {
    if (selectedTableCodeIndex >= 0 &&
        updateTableRow[selectedTableCodeIndex] > 1) {
      updateTableRow[selectedTableCodeIndex]--;
      notifyListeners();
    }
  }

  void addColumn() {
    updateTableColumn[selectedTableCodeIndex]++;
    notifyListeners();
  }

  void removeColumn() {
    if (selectedTableCodeIndex >= 0 &&
        updateTableColumn[selectedTableCodeIndex] > 1) {
      updateTableColumn[selectedTableCodeIndex]--;
      notifyListeners();
    }
  }

  void generateTableCode() {
    tableCodes.add('Table ${tableCodes.length + 1}');
    tableOffsets.add(Offset(0, (tableCodes.length * 5).toDouble()));
    updateTableRow.add(1);
    updateTableColumn.add(1);
    updateTableWidth.add(120);
    updateTableHeight.add(80);
    selectedTableCodeIndex = tableCodes.length - 1;
    tableBorderWidget = true;
    notifyListeners();
  }

  void deleteTableCode(int tableIndex) {
    if (tableIndex >= 0 && tableIndex < tableCodes.length) {
      tableCodes.removeAt(tableIndex);
      tableOffsets.removeAt(tableIndex);
      updateTableWidth.removeAt(tableIndex);
      updateTableHeight.removeAt(tableIndex);
      updateTableRow.removeAt(tableIndex);
      updateTableColumn.removeAt(tableIndex);
      tableBorderWidget = false;
      notifyListeners();
    }
  }

  void handleResizeGesture(DragUpdateDetails details, int tableIndex) {
    if (selectedTableCodeIndex == tableIndex) {
      final newWidth =
          updateTableWidth[selectedTableCodeIndex] + details.delta.dx;
      final newHeight =
          updateTableHeight[selectedTableCodeIndex] + details.delta.dy;

      updateTableWidth[selectedTableCodeIndex] =
          newWidth >= minTableWidth ? newWidth : minTableWidth;

      updateTableHeight[selectedTableCodeIndex] =
          newHeight >= minTableHeight ? newHeight : minTableHeight;

      notifyListeners();
    }
  }
}
