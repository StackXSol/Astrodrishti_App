import 'package:astrodrishti/Authentication/funcs.dart';
import 'package:astrodrishti/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _obscure = true;

  TextEditingController username = TextEditingController();
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      "Welcome\nBack",
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
              top: getheight(context, 342),
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
                        controller: username,
                        title: "Username",
                        hint: "Email or Phone Number",
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
                                      onChanged: (val) {
                                        password = val;
                                      },
                                      obscureText: _obscure,
                                      cursorColor: Colors.white,
                                      style:
                                          TextStyle(color: Color(0xffADADAD)),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Enter password here",
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
                          /// checking login
                          // Navigator.pushNamed(context, '/navbar');
                          login(username.text, password, context);
                        },
                        child: BlueButton(
                          title: "Log In",
                        ),
                      ),
                      SizedBox(
                        height: getheight(context, 35),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/signup");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have an account?  ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/signup");
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Color(0xff21D4FD),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getheight(context, 15),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(
                          thickness: 2,
                          color: Color(0xff1F2463),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocalTExtField extends StatelessWidget {
  _LocalTExtField(
      {required this.title, required this.hint, required this.controller});

  String title, hint;
  TextEditingController controller;

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
