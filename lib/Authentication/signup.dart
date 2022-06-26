import 'package:astrodrishti/Authentication/funcs.dart';
import 'package:astrodrishti/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscure = true;

  late TextEditingController mobile = TextEditingController();
  late TextEditingController email = TextEditingController();
  late String password = "";

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
                    "Create\nAccount",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 36),
                  ),
                  SizedBox(
                    width: getwidth(context, 22),
                  ),
                  Image(
                    image: AssetImage("assets/images/Groupwheel.png"),
                    height: getheight(context, 230),
                    width: getheight(context, 230),
                  )
                ],
              )
            ],
          ),
          Positioned(
            top: getheight(context, 220),
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: getheight(context, 624),
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
                        "Signup",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: getheight(context, 15),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        color: Color(0xff1F2463),
                        thickness: 2,
                      ),
                    ),
                    SizedBox(
                      height: getheight(context, 23),
                    ),
                    _LocalTExtField(
                      title: "Mobile No.",
                      controller: mobile,
                      hint: "92XXXXXX99",
                      input_type: TextInputType.number,
                    ),
                    _LocalTExtField(
                      title: "Email",
                      controller: email,
                      hint: "xyz@email.com",
                      input_type: TextInputType.emailAddress,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: getwidth(context, 15),
                          bottom: getheight(context, 24)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
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
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    obscureText: _obscure,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Color(0xffADADAD)),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Strong Password !",
                                      hintStyle:
                                          TextStyle(color: Color(0xffADADAD)),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscure = !_obscure;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getheight(context, 35),
                    ),
                    GestureDetector(
                      onTap: () {
                        sign_up(email.text, password, mobile.text, context);
                        Navigator.pushNamed(context, '/otp');
                      },
                      child: BlueButton(
                        title: "Register",
                      ),
                    ),
                    SizedBox(
                      height: getheight(context, 35),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?  ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Log In",
                            style: TextStyle(
                                color: Color(0xff21D4FD),
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getheight(context, 16),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        color: Color(0xff1F2463),
                        thickness: 2,
                      ),
                    ),
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
  _LocalTExtField(
      {required this.title,
      required this.hint,
      required this.input_type,
      required this.controller});

  String title, hint;

  TextEditingController controller;

  TextInputType input_type;

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
                    controller: controller,
                    keyboardType: input_type,
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
