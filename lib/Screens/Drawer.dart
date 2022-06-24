import 'package:astrodrishti/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
              // Container(
              //   decoration: BoxDecoration(
              //     // border: Border.all(color: Colors.white),
              //     color: Color(0xff21D4FD).withOpacity(0.6),
              //     // borderRadius: BorderRadius.circular(10),
              //   ),
              //   padding: EdgeInsets.fromLTRB(getwidth(context, 16),
              //       getheight(context, 40), 0, getheight(context, 40)),
              //   child: Row(
              //     children: [
              //       CircleAvatar(
              //         radius: getwidth(context, 38),
              //         backgroundColor: Colors.white,
              //         child: CircleAvatar(
              //           backgroundColor: Colors.transparent,
              //           radius: getwidth(context, 36),
              //           backgroundImage: NetworkImage(
              //               'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
              //         ),
              //       ),
              //       SizedBox(
              //         width: getwidth(context, 12),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Jyotsna Gaur",
              //             style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 22,
              //                 fontWeight: FontWeight.w600),
              //           ),
              //           Text(
              //             "xyxx@gmail.com",
              //             style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 18,
              //                 fontWeight: FontWeight.w400),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // ),

              Padding(
                padding: EdgeInsets.fromLTRB(00, getheight(context, 32), 00, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getwidth(context, 105)),
                      child: Image(
                          image: NetworkImage(
                              "https://astrodrishti.herokuapp.com/static/Images/logo.png")),
                    ),
                    SizedBox(
                      height: getheight(context, 10),
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
                height: getheight(context, 32),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: getwidth(context, 22), top: getheight(context, 0)),
                child: Column(
                  children: [
                    _drawerWidget(
                        icon: Icons.account_box_rounded, title: "Profile"),
                    _drawerWidget(icon: Icons.sell, title: "Orders"),
                    _drawerWidget(icon: Icons.save, title: "Saved Kundlis"),
                    _drawerWidget(
                        icon: Icons.chat_bubble, title: "Ask Question?"),
                    _drawerWidget(icon: Icons.book, title: "Blogs"),
                    _drawerWidget(icon: Icons.share, title: "Share"),
                    _drawerWidget(icon: Icons.dangerous, title: "Report Issue"),
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
      padding: EdgeInsets.only(bottom: getheight(context, 36)),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color(0xff21D4FD),
            size: 28,
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
