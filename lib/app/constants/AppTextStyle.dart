import 'package:flutter/material.dart';
import 'Colors.dart';

class AppTextStyle {
  static TextStyle Medium({double fontSize = 26, Color color = AppColors.black}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "Medium",
    );
  }

  static TextStyle regular({double fontSize = 15, Color color = AppColors.white}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "Regular",
      // fontWeight: FontWeight.w300
    );
  }

  static TextStyle button({double fontSize = 20, Color color = AppColors.white}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "Bold",
    );
  }

  static TextStyle Bold({double fontSize = 20, Color color = AppColors.black}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "Bold",
    );
  }

  static TextStyle semiBold({double fontSize = 25, Color color = AppColors.white}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "SemiBold",
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle hint({double fontSize = 15, Color color = AppColors.black}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "ExtraLight",
      fontWeight: FontWeight.w200,
    );
  }
  static TextStyle textFieldstyle({double fontSize = 15, Color color = AppColors.black}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "Medium",
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle label({double fontSize = 16, Color color = Colors.black87}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "SemiBold",
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle extraBold({double fontSize = 24, Color color = Colors.black87}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "ExtraBold",
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle light({double fontSize = 18, Color color = AppColors.white}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "Light",
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle black({double fontSize = 28, Color color = Colors.black87}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "Black",
      fontWeight: FontWeight.w900,
    );
  }
}
