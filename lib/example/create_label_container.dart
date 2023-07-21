
import 'package:flutter/material.dart';
import 'package:grozziieapk/example/variable.dart';
import 'package:provider/provider.dart';

import '../providers/text_editing_provider.dart';

class CreatedLabelContainer extends StatefulWidget {
  final double containerHeight;
  final double containerWidth;
  const CreatedLabelContainer({super.key, required this.containerHeight, required this.containerWidth,});

  @override
  State<CreatedLabelContainer> createState() => _CreatedLabelContainerState();
}

class _CreatedLabelContainerState extends State<CreatedLabelContainer> {
  final TextEditingProvider textEditingProvider = TextEditingProvider();

  @override
  void dispose() {
    textEditingProvider.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TextEditingProvider>(
      create: (_) => textEditingProvider,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Container(
          height: widget.containerHeight,
          width: widget.containerWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(13)),
          ),
          child: Stack(
            children: [
                Positioned(
                  left: textEditingProvider.textFieldX,
                  top: textEditingProvider.textFieldY,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        textEditingProvider.textFieldX += details.delta.dx;
                        textEditingProvider.textFieldY += details.delta.dy;
                      });
                    },
                    onTapDown: (details) {
                        textEditingProvider.textBorderWidget = true;
                        textEditingProvider.textIconBorder = true;
                        textEditingProvider.updateShowTextEditingContainerFlag(true);
                    },
                    child: ValueListenableBuilder<TextEditingValue>(
                      valueListenable:
                      textEditingProvider.textEditingController,
                      builder: (_, value, __) {
                        textEditingProvider.currentText = value.text;
                        return Container(
                          constraints: const BoxConstraints(
                            minHeight: 30,
                          ),
                          decoration: BoxDecoration(
                            border: textEditingProvider.textBorderWidget
                                ? Border.all(color: Colors.blue, width: 2)
                                : null,
                          ),
                          child: SizedBox(
                            width: textEditingProvider.textFieldWidth > 0
                                ? textEditingProvider.textFieldWidth
                                : 1.0,
                            child: Stack(
                              children: [
                                GestureDetector(
                                  onDoubleTap: () => textEditingProvider
                                      .showTextInputDialog(context),
                                  child: Text(
                                    textEditingProvider.labelText,
                                    style: TextStyle(
                                      fontWeight: textEditingProvider.isBold
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontStyle: textEditingProvider.isItalic
                                          ? FontStyle.italic
                                          : FontStyle.normal,
                                      decoration: textEditingProvider
                                          .isUnderline!
                                          ? TextDecoration.underline
                                          : null,
                                      fontSize:
                                      textEditingProvider.textFontSize,
                                    ),
                                    textAlign: textEditingProvider
                                        .textAlignment,
                                    maxLines: null, // Allow unlimited lines
                                  ),
                                ),
                                Positioned(
                                  right: -32,
                                  bottom: -35,
                                  child: GestureDetector(
                                    onPanUpdate:
                                    textEditingProvider.handleResizeGesture,
                                    child: Visibility(
                                      visible:
                                      textEditingProvider.textIconBorder,
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
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
