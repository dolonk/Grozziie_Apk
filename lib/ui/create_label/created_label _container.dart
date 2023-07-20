

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grozziieapk/providers/text_provider.dart';
import 'package:provider/provider.dart';

class CreatedLabelContainer extends StatelessWidget {
  double containerHeight;
  double containerWidth;

  CreatedLabelContainer({super.key,required this.containerHeight,
    required this.containerWidth,});

  @override
  Widget build(BuildContext context) {
    final textProvider = Provider.of<TextProvider>(context);
    return Container(
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenUtil().setWidth(13)),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: textProvider.textFieldX,
            top: textProvider.textFieldY,
            child: GestureDetector(
              onPanUpdate: (details) {
                textProvider.textContainerX += details.delta.dx;
                textProvider.textContainerY += details.delta.dy;
              },
              onTapDown: (details) {
                // Handle onTapDown event
              },
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 30,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blue,
                      width: 2,
                      style: BorderStyle.solid),
                ),
                child: SizedBox(
                  width: textProvider.textFieldWidth > 0 ? textProvider
                      .textFieldWidth : 1.0,
                  child: Stack(
                    children: [
                      GestureDetector(
                        onDoubleTap: () =>
                            textProvider.showTextInputDialog(context),
                        child: Text(
                          textProvider.labelText,
                          style: TextStyle(
                            fontWeight: textProvider.isBold
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontStyle: textProvider.isItalic
                                ? FontStyle.italic
                                : FontStyle.normal,
                            decoration: textProvider.isUnderline!
                                ? TextDecoration.underline
                                : null,
                            fontSize: textProvider.textFontSize,
                          ),
                          textAlign: textProvider.textAlignment,
                          maxLines: null,
                        ),
                      ),
                      Positioned(
                        right: -32,
                        bottom: -35,
                        child: GestureDetector(
                          onPanUpdate: textProvider.handleResizeGesture,
                          child: const SizedBox(
                            width: 64,
                            height: 64,
                            child: Icon(
                              Icons.touch_app,
                              color: Colors.blue,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
