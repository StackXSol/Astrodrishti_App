import 'package:flutter/material.dart';
import 'package:astrodrishti/widgets.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Container(
            child: Column(
          children: [
            ClipRect(
              child: Container(
                  height: getheight(context, 150),
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
                            SizedBox(height: getheight(context, 12)),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Notifications",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: getwidth(context, 22),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Image(
                            image: AssetImage("assets/images/Groupwheel.png"),
                            height: getheight(context, 230),
                            width: getwidth(context, 230),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: getheight(context, 26),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Today",
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Notification(),
            Notification(),
            Notification(),
            Notification(),
          ],
        )),
      ),
    );
  }
}

class Notification extends StatelessWidget {
  const Notification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: getheight(context, 56),
                width: getwidth(context, 56),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF21D4FD)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: AssetImage('assets/images/test.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kundali Analysis",
                    style: TextStyle(
                        color: Color(0xFF21D4FD),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                      width: getwidth(context, 180),
                      child: Text("Your Kundali Analysis has been done."))
                ],
              ),
              Spacer(),
              Column(
                children: [Text("5 min ago")],
              )
            ],
          ),
          SizedBox(height: 16),
          Divider(
            height: 1,
            endIndent: 12,
            indent: 12,
            color: Color(0xFF4036AD),
          ),
        ],
      ),
    );
  }
}
