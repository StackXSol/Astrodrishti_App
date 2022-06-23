import 'package:astrodrishti/Authentication/details.dart';
import 'package:astrodrishti/Authentication/login.dart';
import 'package:astrodrishti/Authentication/otp.dart';
import 'package:astrodrishti/Authentication/signup.dart';
import 'package:astrodrishti/Screens/analysis.dart';
import 'package:astrodrishti/Screens/notifications.dart';
import 'package:astrodrishti/Screens/order_history.dart';
import 'package:astrodrishti/Screens/profile.dart';
import 'package:flutter/material.dart';

import 'MainScreens/BottomNavBar.dart';
import 'Screens/saved.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astrodrishti',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      routes: {
        '/login': (context) => const LogIn(),
        '/signup': (context) => const SignUp(),
        '/otp': (context) => OtpAuth(),
        '/navbar': (context) => BottomBar(),
        '/details': (context) => Details(),
        '/orders': (context) => OrderHistory(),
        '/notifications': (context) => Notifications(),
        '/profile': (context) => Profile(),
        '/saved': (context) => Saved(),
        '/analysis': (context) => Analysis(),
        '/navbar': (context) => BottomBar(),
      },
      initialRoute: '/login',
    );
  }
}
