import 'package:astrodrishti/Authentication/details.dart';
import 'package:astrodrishti/Authentication/login.dart';
import 'package:astrodrishti/Authentication/otp.dart';
import 'package:astrodrishti/Authentication/signup.dart';
import 'package:astrodrishti/Screens/analysis.dart';
import 'package:astrodrishti/Screens/notifications.dart';
import 'package:astrodrishti/Screens/order_history.dart';
import 'package:astrodrishti/Screens/profile.dart';
import 'package:astrodrishti/apiCalling.dart';
import 'package:astrodrishti/backend.dart';
import 'package:astrodrishti/cubit/astrodrishti_cubit_cubit.dart';
import 'package:astrodrishti/loadingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import 'MainScreens/BottomNavBar.dart';
import 'Screens/saved.dart';

//global essentials

String key = "9f51deff-8bbd-55e5-b027-1e9dcad48df7";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(
    create: (context) => AstrodrishtiCubitCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xff0C153A));
    return MaterialApp(
      title: 'Astrodrishti',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      routes: {
        '/': (context) => start_page(),
        '/login': (context) => const LogIn(),
        '/signup': (context) => const SignUp(),
        '/navbar': (context) => BottomBar(),
        '/details': (context) => Details(),
        '/orders': (context) => OrderHistory(),
        '/notifications': (context) => Notifications(),
        '/profile': (context) => Profile(),
        '/saved': (context) => savedKundlis(),
        '/analysis': (context) => Analysis(),
      },
      initialRoute: '/',
    );
  }
}
