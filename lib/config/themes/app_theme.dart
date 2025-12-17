import 'package:flutter/material.dart';
import 'package:telecom_support_app/config/themes/custom_theme/app_bar_theme.dart';
import 'package:telecom_support_app/config/themes/custom_theme/bottom_sheet_theme.dart';
import 'package:telecom_support_app/config/themes/custom_theme/elevated_button_theme.dart';
import 'package:telecom_support_app/config/themes/custom_theme/outlined_button_theme.dart';
import 'package:telecom_support_app/config/themes/custom_theme/text_field_theme.dart';
import 'package:telecom_support_app/config/themes/custom_theme/text_theme.dart';
import 'package:telecom_support_app/core/utils/app_colors.dart';

class AppTheme {
  static ThemeData get dark => _dark;
  static ThemeData get light => _light;

  static final ThemeData _light = ThemeData(
    useMaterial3: true,
    textTheme: TTextTheme.light,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    colorScheme: const ColorScheme.light(primary: AppColors.primary),
  );

  static final ThemeData _dark = ThemeData(
    useMaterial3: true,
    textTheme: TTextTheme.dark,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    colorScheme: const ColorScheme.dark(primary: AppColors.primary),
  );
}
