import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/text_editing_provider.dart';


class TemplateContainer extends StatelessWidget {
  const TemplateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TextEditingProvider>(
      builder: (context, textModel, _) {
        double containerHeight = 300;
        double containerWidth = 400;
        return InkWell(
          onTap: (){
            textModel.setTextBorderWidgetFlag(false);
          },
          child: Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: containerHeight,
                width: containerWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(13)),
                ),
                child: Stack(
                  children: [
                    if (textModel.showTextEditingWidget)
                      _buildTextEditingContainer(textModel, context)
                      /*Positioned(
                        left: textModel.textContainerX,
                        top: textModel.textContainerY,
                        child: GestureDetector(
                          onPanUpdate: (details) {
                            textModel.setTextContainerPosition(details.delta.dx, details.delta.dy);
                          },
                          onTapDown: (details) {
                            textModel.showTextEditingContainerFlag = true;
                            textModel.textBorderWidget = true;
                          },
                          onDoubleTap: (){
                            textModel.showTextInputDialog(context);
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                width: textModel.textFieldWidth > 0 ? textModel.textFieldWidth : 1.0,
                                constraints: const BoxConstraints(
                                  minHeight: 40,
                                ),
                                decoration: BoxDecoration(
                                  border: textModel.textBorderWidget ? Border.all(color: Colors.blue, width: 2) :null,
                                ),
                                child: Text(
                                  textModel.labelText,
                                  style: TextStyle(
                                    fontWeight: textModel.isBold ? FontWeight.bold : FontWeight.normal,
                                    fontStyle: textModel.isItalic ? FontStyle.italic : FontStyle.normal,
                                    decoration: textModel.isUnderline! ? TextDecoration.underline : null,
                                    fontSize: textModel.textFontSize,
                                  ),
                                  textAlign: textModel.textAlignment,
                                  maxLines: null,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: GestureDetector(
                                  onPanUpdate: textModel.handleResizeGesture,
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: textModel.textBorderWidget? Image.asset('assets/icons/zoom_icon.png'): null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),*/
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  Widget _buildTextEditingContainer(TextEditingProvider textModel, BuildContext context) {
    return Positioned(
      left: textModel.textContainerX,
      top: textModel.textContainerY,
      child: GestureDetector(
        onPanUpdate: (details) {
          textModel.setTextContainerPosition(details.delta.dx, details.delta.dy);
        },
        onTapDown: (details) {
          textModel.showTextEditingContainerFlag = true;
          textModel.textBorderWidget = true;
        },
        onDoubleTap: () {
          textModel.showTextInputDialog(context);
        },
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              width: textModel.textFieldWidth > 0 ? textModel.textFieldWidth : 1.0,
              constraints: const BoxConstraints(
                minHeight: 40,
              ),
              decoration: BoxDecoration(
                border: textModel.textBorderWidget ? Border.all(color: Colors.blue, width: 2) : null,
              ),
              child: Text(
                textModel.labelText,
                style: TextStyle(
                  fontWeight: textModel.isBold ? FontWeight.bold : FontWeight.normal,
                  fontStyle: textModel.isItalic ? FontStyle.italic : FontStyle.normal,
                  decoration: textModel.isUnderline! ? TextDecoration.underline : null,
                  fontSize: textModel.textFontSize,
                ),
                textAlign: textModel.textAlignment,
                maxLines: null,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onPanUpdate: textModel.handleResizeGesture,
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: textModel.textBorderWidget ? Image.asset('assets/icons/zoom_icon.png') : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
