import 'package:flutter/material.dart';
import 'package:astrodrishti/widgets.dart';

class Analysis extends StatelessWidget {
  const Analysis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(children: [
        Column(
          children: [
            Container(
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
                        SizedBox(height: getheight(context, 58)),
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Kundli Analysis",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 25),
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
              ),
            ),
            SizedBox(
              height: getheight(context, 24),
            ),
          ],
        ),
        Positioned(
          top: getheight(context, 190),
          left: getwidth(context, 15),
          right: getwidth(context, 15),
          child: Container(
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
                      BarWid(icon: Icons.details, name: "Details"),
                      BarWid(icon: Icons.data_array, name: "Charts"),
                      BarWid(icon: Icons.sunny, name: "Planets"),
                      BarWid(icon: Icons.timeline, name: "Dashas"),
                      BarWid(icon: Icons.batch_prediction, name: "Predictions"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class BarWid extends StatelessWidget {
  BarWid({required this.icon, required this.name});
  String name;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
