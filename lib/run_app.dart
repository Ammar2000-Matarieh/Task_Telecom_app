import 'package:flutter/material.dart';
import 'package:telecom_support_app/config/bloc_providers.dart';
import 'package:telecom_support_app/config/routes/app_routes.dart';
import 'package:telecom_support_app/config/themes/app_theme.dart';
import 'package:telecom_support_app/core/utils/constants/app_constants.dart';
import 'package:telecom_support_app/core/widgets/responsive_widget.dart';

class RunApp extends StatelessWidget {
  final String startRoute;
  const RunApp({super.key, required this.startRoute});

  @override
  Widget build(BuildContext context) {
    return AppBlocProviders(
      child: Responsive(
        child: MaterialApp(
          theme: AppTheme.light,
          title: AppConstants.appName,
          navigatorKey: AppRoutes.navigatorKey,
          initialRoute: startRoute,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
