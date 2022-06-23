import 'package:flutter/material.dart';
import 'package:astrodrishti/widgets.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
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
                                  "2000",
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
                    price: "25",
                  ),
                  Recharges(
                    price: "55",
                  ),
                  Recharges(
                    price: "65",
                  ),
                  Recharges(
                    price: "100",
                  ),
                  Recharges(
                    price: "250",
                  ),
                  Recharges(
                    price: "200",
                  )
                ],
              ),
              SizedBox(
                height: getheight(context, 24),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Apply coupons",
                      style: TextStyle(fontSize: 26),
                    ),
                    SizedBox(
                      height: getheight(context, 16),
                    ),
                    Text("Coupon code"),
                  ],
                ),
              ),
              SizedBox(
                height: getheight(context, 10),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 16)),
                child: Container(
                    padding: EdgeInsets.all(3),
                    // height: getheight(context, getheight(context, 128)),
                    width: getwidth(context, getwidth(context, 343)),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Color(0xFF161A4D),
                        borderRadius: BorderRadius.circular(8)),
                    child: TextField(
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Enter Code",
                            hintStyle: TextStyle(color: Colors.white)))),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Spacer(),
                  Text(
                    "You have an discount of 300",
                    style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(
                    width: getwidth(context, 15),
                  ),
                ],
              ),
              SizedBox(
                height: getheight(context, 25),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getwidth(context, 15)),
                child: Row(
                  children: [
                    Text("Previous orders"),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/orders');
                        },
                        child: Text("View all"))
                  ],
                ),
              ),
              SizedBox(
                height: getheight(context, 24),
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
          ),
        ])),
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
