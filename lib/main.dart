import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_one/mainPages/threeMainPages/HomePage.dart';
import 'package:project_one/routes/app_router.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth/RegisterPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MaterialApp.router(routerConfig: appRouter.config(),);
  }
}
