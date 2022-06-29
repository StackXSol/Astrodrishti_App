import 'package:flutter/material.dart';
import 'package:astrodrishti/widgets.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRect(
                child: Container(
                  height: getheight(context, 160),
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
                            SizedBox(height: getheight(context, 18)),
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
                              height: getheight(context, 35),
                            ),
                            Text(
                              "My Account",
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
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: getheight(context, 20)),
              Row(
                children: [
                  SizedBox(
                    width: getwidth(context, 16),
                  ),
                  CircleAvatar(
                    radius: getheight(context, 52),
                    backgroundImage: NetworkImage(
                        "https://play-lh.googleusercontent.com/I-Yd5tJnxw7Ks8FUhUiFr8I4kohd9phv5sRFHG_-nSX9AAD6Rcy570NBZVFJBKpepmc"),
                  ),
                  SizedBox(
                    width: getwidth(context, 25),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jyotsana Gaur",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Text("abc@gmail.com")
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: getheight(context, 18),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getwidth(context, 92),
                    vertical: getheight(context, 12)),
                decoration: BoxDecoration(
                    color: Color(0xFF161A4D),
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "My Balance",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "\u{20B9}21",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getheight(context, 28),
              ),
              Container(
                alignment: AlignmentDirectional.centerStart,
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Personal",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                height: 2,
                // endIndent: 12,
                // indent: 12,
                color: Color(0xFF4036AD),
              ),
              SizedBox(
                height: getheight(context, 25),
              ),
              GestureDetector(
                onTap: () => {
                  //birth details
                },
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Birth Details",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_right, size: 25, color: Colors.white),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
              ),
              SizedBox(height: getheight(context, 25)),
              GestureDetector(
                onTap: () => {Navigator.pushNamed(context, '/orders')},
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    Icon(
                      Icons.list,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "My Orders",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_right, size: 25, color: Colors.white),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
              ),
              SizedBox(height: getheight(context, 25)),
              GestureDetector(
                onTap: () => {Navigator.pushNamed(context, '/saved')},
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    Icon(
                      Icons.save,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Saved Data",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_right, size: 25, color: Colors.white),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
              ),
              SizedBox(height: getheight(context, 25)),
              Divider(
                height: 2,
                color: Color(0xFF4036AD),
              ),
              SizedBox(
                height: getheight(context, 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // SizedBox(width: getwidth(context, 20)),
                  GestureDetector(
                    onTap: () {
                      // Share
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.share,
                          size: 24,
                          color: Colors.white,
                        ),
                        Text("Share",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Color(0xFF161A4D),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: getheight(context, 350),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: getheight(context, 24),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Report Issue',
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
                                                  borderRadius:
                                                      BorderRadius.circular(50),
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Issue"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(3),
                                          height: getheight(
                                              context, getheight(context, 128)),
                                          width: getwidth(
                                              context, getwidth(context, 343)),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              color: Color(0xFF161A4D),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: TextField(
                                            expands: true,
                                            maxLines: null,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                hintText:
                                                    "Type you question here...",
                                                hintStyle: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        // submit bug
                                      },
                                      child: BlueButton(title: "Submit")),
                                ],
                              ),
                            );
                          });
                    },
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.reviews,
                            size: 24,
                            color: Colors.white,
                          ),
                          Text("Report issue",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      // about us
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.info,
                          size: 24,
                          color: Colors.white,
                        ),
                        Text("About Us",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: getheight(context, 60),
              ),
              GestureDetector(
                onTap: () {
                  // sign out
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Sign Out",
                      style: TextStyle(
                          color: Color(0xFF21D4FD),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getheight(context, 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
