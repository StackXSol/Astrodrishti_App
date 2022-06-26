import 'package:flutter/material.dart';
import 'package:astrodrishti/widgets.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              ClipRect(
                child: Container(
                    height: getheight(context, 234),
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
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Wallet",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30),
                              ),
                              SizedBox(height: getheight(context, 24)),
                              Text("Total Avaliable Balance"),
                              SizedBox(height: getheight(context, 10)),
                              Text(
                                "₹2000",
                                style: TextStyle(
                                    fontSize: 30, color: Color(0xFF21D4FD)),
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
                    "Recharges available",
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(
                height: getheight(context, 24),
              ),
              Wrap(
                runSpacing: 24,
                spacing: 20,
                children: [
                  Recharges(
                    price: "₹50",
                  ),
                  Recharges(
                    price: "₹100",
                  ),
                  Recharges(
                    price: "₹200",
                  ),
                  Recharges(
                    price: "₹300",
                  ),
                  Recharges(
                    price: "₹500",
                  ),
                  Recharges(
                    price: "₹1000",
                  )
                ],
              ),
              SizedBox(
                height: getheight(context, 35),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Apply coupon",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getheight(context, 18),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 15)),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Color(0xFF161A4D),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Enter Code",
                                hintStyle: TextStyle(color: Colors.white))),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Visibility(
                visible: false,
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      "You have an discount of ₹300",
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(
                      width: getwidth(context, 24),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getheight(context, 65),
              ),
              GestureDetector(
                onTap: () {
                  //proceed to pay
                },
                child: BlueButton(
                  title: "Proceed To Pay",
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          )),
        ),
      ),
    );
  }
}

class Recharges extends StatelessWidget {
  Recharges({required this.price});
  late String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getheight(context, 64),
      width: getwidth(context, 100),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Color(0xFF161A4D)),
      child: Center(child: Text(price)),
    );
  }
}
