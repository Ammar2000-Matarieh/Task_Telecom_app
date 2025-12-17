import 'package:flutter/material.dart';
import 'package:telecom_support_app/core/utils/app_colors.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: AppColors.primary),
      textStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.blueAccent),
      textStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    ),
  );
}
