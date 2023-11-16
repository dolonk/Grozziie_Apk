import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/presentation_layer/providers/figure_provider.dart';
import 'package:provider/provider.dart';

import '../global_variable.dart';

// ignore: must_be_immutable
class FigureContainerClass extends StatelessWidget {
  double figureLineWidth;
  int selectIndex;
  bool isRectangale;
  bool isRoundRectangale;
  bool isCircularFixed;
  bool isCircularNotFixed;
  FigureContainerClass({
    super.key,
    required this.figureLineWidth,
    required this.selectIndex,
    required this.isRectangale,
    required this.isRoundRectangale,
    required this.isCircularFixed,
    required this.isCircularNotFixed,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FigureProvider>(
      builder: (context, figureModel, child) {
        return Stack(children: [
          if (isRectangale)
            Container(
              margin: REdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: figureBorderWidget
                      ? Border.all(
                          color: selectedFigureCodeIndex == selectIndex
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3.0)
                      : null),
              child: Container(
                width: updateFigureWidth[selectIndex],
                height: fixedFigureSize
                    ? updateFigureWidth[selectIndex]
                    : updateFigureHeight[selectIndex],
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border:
                      Border.all(color: Colors.black, width: figureLineWidth),
                ),
              ),
            ),
          if (isRoundRectangale)
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: figureBorderWidget
                      ? Border.all(
                          color: selectedFigureCodeIndex == selectIndex
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3.0)
                      : null),
              child: Container(
                width: updateFigureWidth[selectIndex],
                height: fixedFigureSize
                    ? updateFigureWidth[selectIndex]
                    : updateFigureHeight[selectIndex],
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.black, width: figureLineWidth),
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
          if (isCircularFixed)
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: figureBorderWidget
                      ? Border.all(
                          color: selectedFigureCodeIndex == selectIndex
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3.0)
                      : null),
              child: Container(
                width: updateFigureWidth[selectIndex],
                height: updateFigureWidth[selectIndex],
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: Colors.black, width: figureLineWidth),
                ),
              ),
            ),
          if (isCircularNotFixed)
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: figureBorderWidget
                      ? Border.all(
                          color: selectedFigureCodeIndex == selectIndex
                              ? Colors.blue
                              : Colors.transparent,
                          width: 3.0)
                      : null),
              child: Container(
                width: updateFigureWidth[selectIndex],
                height: updateFigureHeight[selectIndex],
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.elliptical(
                      updateFigureWidth[selectIndex],
                      updateFigureHeight[selectIndex])),
                  border:
                      Border.all(color: Colors.black, width: figureLineWidth),
                ),
              ),
            ),
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onPanUpdate: figureModel.handleResizeGesture,
              child: SizedBox(
                width: 20,
                height: 20,
                child: figureBorderWidget
                    ? selectedFigureCodeIndex == selectIndex
                        ? Image.asset('assets/icons/zoom_icon.png')
                        : null
                    : null,
              ),
            ),
          ),
        ]);
      },
    );
  }
}
