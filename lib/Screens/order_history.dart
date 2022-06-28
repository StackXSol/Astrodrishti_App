import 'package:flutter/material.dart';
import 'package:astrodrishti/widgets.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

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
                              "Order History",
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
              height: getheight(context, 24),
            ),
            Order(),
            Order(),
            Order(),
          ],
        )),
      ),
    );
  }
}

class Order extends StatelessWidget {
  const Order({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 36, right: 26),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sahil negi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("19 Feb 2022 at 02:30 ", style: TextStyle(fontSize: 12))
                ],
              ),
              Spacer(),
              Text(
                "+\u{20B9}21",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF21D4FD)),
              )
            ],
          ),
        ),
        SizedBox(height: 15),
        Divider(
          height: 1,
          endIndent: 12,
          indent: 12,
          color: Color(0xFF4036AD),
        ),
        SizedBox(height: getheight(context, 24)),
      ],
    );
  }
}
