import 'package:flutter/material.dart';

typedef OnItemToggle(String choice, bool selected);

class Selector extends StatelessWidget {
  final List<String> choices;
  final OnItemToggle onItemToggle;

  const Selector({
    Key key,
    @required this.choices,
    @required this.onItemToggle,
  }) : super(key: key);

  _toggle(String choice, bool selected) {
    if (this.onItemToggle != null) {
      this.onItemToggle(choice, selected);
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
                onToggle: (bool selected) => _toggle(choice, selected),
              ))
          .toList(),
    );
  }
}

class ChoiceItem extends StatefulWidget {
  final String label;
  final Function(bool) onToggle;

  ChoiceItem({
    Key key,
    @required this.label,
    @required this.onToggle,
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
        if (this.widget.onToggle != null) {
          this.widget.onToggle(_isSelected);
        }
        setState(() {
          _isSelected = selected;
        });
      },
    );
  }
}
