import 'package:astrodrishti/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
                    "Welcome to\nAstrodrishti",
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
            top: getheight(context, 224),
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: bottomSheetColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getheight(context, 24),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: getwidth(context, 18)),
                    child: Text(
                      "Birth Details",
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
                    height: getheight(context, 15),
                  ),
                  _LocalTExtField(
                    title: "Name",
                    hint: "Enter your name",
                  ),
                  _LocalTExtField(
                    title: "Date of Birth",
                    hint: "DD/MM/YY",
                  ),
                  _LocalTExtField(
                    title: "Birth Time",
                    hint: "HH:MM",
                  ),
                  _LocalTExtField(
                    title: "Birth Place",
                    hint: "Enter your birth place",
                  ),
                  SizedBox(
                    height: getheight(context, 20),
                  ),
                  GestureDetector(
                    // onTap: () {
                    //   Navigator.pushNamed(context, '/otp');
                    // },
                    child: BlueButton(
                      title: "Explore",
                    ),
                  ),
                ],
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
            height: getheight(context, 54),
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
