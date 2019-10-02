import 'package:flutter/material.dart';

class SelectorController {
  final List<String> selectedChoices = [];
}

class Selector extends StatelessWidget {
  final List<String> choices;
  final SelectorController selectorController;

  const Selector({
    Key key,
    @required this.choices,
    @required this.selectorController,
  }) : super(key: key);

  _toggleChoiceInList(String choice) {
    if (selectorController != null) {
      if (selectorController.selectedChoices.contains(choice)) {
        selectorController.selectedChoices.remove(choice);
      } else {
        selectorController.selectedChoices.add(choice);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 10,
      children: choices
          .map((choice) => ChoiceItem(
                label: choice,
                onTap: () => _toggleChoiceInList(choice),
              ))
          .toList(),
    );
  }
}

class ChoiceItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  ChoiceItem({
    Key key,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);

  @override
  _ChoiceItemState createState() => _ChoiceItemState();
}

class _ChoiceItemState extends State<ChoiceItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.label),
      selected: _isSelected,
      onSelected: (selected) {
        if (this.widget.onTap != null) {
          this.widget.onTap();
        }
        setState(() {
          _isSelected = selected;
        });
      },
    );
  }
}
