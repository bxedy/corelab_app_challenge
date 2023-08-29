import 'package:flutter/material.dart';

class AppTextStyles {
  final FontWeight weight;
  final Color? color;

  AppTextStyles({this.weight = FontWeight.w500, this.color});

  static const String _fontFamily = 'DMSans';

  TextStyle _createTextStyle(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
      fontFamily: _fontFamily,
      fontStyle: FontStyle.normal,
    );
  }

  TextStyle get tiny => _createTextStyle(10, weight);

  TextStyle get smaller => _createTextStyle(12, weight);

  TextStyle get small => _createTextStyle(14, weight);

  TextStyle get medium => _createTextStyle(16, weight);

  TextStyle get large => _createTextStyle(18, weight);

  TextStyle get larger => _createTextStyle(20, weight);

  TextStyle get huge => _createTextStyle(24, weight);
}
