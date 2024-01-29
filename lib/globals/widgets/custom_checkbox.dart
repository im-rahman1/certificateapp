import 'package:certificateapp/utils/app_colors.dart';
import 'package:certificateapp/utils/text_styles.dart';
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
        Checkbox(
            value: value,
            onChanged: onChange,
            activeColor: AppColors.primaryColor),
        Expanded(
          child: GestureDetector(
              onTap: () {
                onChange(!value);
              },
              child: Text(
                label,
                // softWrap: true,
              )),
        )
      ],
    );
  }
}
