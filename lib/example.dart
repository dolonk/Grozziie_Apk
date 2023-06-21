import 'package:flutter/material.dart';

class CharacterArrangementScreen extends StatefulWidget {
  @override
  _CharacterArrangementScreenState createState() =>
      _CharacterArrangementScreenState();
}

class _CharacterArrangementScreenState
    extends State<CharacterArrangementScreen> {
  double containerX = 250.0;
  double containerY = 500.0;
  double dragX = 0.0;
  double dragY = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Arrangement App'),
      ),
      body: Column(
        children: [
          Container(
            height: 500.0,
            child: Center(
              child: Text('Dolon Kumar Mondal'),
            ),
          ),
          Expanded(child: _buildGestureDetector()),
        ],
      ),
    );
  }

  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Stack(
          children: [
            Positioned(
              left: containerX,
              top: containerY,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    dragX = details.globalPosition.dx;
    dragY = details.globalPosition.dy;
  }

  void onPanUpdate(DragUpdateDetails details) {
    setState(() {
      containerX += details.globalPosition.dx - dragX;
      containerY += details.globalPosition.dy - dragY;
      dragX = details.globalPosition.dx;
      dragY = details.globalPosition.dy;
    });
  }
}
