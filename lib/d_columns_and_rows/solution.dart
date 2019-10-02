import 'package:flutter/material.dart';

/// Create a layout like :
/// Half top of the screen represents 2 vertically squares (Yellow and Blue)
/// Half bottom of the screen represents 2 horizontally squares (Purple and Green)
/// The Blue Container must be twice large as Yellow and have two text on center (column based)
///
/// Talk about :
/// * Columns and Rows with Text or Button
/// * Containers and sizes
/// * Columns and Rows with Containers and space issue
/// * Flex
///
void main() => runApp(Solution());

class Solution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  flex: 2,
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("ok"),
                          Text("ok"),
                        ],
                      ),
                    ),
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
      ),
    );
  }
}
