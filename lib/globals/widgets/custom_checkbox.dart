import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox(
      {super.key,
      required this.value,
      required this.onChange,
      required this.label});
  final String label;
  final bool value;
  Function(bool? val) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChange),
        GestureDetector(
            onTap: () {
              onChange(!value);
            },
            child: Text(label))
      ],
    );
  }
}
