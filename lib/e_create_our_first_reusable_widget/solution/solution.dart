import 'package:flutter/material.dart';
import 'package:flutter_lessons/e_create_our_first_reusable_widget/solution/selector.dart';

/// Create a layout like :
/// Create and use a "Selector" widget like :
/// Selector(
//   choices: ["Cinema", "Sport", "Music", "Cooking", "Reading", "Netflix"],
//   selectorController: controller,
// ),
/// Talk about :
/// * Passing parameters to Widget
/// * Rows then Wrap
/// * Callbacks
/// * ChoiceChip
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
  SelectorController controller = SelectorController();

  _validate() {
    print("selected items = ${controller.selectedChoices}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Selector(
                choices: ["Cinema", "Sport", "Music", "Cooking", "Reading", "Netflix"],
                selectorController: controller,
              ),
              RaisedButton(
                child: Text("OK"),
                onPressed: _validate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
