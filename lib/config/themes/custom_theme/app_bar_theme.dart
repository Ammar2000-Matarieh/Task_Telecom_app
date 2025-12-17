import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telecom_support_app/core/utils/app_colors.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    foregroundColor: AppColors.black,
    surfaceTintColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    iconTheme: IconThemeData(size: 24.0, color: Colors.black),
    actionsIconTheme: IconThemeData(size: 24.0, color: Colors.black),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    foregroundColor: AppColors.black,
    surfaceTintColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(size: 24.0, color: Colors.black),
    actionsIconTheme: IconThemeData(size: 24.0, color: Colors.white),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}
