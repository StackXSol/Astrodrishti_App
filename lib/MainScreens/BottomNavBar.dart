import 'package:astrodrishti/Authentication/login.dart';
import 'package:astrodrishti/MainScreens/HomeScreen.dart';
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
  List<Widget> _screens = [HomeScreen(), LogIn()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: Color(0xff161A4D),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  height: getheight(context, 472),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              "Ask Your Question",
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        Divider(
                          color: Color(0xff1F2463),
                        ),
                        SizedBox(
                          height: getheight(context, 22),
                        ),
                        Row(
                          children: [Text("Question"), Spacer(), Text("0/100")],
                        ),
                        SizedBox(
                          height: getheight(context, 8),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "Type your qustion here..."),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: _BlueButton(title: "Ask Question")),
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
              icon: Icon(Icons.wallet_membership), label: "Wallet")
        ],
        backgroundColor: Color(0xff0C1236),
      ),
      body: _screens[index],
    );
  }
}

class _BlueButton extends StatelessWidget {
  _BlueButton({required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: getwidth(context, 15), right: getwidth(context, 15)),
      height: getheight(context, 50),
      width: getwidth(context, 100),
      decoration: BoxDecoration(
          gradient: blue_grade, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13),
        ),
      ),
    );
  }
}
