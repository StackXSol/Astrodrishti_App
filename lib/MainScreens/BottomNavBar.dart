import 'package:astrodrishti/AskQuestion/askQuestion.dart';
import 'package:astrodrishti/Authentication/login.dart';
import 'package:astrodrishti/MainScreens/HomeScreen.dart';
import 'package:astrodrishti/Screens/wallet.dart';
import 'package:astrodrishti/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int index = 0;

  List<Widget> _screens = [HomeScreen(), askQuestion(), Wallet()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: GestureDetector(
      //     onTap: () {
      //       showModalBottomSheet<void>(
      //         backgroundColor: Colors.transparent,
      //         context: context,
      //         builder: (BuildContext context) {
      //           return Container(
      //             padding: EdgeInsets.all(18),
      //             decoration: BoxDecoration(
      //                 color: Color(0xff161A4D),
      //                 borderRadius: BorderRadius.only(
      //                     topLeft: Radius.circular(15),
      //                     topRight: Radius.circular(15))),
      //             height: getheight(context, 472),
      //             child: SingleChildScrollView(
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 mainAxisSize: MainAxisSize.min,
      //                 children: <Widget>[
      //                   Row(
      //                     children: [
      //                       Text(
      //                         "Ask Your Question",
      //                         style: TextStyle(fontSize: 18),
      //                       ),
      //                       Spacer(),
      //                       IconButton(
      //                           onPressed: () {
      //                             Navigator.pop(context);
      //                           },
      //                           icon: Icon(
      //                             Icons.cancel,
      //                             color: Colors.white,
      //                           ))
      //                     ],
      //                   ),
      //                   Divider(
      //                     color: Color(0xff1F2463),
      //                   ),
      //                   SizedBox(
      //                     height: getheight(context, 22),
      //                   ),
      //                   Row(
      //                     children: [Text("Question"), Spacer(), Text("0/100")],
      //                   ),
      //                   SizedBox(
      //                     height: getheight(context, 8),
      //                   ),
      //                   TextFormField(
      //                     decoration: InputDecoration(
      //                         hintText: "Type your qustion here..."),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           );
      //         },
      //       );
      //     },
      //     child: _BlueButton(title: "Ask Question")),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff6D80FE),
        unselectedItemColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        currentIndex: index,
        onTap: ((value) {
          setState(() {
            index = value;
          });
        }),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), label: "Ask ?"),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_membership), label: "Wallet")
        ],
        backgroundColor: Color.fromARGB(255, 17, 25, 72).withOpacity(0.6),
      ),
      body: _screens[index],
    );
  }
}

class _BlueButton extends StatefulWidget {
  _BlueButton({required this.title});

  String title;

  @override
  State<_BlueButton> createState() => _BlueButtonState();
}

class _BlueButtonState extends State<_BlueButton> {
  String dropdownValue = 'BreakFast';

  var items = [
    'BreakFast',
    'Lunch',
    'Dinner',
    "Snacks",
    'Bakery',
    'Bevrages',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Color(0xFF161A4D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: getheight(context, 450),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: getheight(context, 24),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            'Ask your question',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                height: getheight(context, 32),
                                width: getheight(context, 32),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xFF010642)),
                                child: Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.white,
                                  size: getheight(context, 32),
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getheight(context, 15),
                    ),
                    Divider(
                      height: 3,
                      color: Color(0xFF010642),
                    ),
                    SizedBox(
                      height: getheight(context, 24),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Question"),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            height: getheight(context, getheight(context, 128)),
                            width: getwidth(context, getwidth(context, 343)),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Color(0xFF161A4D),
                                borderRadius: BorderRadius.circular(8)),
                            child: TextField(
                              expands: true,
                              maxLines: null,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: "Type you question here...",
                                  hintStyle: TextStyle(color: Colors.white)),
                            ),
                          ),
                          SizedBox(
                            height: getheight(context, 24),
                          ),
                          Text("Problem Category"),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            // height: getheight(context, getheight(context, 128)),
                            width: getwidth(context, getwidth(context, 343)),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Color(0xFF161A4D),
                                borderRadius: BorderRadius.circular(8)),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: dropdownValue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              elevation: 16,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              underline: Container(
                                height: 0.3,
                                color: Colors.black,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                    value: items, child: Text(items));
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        // submit question
                      },
                      child: Container(
                        height: getheight(context, 50),
                        width: getwidth(context, 343),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff21D4FD).withOpacity(0.7),
                              Color(0xff6D80FE).withOpacity(0.217)
                            ],
                          ),
                        ),
                        child: Center(child: Text("Submit")),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: Container(
        margin: EdgeInsets.only(
            left: getwidth(context, 15), right: getwidth(context, 15)),
        height: getheight(context, 50),
        width: getwidth(context, 100),
        decoration: BoxDecoration(
            gradient: blue_grade, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13),
          ),
        ),
      ),
    );
  }
}
