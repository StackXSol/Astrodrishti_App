import 'dart:convert';

import 'package:astrodrishti/Authentication/funcs.dart';
import 'package:astrodrishti/MainScreens/BottomNavBar.dart';
import 'package:astrodrishti/apiCalling.dart';
import 'package:astrodrishti/cubit/astrodrishti_cubit_cubit.dart';
import 'package:astrodrishti/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  TextEditingController _datecontroller = TextEditingController();
  TextEditingController _timecontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();

  double _lat = 0.0;
  double _lon = 0.0;
  String _tmz = "";

  String _birthplace = "Select Birth Place";

  fetchLocation() async {
    try {
      var _coordinates = await picloc(context);
      _lat = double.parse(_coordinates[0]);
      _lon = double.parse(_coordinates[1]);
    } catch (e) {
      print(e);
    }
  }

  Future<void> setBirthPlace() async {
    http.Response res = await http.get(
      Uri.parse(
          "https://us1.locationiq.com/v1/reverse.php?key=4b811c0bc86e19&lat=$_lat&lon=$_lon&format=json"),
    );

    http.Response ress = await http.get(
      Uri.parse(
          "http://api.timezonedb.com/v2.1/get-time-zone?key=0MX7YDAS3D26&format=json&by=position&lat=$_lat&lng=$_lon"),
    );
    setState(() {
      if (jsonDecode(res.body)["address"]["city"] == null) {
        if (jsonDecode(res.body)["address"]["village"] == null) {
          _birthplace = jsonDecode(res.body)["address"]["town"].toString() +
              ", " +
              jsonDecode(res.body)["address"]["state"].toString() +
              ", " +
              jsonDecode(res.body)["address"]["country"].toString();
        } else {
          _birthplace = jsonDecode(res.body)["address"]["village"].toString() +
              ", " +
              jsonDecode(res.body)["address"]["state"].toString() +
              ", " +
              jsonDecode(res.body)["address"]["country"].toString();
        }
      } else {
        if (jsonDecode(res.body)["address"]["state"] == null) {
          _birthplace = jsonDecode(res.body)["address"]["city"].toString() +
              ", " +
              jsonDecode(res.body)["address"]["country"].toString();
        } else {
          _birthplace = jsonDecode(res.body)["address"]["city"].toString() +
              ", " +
              jsonDecode(res.body)["address"]["state"].toString() +
              ", " +
              jsonDecode(res.body)["address"]["country"].toString();
        }
      }
      _birthplace = _birthplace.replaceAll("null", "");
      _tmz = (json.decode(ress.body)['gmtOffset'].toInt() / 3600).toString();
    });
  }

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
                  height: getheight(context, 32),
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
                          fontWeight: FontWeight.w500,
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
              top: getheight(context, 190),
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
                        controller: _namecontroller,
                        hint: "Enter your name",
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: getwidth(context, 15),
                            bottom: getheight(context, 24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date of Birth",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
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
                                      controller: _datecontroller,
                                      cursorColor: Colors.white,
                                      style:
                                          TextStyle(color: Color(0xffADADAD)),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "DD/MM/YY",
                                        hintStyle:
                                            TextStyle(color: Color(0xffADADAD)),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(1950),
                                                lastDate: DateTime(2150))
                                            .then((value) {
                                          setState(() {
                                            _datecontroller.text =
                                                "${value.toString().substring(8, 10)}/${value.toString().substring(5, 7)}/${value.toString().substring(0, 4)}";
                                          });
                                        });
                                      },
                                      icon: Icon(
                                        Icons.calendar_today_outlined,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: getwidth(context, 15),
                            bottom: getheight(context, 24)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Birth Time",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
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
                                      controller: _timecontroller,
                                      cursorColor: Colors.white,
                                      style:
                                          TextStyle(color: Color(0xffADADAD)),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "HH:MM",
                                        hintStyle:
                                            TextStyle(color: Color(0xffADADAD)),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) {
                                          setState(() {
                                            print(value);
                                            _timecontroller.text =
                                                "${value!.toString().substring(10, 12)}:${value.toString().substring(13, 15)}";
                                          });
                                        });
                                      },
                                      icon: Icon(
                                        Icons.timelapse,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await fetchLocation();
                          _lat != 0.0 ? setBirthPlace() : null;
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: getwidth(context, 15),
                              bottom: getheight(context, 24)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Birth Place",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
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
                                      child: Text(
                                        _birthplace,
                                        style:
                                            TextStyle(color: Color(0xffADADAD)),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getheight(context, 20),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await pushData(
                              _namecontroller.text,
                              _datecontroller.text,
                              _timecontroller.text,
                              _birthplace,
                              _lat,
                              _lon,
                              _tmz,
                              await getSign(context, _datecontroller.text,
                                  _timecontroller.text, _lat, _lon, _tmz));
                          BlocProvider.of<AstrodrishtiCubitCubit>(context)
                              .getUserData(
                                  FirebaseAuth.instance.currentUser!.uid,
                                  context);
                          BlocProvider.of<AstrodrishtiCubitCubit>(context)
                              .getUserWallet(
                                  FirebaseAuth.instance.currentUser!.uid,
                                  context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomBar()));
                        },
                        child: BlueButton(
                          title: "Explore",
                        ),
                      ),
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
