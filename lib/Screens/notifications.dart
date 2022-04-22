import 'package:flutter/material.dart';
import 'package:astrodrishti/widgets.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

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
                                "Notifications",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30),
                              ),
                              SizedBox(height: getheight(context, 24)),
                              Row(
                                children: [
                                  Text(
                                    "Unread",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    height: getheight(context, 24),
                                    width: getwidth(context, 24),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF070D41),
                                        borderRadius:
                                            BorderRadius.circular(4.0)),
                                    child: //Unread count
                                        Center(
                                      child: Text(
                                        "4",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: getwidth(context, 32),
                                  ),
                                  Text(
                                    "General",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    height: getheight(context, 24),
                                    width: getwidth(context, 24),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF070D41),
                                        borderRadius:
                                            BorderRadius.circular(4.0)),
                                    child: //Unread count
                                        Center(
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
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
                        )
                      ],
                    ))),
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
        ),
      ])),
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
