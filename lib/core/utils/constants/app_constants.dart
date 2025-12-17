import 'package:flutter/material.dart';
import 'package:telecom_support_app/core/extensions/size.dart';

class AppConstants {
  AppConstants._();
  static const String appName = 'Telecom_Support_App';
  static BoxConstraints customConstraints(double h) => BoxConstraints(
    minHeight: h,
    maxHeight: h,
    maxWidth: 100.w,
    minWidth: 100.w,
  );
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
}
