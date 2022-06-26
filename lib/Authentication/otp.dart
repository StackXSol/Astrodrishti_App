import 'package:astrodrishti/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OtpAuth extends StatefulWidget {
  OtpAuth({required this.otp});

  int otp;

  @override
  State<OtpAuth> createState() => _OtpAuthState();
}

class _OtpAuthState extends State<OtpAuth> {
  int pin = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: getheight(context, 86),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Confirm\nOTP",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 36),
                  ),
                  SizedBox(
                    width: getwidth(context, 11),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: getheight(context, 58)),
                    child: Image(
                      image: AssetImage("assets/images/Groupwheel.png"),
                      height: getheight(context, 372),
                      width: getheight(context, 372),
                    ),
                  )
                ],
              )
            ],
          ),
          Positioned(
            top: getheight(context, 490),
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: bottomSheetColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getheight(context, 24),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: getwidth(context, 18)),
                      child: Text(
                        "Enter code sent to your number",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: getheight(context, 15),
                    ),
                    Divider(
                      color: Color(0xff1F2463),
                      thickness: 2,
                    ),
                    SizedBox(
                      height: getheight(context, 23),
                    ),
                    OTPTextField(
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 45,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      otpFieldStyle: OtpFieldStyle(
                          enabledBorderColor: Colors.white,
                          borderColor: Colors.white),
                      onCompleted: (val) {
                        pin = int.parse(val);
                      },
                    ),
                    SizedBox(
                      height: getheight(context, 35),
                    ),
                    GestureDetector(
                      onTap: () {
                        print(widget.otp);
                        print(pin);
                        if (pin == widget.otp) {
                          FirebaseFirestore.instance
                              .collection("Users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .update({"verified": true});
                          Navigator.pushReplacementNamed(context, '/details');
                        } else {
                          print("wrong!");
                        }
                      },
                      child: BlueButton(
                        title: "Next",
                      ),
                    ),
                    SizedBox(
                      height: getheight(context, 35),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Resent OTP in  ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/signup");
                          },
                          child: Text(
                            "1:12 min",
                            style: TextStyle(
                                color: Color(0xff21D4FD),
                                fontWeight: FontWeight.w700,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LocalTExtField extends StatelessWidget {
  _LocalTExtField({required this.title, required this.hint});

  String title, hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getwidth(context, 15), bottom: getheight(context, 24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: getheight(context, 58),
            width: getwidth(context, 343),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Color(0xffADADAD)),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: TextStyle(color: Color(0xffADADAD)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
