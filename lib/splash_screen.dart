import 'package:flutter/material.dart';
import 'package:telecom_support_app/config/routes/app_routes.dart';
import 'package:telecom_support_app/config/routes/routes_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goAndFinish(RoutesNames.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
