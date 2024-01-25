// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:certificateapp/globals/extensions/color_extensions.dart';

class AppColors {
//  <!-- for button selector color-->
  static Color color_transparent = HexColor("#000000");
  static Color primaryColor = HexColor("#99ccff");

  static Color yellow = HexColor('#FFB240');
  static Color green = HexColor('#00A482');
  static Color red = HexColor('#DF3030');
  static Color selectButton = HexColor('#170E4A86');
  static Color colorAccent = HexColor("#185DA3");
  static Color colorBlack = HexColor("#000000");

  static Color colorGray = HexColor("#6A6A6A");
  static Color paymentContainer = HexColor("#F6F6F6");

  static Color colorWhite = const Color.fromARGB(255, 255, 255, 255);
  static const Color scaffoldBacground = Color(0xFFE1EBEE);

  static Color lightPurple = const Color(0xFFE1D9FF);
//text
  static Color text = const Color(0xFF10082B);
  static Color textGrey = const Color(0xFF929292);
  static Color ghostGrey = const Color(0xFFD1D1D1);
  static Color secondaryText = const Color(0xFF555555);
  //notification
  static Color success = const Color(0xFF64BC26);
  static Color error = const Color(0xFFEA1601);
  static Color paleYellow = const Color(0xFFFFEBB3);
  static Color warning = const Color(0xFFFAD202);
  static Color sparkOrange = const Color(0xFFFF9C27);
  static Color sparkYellow = const Color(0xFFFFC727);

  // Toast Color

  static Color colorLogoGreenLight = HexColor("#6aba6f");
  static Color colorLogoGreenDark = HexColor("#0d8f15");
  static Color orange = HexColor("#FF7A00");

  static Color colorBtnFillColor = colorWhite;

  static Color colorSemiTrans = const Color(0x0d000000);

  static Color curiousBlue = HexColor("#337AB7");
  static Color colorTextFildBorderColor = Color(0XFFDADADA);
  static Color colorDividerDrawer = HexColor("#1F2326");

  static Color darkRed = const Color(0xffFF3A3A);
  static Color h1 = Color(0xff1B2512);
  static Color textColor = Color(0xff1B2512);
  static Color lightText = Color(0xff6A707C);
  static Color brownText = HexColor('#86878B');
  static Color hintText = Color(0XFF8391A1);
  static Color fieldIcon = HexColor('#B0B0B0');

  static var orangeColor = Colors.orange;

  static var borderColor = Colors.grey;

  static Color getMainBgColor() {
    // return AppColors.colorAccent.withOpacity(0.05);
    return AppColors.colorWhite;
  }
}

class ColorToHex extends Color {
  ///convert material colors to hexcolor
  static int _convertColorTHex(Color color) {
    var hex = '${color.value}';
    return int.parse(
      hex,
    );
  }

  ColorToHex(final Color color) : super(_convertColorTHex(color));
}
