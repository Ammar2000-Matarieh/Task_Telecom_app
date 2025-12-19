import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:telecom_support_app/config/routes/routes_names.dart';
import 'package:telecom_support_app/features/auth/presentation/screens/login_screen.dart';
import 'package:telecom_support_app/features/home/presentation/screens/active_tickets.dart';

class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static CupertinoPageRoute cupertinoRoute(
    Widget screen, {
    RouteSettings? settings,
  }) {
    return CupertinoPageRoute(settings: settings, builder: (_) => screen);
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.signIn:
        return cupertinoRoute(const LoginScreen());

      case RoutesNames.layout:
        return cupertinoRoute(const ActiveTickets());

      // Undefined Route
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return CupertinoPageRoute(builder: ((context) => const Scaffold()));
  }
}

// ignore: strict_top_level_inference
Future<void> goTo(routesNames, {Object? args}) async {
  AppRoutes.navigatorKey.currentState!.pushNamed(routesNames, arguments: args);
}

Future<void> back() async => AppRoutes.navigatorKey.currentState!.pop();

// ignore: strict_top_level_inference
Future<void> goAndFinish(routesNames, {Object? args}) async {
  AppRoutes.navigatorKey.currentState!.pushNamedAndRemoveUntil(
    routesNames,
    arguments: args,
    (route) => false,
  );
}

// ignore: strict_top_level_inference
Future<void> popAndPush(routesNames, {Object? args}) async {
  AppRoutes.navigatorKey.currentState!.popAndPushNamed(
    routesNames,
    arguments: args,
  );
}
