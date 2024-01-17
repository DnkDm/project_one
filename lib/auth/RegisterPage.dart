import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_one/routes/app_router.dart';

import '../Widgets/lodingWidget.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  int formF = 0;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00B4CC),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/log_image.jpeg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70.0),
                  // Закругление верхнего левого угла
                  bottomLeft:
                      Radius.circular(70.0), // Закругление нижнего левого угла
                ),
              ),
              child: Column(
                children: [
                  Container(
                    //color: Colors.red.withOpacity(0.3),
                    height: (MediaQuery.of(context).size.height * 0.85) * 0.45,
                    child: Center(
                        child: Text(
                      "LOGO",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                  Container(
                    //color: Colors.blue.withOpacity(0.3),
                    height: (MediaQuery.of(context).size.height * 0.85) * 0.2,
                    child: Center(
                        child: Text(
                      "Welome",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                  Container(
                    //color: Colors.green.withOpacity(0.3),
                    padding: EdgeInsets.only(left: 35, right: 35),
                    height: (MediaQuery.of(context).size.height * 0.85) * 0.25,
                    width: double.infinity,
                    child: contein(formF),
                  ),
                  Container(
                    //color: Colors.red.withOpacity(0.3),
                    padding: EdgeInsets.only(left: 35, right: 35),
                    height: (MediaQuery.of(context).size.height * 0.85) * 0.1,
                    width: double.infinity,
                    child: logAndPassword(formF),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * (1 - 0.85),
              child: downButton(formF),
            )
          ],
        ),
      ),
    );
  }

  Widget contein(int i) {
    Container ot = Container();
    if (i == 0) {
      ot = Container();
    } else if (i == 1 || i == 2) {
      ot = Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              textAlign: TextAlign.center,
              // Текст по центру
              cursorColor: Colors.white70,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: 'YOUR EMAIL',
                // Хинт текст
                hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                // Цвет хинт текста
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white), // Цвет линии (неактивное состояние)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white), // Цвет линии (активное состояние)
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              textAlign: TextAlign.center,
              // Текст по центру
              cursorColor: Colors.white70,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: 'ENTER PASSWORD',
                // Хинт текст
                hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                // Цвет хинт текста
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white), // Цвет линии (неактивное состояние)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white), // Цвет линии (активное состояние)
                ),
              ),
            ),
          ],
        ),
      );
    }
    return ot;
  }

  Widget downButton(int i) {
    Row ot = Row();
    if (i == 0) {
      ot = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                formF = 1;
              });
            },
            child: Container(
              height: 60.0,
              color: Colors.transparent, // Используем текущий цвет фона
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'LOG IN  ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 26,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                formF = 2;
              });
            },
            child: Container(
              height: 60.0,
              color: Colors.transparent, // Используем текущий цвет фона
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'NEW  ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.add,
                      size: 26,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
    } else if (i == 1) {
      ot = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              try {
                setState(() => loading = true);
                UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );

                await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
                  'uid' : userCredential.user!.uid,
                  'email' : emailController.text
                }, SetOptions(merge: true));

                // Пользователь успешно создан
                if (FirebaseAuth.instance.currentUser != null) {
                  AutoRouter.of(context).pushAndPopUntil(MainRoute(),
                      predicate: (route) => false);
                }
              } catch (error) {
                // Обработка ошибок при регистрации
                print('Ошибка при создании пользователя: $error');
              } finally {
                // Этот блок выполняется независимо от успешного или неудачного завершения операции
                setState(() => loading = false);
              }
            },
            child: Container(
              height: 60.0,
              color: Colors.transparent, // Используем текущий цвет фона
              child: Center(
                child: loading
                    ? Loading()
                    : Row(
                        children: [
                          Text(
                            'LOG IN  ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 26,
                            color: Colors.white,
                          )
                        ],
                      ),
              ),
            ),
          ),
        ],
      );
    } else if (i == 2) {
      ot = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              try {
                setState(() => loading = true);
                UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );

                await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
                  'uid' : userCredential.user!.uid,
                  'email' : emailController.text
                });

                // Пользователь успешно создан
                if (FirebaseAuth.instance.currentUser != null) {
                  AutoRouter.of(context).pushAndPopUntil(MainRoute(),
                      predicate: (route) => false);
                }
              } catch (error) {
                // Обработка ошибок при регистрации
                print('Ошибка при создании пользователя: $error');
              } finally {
                // Этот блок выполняется независимо от успешного или неудачного завершения операции
                setState(() => loading = false);
              }
            },
            child: Container(
              height: 60.0,
              color: Colors.transparent, // Используем текущий цвет фона
              child: Center(
                child: loading
                    ? Loading()
                    : Row(
                        children: [
                          Text(
                            'NEW  ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.add,
                            size: 26,
                            color: Colors.white,
                          )
                        ],
                      ),
              ),
            ),
          )
        ],
      );
    }
    return ot;
  }

  Widget logAndPassword(int i) {
    Container ot = Container();
    if (i == 0) {
      ot = Container();
    } else if (i == 1) {
      ot = Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  formF = 2;
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.transparent, // Используем текущий цвет фона
                child: Row(
                  children: [
                    Text(
                      'NEW  ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.add,
                      size: 14,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else if (i == 2) {
      ot = Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  formF = 1;
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.transparent, // Используем текущий цвет фона
                child: Row(
                  children: [
                    Text(
                      'LOG IN  ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 14,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    return ot;
  }
}
