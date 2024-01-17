import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_one/mainPages/MainLogInPage.dart';
import 'package:project_one/mainPages/threeMainPages/HomePage.dart';
import 'package:project_one/mainPages/threeMainPages/PersonPage.dart';
import 'auth/RegisterPage.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return user == null ? RegisterPage() : MainLogInPage();
  }
}
