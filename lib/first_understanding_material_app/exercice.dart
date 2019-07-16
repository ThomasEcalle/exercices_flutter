import 'package:flutter/material.dart';

/// Create a layout like :
/// a Centered Text styled using  theme
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          title: TextStyle(color: Colors.orange),
        ),
      ),
      home: Bob(),
    );
  }
}

class Bob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "ok",
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }
}
