import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/line_provider.dart';
import '../global_variable.dart';

// ignore: must_be_immutable
class LineWidgetContainerClass extends StatelessWidget {
  double borderLineWidth;
  bool isDottedLine;
  int selectIndex;
  LineWidgetContainerClass(
      {super.key,
      required this.selectIndex,
      required this.borderLineWidth,
      required this.isDottedLine});

  @override
  Widget build(BuildContext context) {
    return Consumer<LineProvide>(builder: (context, lineModel, child) {
      return Stack(children: [
        Container(
          width: updateLineWidth[selectIndex],
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: lineBorderWidget
                  ? Border.all(
                  color: selectedLineCodeIndex == selectIndex
                      ? Colors.blue
                      : Colors.transparent,
                  width: 2.0)
                  : null),
          child: isDottedLine
              ? DottedLine(
            lineThickness: borderLineWidth,
            alignment: WrapAlignment.start,
            dashColor: Colors.black,
            lineLength: updateLineWidth[selectIndex],
          )
              : Divider(
            color: Colors.black,
            thickness: borderLineWidth,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 5,
          child: GestureDetector(
            onPanUpdate: (details) {
              lineModel.handleResizeGesture(details, selectIndex);
            },
            //onPanUpdate: _handleResizeGesture,
            child: SizedBox(
              width: 20,
              height: 20,
              child: lineBorderWidget
                  ? selectedLineCodeIndex == selectIndex
                  ? Image.asset('assets/icons/zoom_icon.png')
                  : null
                  : null,
            ),
          ),
        ),
      ]);
    },);
  }
}
