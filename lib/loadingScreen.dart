import 'package:astrodrishti/Authentication/funcs.dart';
import 'package:astrodrishti/Authentication/login.dart';
import 'package:astrodrishti/cubit/astrodrishti_cubit_cubit.dart';
import 'package:astrodrishti/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class start_page extends StatefulWidget {
  @override
  _start_pageState createState() => _start_pageState();
}

class _start_pageState extends State<start_page> {
  @override
  void initState() {
    // checknet();
    // set_screen();
    super.initState();
  }

  // void checknet() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile ||
  //       connectivityResult == ConnectivityResult.wifi) {
  //     login();
  //   } else {
  //     Fluttertoast.showToast(msg: "Check your Internet Connection!");
  //   }
  // }

  Future<void> set_screen() async {
    try {
      var key = await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      if ((key.data() as dynamic)["verified"]) {
        if ((key.data() as dynamic)["Data"]) {
          BlocProvider.of<AstrodrishtiCubitCubit>(context)
              .getUserData(FirebaseAuth.instance.currentUser!.uid, context);
          BlocProvider.of<AstrodrishtiCubitCubit>(context)
              .getUserWallet(FirebaseAuth.instance.currentUser!.uid, context);

          Navigator.pushReplacementNamed(context, "/navbar");
        } else {
          Navigator.pushReplacementNamed(context, "/details");
        }
      } else {
        verify((key.data() as dynamic)["Phone"], context);
      }
    } catch (e) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LogIn(),
        ),
      );
    }
  }

  late bool language;

  @override
  bool show = false;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgColor,
        height: 5000,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getwidth(context, 50)),
              child: Image(image: AssetImage("assets/images/logo.png")),
            ),
            SizedBox(
              height: getheight(context, 15),
            ),
            Text(
              "Astrodrishti",
              style: TextStyle(
                foreground: Paint()..shader = orange_text_grad,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: getheight(context, 85),
            ),
            SpinKitWave(
              color: Colors.orange,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
