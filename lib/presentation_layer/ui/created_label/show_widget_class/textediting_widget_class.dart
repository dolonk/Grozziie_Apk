import 'package:flutter/material.dart';
import 'package:grozziieapk/presentation_layer/providers/text_editing_provider.dart';
import 'package:provider/provider.dart';

import '../global_variable.dart';


// ignore: must_be_immutable
class TextEditingContainerClass extends StatelessWidget {
  final String labelText;
  bool isBold;
  bool isItalic;
  bool isUnderline;
  TextAlign textAlignment;
  double textFontSize;
  int? textIndex;

  TextEditingContainerClass({
    Key? key,
    required this.labelText,
    this.textIndex,
    required this.isBold,
    required this.isItalic,
    required this.isUnderline,
    required this.textAlignment,
    required this.textFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TextEditingProvider>(
      builder: (context, textModel, child) {
        return Stack(
          children: [
            Container(
              width: updateTextWidthSize[textIndex!] > 0
                  ? updateTextWidthSize[textIndex!]
                  : 1.0,
              margin: const EdgeInsets.all(5),
              constraints: const BoxConstraints(
                minHeight: 30,
              ),
              decoration: BoxDecoration(
                border: textBorderWidget
                    ? Border.all(
                        color: selectedTextCodeIndex == textIndex
                            ? Colors.blue
                            : Colors.transparent,
                        width: 2.0,
                      )
                    : null,
                // borderRadius: BorderRadius.only(bottomRight: Radius.circular(15))
              ),
              child: Text(
                labelText,
                style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                  decoration: isUnderline ? TextDecoration.underline : null,
                  fontSize: textFontSize,
                ),
                textAlign: textAlignment,
                maxLines: null,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onPanUpdate: (details) {
                  textModel.handleResizeGesture(details, textIndex!);
                },
                child: Visibility(
                  visible: selectedTextCodeIndex == textIndex
                      ? textBorderWidget
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
