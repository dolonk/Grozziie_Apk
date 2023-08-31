import 'package:flutter/material.dart';
import 'package:grozziieapk/presentation_layer/providers/text_editing_provider.dart';
import 'package:provider/provider.dart';

import '../global_variable.dart';

class TextEditingContainerClass extends StatefulWidget {
  final String labelText;
  bool isBold;
  bool isItalic;
  bool isUnderline;
  TextAlign textAlignment;
  double textFontSize;
  int? textIndex;

  //bool? textIndex;

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
  _TextEditingContainerClassState createState() =>
      _TextEditingContainerClassState();
}

class _TextEditingContainerClassState extends State<TextEditingContainerClass> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TextEditingProvider>(
      builder: (context, textModel, child) {
        return Stack(
          children: [
            Container(
              width: updateTextWidthSize[widget.textIndex!] > 0
                  ?  updateTextWidthSize[widget.textIndex!]
                  : 1.0,
              margin: const EdgeInsets.all(5),
              constraints: const BoxConstraints(
                minHeight: 30,
              ),
              decoration: BoxDecoration(
                border: textModel.textBorderWidget
                    ? Border.all(
                        color:
                            selectedTextCodeIndex == widget.textIndex
                                ? Colors.blue
                                : Colors.transparent,
                        width: 2.0,
                      )
                    : null,
                // borderRadius: BorderRadius.only(bottomRight: Radius.circular(15))
              ),
              child: Text(
                widget.labelText,
                style: TextStyle(
                  fontWeight:
                      widget.isBold ? FontWeight.bold : FontWeight.normal,
                  fontStyle:
                      widget.isItalic ? FontStyle.italic : FontStyle.normal,
                  decoration:
                      widget.isUnderline ? TextDecoration.underline : null,
                  fontSize: widget.textFontSize,
                ),
                textAlign: widget.textAlignment,
                maxLines: null,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onPanUpdate: (details) {
                  textModel.handleResizeGesture(details, widget.textIndex!);
                },
                child: Visibility(
                  visible: selectedTextCodeIndex == widget.textIndex
                      ? textModel.textBorderWidget
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
