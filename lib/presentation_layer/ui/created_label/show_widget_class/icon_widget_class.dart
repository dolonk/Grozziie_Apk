import 'package:flutter/material.dart';
import 'package:grozziieapk/presentation_layer/providers/icon-provider.dart';
import 'package:provider/provider.dart';
import '../global_variable.dart';

class IconWidgetClass extends StatelessWidget {
  int iconIndex = 0;
  IconWidgetClass({super.key, required this.iconIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<IconProvider>(
      builder: (context, iconModel, child) {
        return Stack(
          children: [
            Container(
                margin: const EdgeInsets.all(5),
                height: updatedIconWidth[iconIndex],
                width: updatedIconWidth[iconIndex],
                decoration: BoxDecoration(
                  border: iconBorderWidget
                      ? Border.all(
                          color: selectedIconCodeIndex == iconIndex
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2)
                      : null,
                ),
                child: Image.network(
                  selectedIcons[iconIndex],
                  fit: BoxFit.cover,
                )),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onPanUpdate: (details) {
                  iconModel.handleResizeGesture(details, iconIndex);
                },
                child: Visibility(
                  visible: selectedIconCodeIndex == iconIndex
                      ? iconBorderWidget
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
