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
      floatingActionButton: _BlueButton(title: "Ask Question"),
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
