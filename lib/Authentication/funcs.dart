import 'package:astrodrishti/Authentication/otp.dart';
import 'package:astrodrishti/cubit/astrodrishti_cubit_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> sign_up(email, password, phone, context) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);

  String uid = await FirebaseAuth.instance.currentUser!.uid;

  FirebaseFirestore.instance.collection("Users").doc(uid).set({
    "Phone": phone,
    "Uid": uid,
    "Email": email,
    "verified": false,
    "Data": false,
    "Wallet": {"Balance": 0, "Transactions": {}}
  }, SetOptions(merge: true));

  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: '+91$phone',
    verificationCompleted: (PhoneAuthCredential credential) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OtpAuth(otp: int.parse(credential.smsCode!))));
    },
    verificationFailed: (FirebaseAuthException e) {},
    codeSent: (String verificationId, int? resendToken) {},
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}

Future<void> pushData(name, dob, tob, place, lat, lon) async {
  String uid = await FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore.instance.collection("Users").doc(uid).set({
    "Name": name,
    "DOB": dob,
    "TOB": tob,
    "Place": place,
    "Lat": lat,
    "Lon": lon,
    "Data": true,
  }, SetOptions(merge: true));
}

Future<void> login(String username, password, context) async {
  if (username.contains("@")) {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: username, password: password);
    BlocProvider.of<AstrodrishtiCubitCubit>(context)
        .getUserData(FirebaseAuth.instance.currentUser!.uid);
    Navigator.pushReplacementNamed(context, "/navbar");
  } else if (username.length == 10) {
    try {
      var key = await FirebaseFirestore.instance
          .collection("Users")
          .where("Phone", isEqualTo: username)
          .get();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: key.docs.first.data()["Email"], password: password);
      BlocProvider.of<AstrodrishtiCubitCubit>(context)
          .getUserData(FirebaseAuth.instance.currentUser!.uid);
      Navigator.pushReplacementNamed(context, "/navbar");
    } catch (e) {}
  }
}
