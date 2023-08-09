import 'package:flutter/material.dart';

class ChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text(
          'Cart Section',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}