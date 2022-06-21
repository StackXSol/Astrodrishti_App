import 'package:flutter/material.dart';
import 'package:astrodrishti/widgets.dart';

class Analysis extends StatelessWidget {
  const Analysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
          child: Stack(children: [
        Column(
          children: [
            Positioned(
                top: getheight(context, 375),
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF0b1339), Color(0xFF232a78)],
                        ),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: getheight(context, 88)),
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Kundali Analysis",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30),
                              ),
                              SizedBox(
                                height: getheight(context, 22),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: getwidth(context, 22),
                        ),
                        Image(
                          image: AssetImage("assets/images/Groupwheel.png"),
                          height: getheight(context, 230),
                          width: getwidth(context, 230),
                        ),
                      ],
                    ))),
            Positioned(
              bottom: getheight(context, 60),
              child: Container(
                height: getheight(context, 64),
                width: getwidth(context, 343),
                decoration: BoxDecoration(
                    color: Color(0xFF161A4D),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.details),
                              SizedBox(height: 10),
                              Text("Details"),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.graphic_eq),
                              SizedBox(height: 10),
                              Text("Charts"),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.sunny),
                              SizedBox(height: 10),
                              Text("Planets"),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.gas_meter),
                              SizedBox(height: 10),
                              Text("Dashas"),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.person),
                              SizedBox(height: 10),
                              Text("Predictions"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getheight(context, 24),
            ),
          ],
        ),
      ])),
    );
  }
}
