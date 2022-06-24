import 'package:astrodrishti/Screens/Drawer.dart';
import 'package:astrodrishti/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: AstroDrawer(),
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: getwidth(context, 8),
                      bottom: getheight(context, 21)),
                  child: IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getwidth(context, 16),
                      bottom: getheight(context, 16)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, Jyotsana Gaur\nGaur",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 24),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                            "https://stackxsolutions.in/static/assets/img/portfolio/astrodrishti.png"),
                      ),
                      SizedBox(
                        width: getwidth(context, 16),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getwidth(context, 16),
                      bottom: getheight(context, 28)),
                  child: Text(
                    "♓︎ Pices, 19 Feb 1999",
                    style: TextStyle(
                        foreground: Paint()..shader = blue_text_grad,
                        // color: Color(0xff6D80FE),
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _HoroBlock(
                      icon: Icons.heart_broken,
                      title: "Love",
                    ),
                    _HoroBlock(
                      icon: Icons.leaderboard,
                      title: "Career",
                    ),
                    _HoroBlock(
                      icon: Icons.money,
                      title: "Finance",
                    ),
                    _HoroBlock(
                      icon: Icons.health_and_safety,
                      title: "Health",
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getwidth(context, 16),
                      top: getheight(context, 36),
                      right: getwidth(context, 16)),
                  child: Container(
                    width: getwidth(context, 343),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff4036AD).withOpacity(0.7),
                          Color(0xff060C27).withOpacity(0.217)
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today Horoscope",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: getheight(context, 12),
                        ),
                        Text(
                          "You could find the hardest person to face is you, Pisces. You tend toward introspection, and you may find yourself shrinking into self-recrimination. You could analyze the important people in your life and yet fail to address the one you really need to look at .",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: getheight(context, 24),
                        ),
                        Wrap(
                          spacing: getwidth(context, 95),
                          runSpacing: getheight(context, 25),
                          children: [
                            _dot_clip(
                              title: "97%",
                            ),
                            _dot_clip(
                              title: "Work Hard ",
                            ),
                            _dot_clip(
                              title: "Love Blossoms",
                            ),
                            _dot_clip(
                              title: "Work Hard",
                            )
                          ],
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: getheight(context, 24),
                      bottom: getheight(context, 32)),
                  child: Center(
                      child: Image(
                          width: getwidth(context, 340),
                          height: getheight(context, 143),
                          image: AssetImage("assets/images/ask.png"))),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getwidth(context, 16),
                      bottom: getheight(context, 16)),
                  child: Text(
                    "More Features",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getwidth(context, 16),
                      bottom: getheight(context, 33)),
                  child: Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    children: [
                      Container(
                        height: getheight(context, 164),
                        width: getwidth(context, 159),
                        decoration: BoxDecoration(
                            color: Color(0xff4036AD).withOpacity(0.32),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        height: getheight(context, 164),
                        width: getwidth(context, 159),
                        decoration: BoxDecoration(
                            color: Color(0xff4036AD).withOpacity(0.32),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        height: getheight(context, 164),
                        width: getwidth(context, 159),
                        decoration: BoxDecoration(
                            color: Color(0xff4036AD).withOpacity(0.32),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        height: getheight(context, 164),
                        width: getwidth(context, 159),
                        decoration: BoxDecoration(
                            color: Color(0xff4036AD).withOpacity(0.32),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _dot_clip extends StatelessWidget {
  _dot_clip({required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getwidth(context, 77),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xff21D4FD).withOpacity(0.5),
            child: CircleAvatar(
              radius: 6,
              backgroundColor: Color(0xff21D4FD),
            ),
          ),
          SizedBox(
            width: getwidth(context, 16),
          ),
          Text(
            title,
            style: TextStyle(
                foreground: Paint()..shader = blue_text_grad,
                fontWeight: FontWeight.w600,
                fontSize: 16),
          )
        ],
      ),
    );
  }
}

class _HoroBlock extends StatelessWidget {
  _HoroBlock({required this.icon, required this.title});

  IconData icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getheight(context, 68),
      width: getheight(context, 68),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xff6D80FE),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
