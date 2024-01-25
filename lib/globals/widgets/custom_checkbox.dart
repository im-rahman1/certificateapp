import 'package:flutter/material.dart';
import 'package:certificateapp/utils/app_colors.dart';

class CustomCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: AppColors.colorBlack, // Tick color
      activeColor: AppColors.colorBlack, // Fill color when checked
      materialTapTargetSize:
          MaterialTapTargetSize.shrinkWrap, // Ensures the check mark is visible
      side: BorderSide(color: AppColors.colorBlack, width: 1),
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(5)), // Border color around the tick
      fillColor: MaterialStateProperty.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primaryColor; // Fill color when checked
          }
          return AppColors.colorWhite; // Default fill color
        },
      ),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          widget.onChanged(value);
        });
      },
    );
  }
}
