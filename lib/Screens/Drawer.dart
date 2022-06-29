import 'package:astrodrishti/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'profile.dart';

class AstroDrawer extends StatefulWidget {
  const AstroDrawer({Key? key}) : super(key: key);

  @override
  State<AstroDrawer> createState() => _AstroDrawerState();
}

class _AstroDrawerState extends State<AstroDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff0C153A).withOpacity(0.9),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: getwidth(context, 0),
              right: getwidth(context, 0),
              top: getheight(context, 0)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(00, getheight(context, 28), 00, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getwidth(context, 105)),
                      child: Image(image: AssetImage("assets/images/logo.png")),
                    ),
                    SizedBox(
                      height: getheight(context, 12),
                    ),
                    Center(
                        child: Text(
                      "Astrodrishti",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        foreground: Paint()..shader = orange_text_grad,
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: getheight(context, 35),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: getwidth(context, 20), top: getheight(context, 0)),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                      },
                      child: _drawerWidget(
                          icon: Icons.account_circle_outlined,
                          title: "Profile"),
                    ),
                    _drawerWidget(
                        icon: Icons.notifications, title: "Notifications"),
                    _drawerWidget(icon: Icons.inventory, title: "Orders"),
                    _drawerWidget(icon: Icons.save, title: "Saved Kundlis"),
                    _drawerWidget(
                        icon: Icons.question_answer, title: "Ask Question?"),
                    _drawerWidget(icon: Icons.share, title: "Share"),
                    _drawerWidget(icon: Icons.report, title: "Report Issue"),
                    _drawerWidget(icon: Icons.logout, title: "Log Out"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _drawerWidget extends StatelessWidget {
  _drawerWidget({required this.icon, required this.title});

  IconData icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getheight(context, 30)),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color(0xff21D4FD),
            size: 26,
          ),
          SizedBox(
            width: getwidth(context, 12),
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
