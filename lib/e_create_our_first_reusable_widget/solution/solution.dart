import 'package:flutter/material.dart';
import 'package:flutter_lessons/e_create_our_first_reusable_widget/solution/selector.dart';

/// Create a layout like :
/// Create and use a "Selector" widget like :
/// Selector(
/// choices: ["Cinema", "Sport", "Music", "Cooking", "Reading", "Netflix"],
/// onItemToggle: _onItemToggle,
/// ),
/// Talk about :
/// * Passing parameters to Widget
/// * Rows then Wrap
/// * Callbacks and typedef
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
  final Set<String> chosenItems = Set();

  _validate() {
    print("selected items = $chosenItems");
  }

  _onItemToggle(String choice, bool selected) {
    if (selected) {
      chosenItems.remove(choice);
    } else {
      chosenItems.add(choice);
    }
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
                onItemToggle: _onItemToggle,
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
