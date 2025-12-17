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

  // 1️⃣ تحميل env أولاً
  await dotenv.load(fileName: ".env");

  // 2️⃣ Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // 3️⃣ init (service locator / db / etc)
  await init();

  final bool isLoggedIn = FirebaseAuth.instance.currentUser != null;

  runApp(
    RunApp(startRoute: isLoggedIn ? RoutesNames.layout : RoutesNames.signIn),
  );
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await init();
//   await dotenv.load(fileName: ".env");

//   // التحقق من وجود مستخدم مسجل دخول مسبقاً
//   Widget startWidget;
//   if (FirebaseAuth.instance.currentUser != null) {
//     startWidget = const RunApp(startRoute: RoutesNames.layout);
//   } else {
//     startWidget = const RunApp(startRoute: RoutesNames.signIn);
//   }

//   runApp(startWidget);
// }
