import 'package:astrodrishti/Authentication/otp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> sign_up(email, password, phone, context) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);

  String uid = await FirebaseAuth.instance.currentUser!.uid;

  FirebaseFirestore.instance.collection("Users").doc(uid).set({
    "Phone": phone,
    "Uid": uid,
    "Email": email,
    "verified": false,
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
    "Lon": lon
  }, SetOptions(merge: true));
}
