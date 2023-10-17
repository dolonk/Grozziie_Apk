import 'package:flutter/material.dart';
import 'package:grozziieapk/presentation_layer/providers/table_provider.dart';
import 'package:provider/provider.dart';

import '../global_variable.dart';

class TableEditingContainerClass extends StatelessWidget {
  int tableIndex;

  TableEditingContainerClass({super.key, required this.tableIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<TableProvider>(
      builder: (context, tableModel, child) {
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: updateTableWidth[tableIndex],
              height: updateTableHeight[tableIndex],
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: tableBorderWidget
                      ? Border.all(
                          width: 2,
                          color: selectedTableCodeIndex == tableIndex
                              ? Colors.blue
                              : Colors.transparent,
                        )
                      : null),
              child: Table(
                border: TableBorder.all(width: 2, color: Colors.black),
                children: [
                  for (var rowIndex = 0;
                      rowIndex < updateTableRow[tableIndex];
                      rowIndex++)
                    TableRow(
                      children: [
                        for (var colIndex = 0;
                            colIndex < updateTableColumn[tableIndex];
                            colIndex++)
                          TableCell(
                            child: SizedBox(
                              height: updateTableHeight[tableIndex] /
                                  updateTableRow[tableIndex],
                              width: updateTableWidth[tableIndex] /
                                  updateTableColumn[tableIndex],
                              child: InkWell(
                                onTap: () {
                                  // if (selectedTableCodeIndex == i) {
                                  //   //_showInputDialog(context, rowIndex, colIndex);
                                  // }
                                },
                                child: const Text(
                                  '',
                                  //controllers[rowIndex][colIndex].text, // Display data from the controller
                                  style: TextStyle(
                                      color: Colors.black), // Set text color
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onPanUpdate: (details) {
                  tableModel.handleResizeGesture(details, tableIndex);
                },
                child: Visibility(
                  visible: selectedTableCodeIndex == tableIndex
                      ? tableBorderWidget
                      : false,
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset('assets/icons/zoom_icon.png'),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
