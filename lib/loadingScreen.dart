import 'package:astrodrishti/Authentication/funcs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class start_page extends StatefulWidget {
  @override
  _start_pageState createState() => _start_pageState();
}

class _start_pageState extends State<start_page> {
  @override
  void initState() {
    // checknet();
    set_screen();
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
      print(FirebaseAuth.instance.currentUser!.uid == null);
      var key = await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      if ((key.data() as dynamic)["verified"]) {
        if ((key.data() as dynamic)["Data"]) {
        } else {}
      } else {}
    } catch (e) {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  late bool language;

  @override
  bool show = false;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/AD.gif"), fit: BoxFit.cover),
        ),
        child: Container(),
      ),
    );
  }
}
