import 'package:astrodrishti/Authentication/details.dart';
import 'package:astrodrishti/Authentication/login.dart';
import 'package:astrodrishti/Authentication/otp.dart';
import 'package:astrodrishti/Authentication/signup.dart';
import 'package:astrodrishti/MainScreens/BottomNavBar.dart';
import 'package:astrodrishti/MainScreens/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/login': (context) => const LogIn(),
        '/signup': (context) => const SignUp(),
        '/otp': (context) => OtpAuth(),
        '/details': (context) => Details(),
        '/home': (context) => BottomBar(),
      },
      initialRoute: '/home',
    );
  }
}
