import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:telecom_support_app/config/injection_container.dart';
import 'package:telecom_support_app/config/routes/routes_names.dart';
import 'package:telecom_support_app/firebase_options.dart';
import 'package:telecom_support_app/run_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await init();
  final bool isLoggedIn = FirebaseAuth.instance.currentUser != null;
  runApp(
    RunApp(startRoute: isLoggedIn ? RoutesNames.layout : RoutesNames.signIn),
  );
}
