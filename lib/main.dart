import 'package:flutter/material.dart';
import 'package:test_project/HomeView.dart';
import 'package:test_project/Login.dart';
import 'package:test_project/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'Login',
    routes: {
      'Login': (context) => MyLogin(),
      'register': (context) => MyRegister(),
      'HomeView': (context) => HomeViewdata(),
    },
  ));
}
