import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:certificateapp/globals/container_properties.dart';
import 'package:certificateapp/utils/app_colors.dart';
import 'package:certificateapp/utils/text_styles.dart';

Widget customTextFiled(TextEditingController controller, FocusNode focusNode,
    {bool obscure = false,
    List<TextInputFormatter> textInputFormatter = const [],
    TextInputType textInputType = TextInputType.text,
    String hint = '',
    bool isPassword = false,
    dynamic suffix,
    dynamic prefix,
    bool readOnly = false,
    bool enabled = true,
    Color? color = Colors.white,
    dynamic onTap,
    double? height = 55,
    TextAlign align = TextAlign.start,
    double padding = 10,
    int? maxLength,
    String label = "",
    TextDirection? textDirection = TextDirection.ltr,
    dynamic validation}) {
  return GestureDetector(
    child: Container(
      width: double.infinity,
      decoration: ContainerProperties.simpleDecoration(color: color),
      child: TextFormField(
        focusNode: focusNode,
        cursorHeight: 20,
        maxLines: 1,
        keyboardType: textInputType,
        inputFormatters: textInputFormatter,
        validator: validation,
        obscureText: obscure,
        textAlign: align,
        enabled: enabled,
        onTap: onTap ?? () {},
        maxLength: maxLength,
        readOnly: readOnly,
        textDirection: textDirection,
        controller: controller,
        cursorColor: AppColors.primaryColor,
        style: regularText(size: 15, color: !enabled ? Colors.grey : null),
        decoration: InputDecoration(
            counterText: "",
            focusColor: AppColors.primaryColor,
            // label: Text(label,
            //     style: TextStyle(
            //         color: focusNode.hasFocus
            //             ? AppColors.primaryColor
            //             : AppColors.borderColor)),
            labelText: label,
            labelStyle: TextStyle(
              color: focusNode.hasFocus
                  ? AppColors.primaryColor
                  : AppColors.borderColor,
            ),
            fillColor: AppColors.borderColor,
            hintText: hint,
            hintStyle: normalText().copyWith(color: AppColors.hintText),
            suffixIcon: suffix,
            prefixIcon: prefix,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColors.colorTextFildBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: readOnly
                        ? AppColors.colorTextFildBorderColor
                        : AppColors.primaryColor),
                borderRadius: BorderRadius.circular(16)),
            // contentPadding: EdgeInsets.symmetric(horizontal: padding),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.colorTextFildBorderColor),
                borderRadius: BorderRadius.circular(16))),
      ),
    ),
  );
}

Widget customTextFiledMultiLine(
    TextEditingController controller, FocusNode focusNode,
    {bool obscure = false,
    List<TextInputFormatter> textInputFormatter = const [],
    TextInputType textInputType = TextInputType.multiline,
    String hint = '',
    bool isPassword = false,
    dynamic icon,
    dynamic prefix,
    bool readOnly = false,
    Color? color,
    int? lines = 1,
    TextAlign align = TextAlign.start,
    double padding = 10,
    int? maxLength,
    String label = "",
    TextDirection? textDirection = TextDirection.ltr,
    dynamic validation}) {
  return Container(
    width: double.infinity,
    decoration: ContainerProperties.simpleDecoration(color: color),
    child: TextFormField(
      focusNode: focusNode,
      cursorHeight: 20,
      maxLines: lines,
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
      validator: validation,
      textAlign: align,
      maxLength: maxLength,
      readOnly: readOnly,
      textDirection: textDirection,
      controller: controller,
      cursorColor: AppColors.primaryColor,
      style: normalText(size: 15),
      decoration: InputDecoration(
          counterText: '',
          hintText: hint,
          hintStyle: normalText().copyWith(color: AppColors.hintText),
          suffixIcon: icon,
          prefixIcon: prefix,
          labelText: label,
          labelStyle: TextStyle(
            color: focusNode.hasFocus
                ? AppColors.primaryColor
                : AppColors.borderColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.colorTextFildBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(16)),
          // contentPadding: EdgeInsets.symmetric(horizontal: padding),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.colorTextFildBorderColor),
              borderRadius: BorderRadius.circular(16))),
    ),
  );
}
