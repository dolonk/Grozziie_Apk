import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grozziieapk/presentation_layer/providers/image_take_provider.dart';
import 'package:provider/provider.dart';
import '../global_variable.dart';

// ignore: must_be_immutable
class ImagesTakeContainer extends StatelessWidget {
  Widget imageDate;
  int imageIndex;

  ImagesTakeContainer({
    super.key,
    required this.imageIndex,
    required this.imageDate,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageTakeProvider>(
      builder: (context, imageModel, child) {
        return Stack(
          children: [
            Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                width: updateImageSize[imageIndex],
                height: updateImageSize[imageIndex],
                decoration: BoxDecoration(
                  border: imageBorderWidget
                      ? Border.all(
                          color: selectedImageCodeIndex == imageIndex
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2.0)
                      : null,
                ),
                child: imageDate),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onPanUpdate: (details) {
                  imageModel.handleResizeGesture(details, imageIndex);
                },
                child: Visibility(
                  visible: selectedImageCodeIndex == imageIndex
                      ? imageBorderWidget
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
