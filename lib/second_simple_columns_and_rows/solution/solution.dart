import 'package:flutter/material.dart';

/// Create a layout like :
/// Half top of the screen represents 2 vertically squares (Yellow and Blue)
/// Half bottom of the screen represents 2 horizontally squares (Purple and Green)
class Solution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.yellow,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: <Widget>[
              Expanded(
                child: Container(color: Colors.purple),
              ),
              Expanded(
                child: Container(color: Colors.green),
              ),
            ],
          ),
        )
      ],
    );
  }
}
