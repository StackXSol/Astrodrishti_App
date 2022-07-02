import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Color bgColor = const Color(0xff0C153A);
Color bottomSheetColor = Color(0xff161A4D);

double getheight(context, value) {
  return MediaQuery.of(context).size.height * (value / 844);
}

double getwidth(context, value) {
  return MediaQuery.of(context).size.width * (value / 375);
}

final Shader blue_text_grad = LinearGradient(
  colors: <Color>[Color(0xff21D4FD), Color(0xff6D80FE)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

final Shader orange_text_grad = LinearGradient(
  colors: <Color>[
    Color.fromARGB(255, 253, 191, 33),
    Color.fromARGB(255, 208, 90, 11)
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

LinearGradient blue_grade =
    LinearGradient(colors: [Color(0xff21D4FD), Color(0xff6D80FE)]);

class BlueButton extends StatelessWidget {
  BlueButton({required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: getwidth(context, 15), right: getwidth(context, 15)),
      height: getheight(context, 56),
      width: getwidth(context, 343),
      decoration: BoxDecoration(
          gradient: blue_grade, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
        ),
      ),
    );
  }
}

//loc picker

var _coordinates = [];

Future picloc(context) async {
  List<Widget> locs = [];
  TextEditingController loc = TextEditingController();

  Future<void> fetchlocs() async {
    locs = [];
    http.Response res = await http.get(Uri.parse(
        "https://us1.locationiq.com/v1/search.php?key=pk.40f17642118bbc50df447bcca8130c31&q=${loc.text.toString()}&format=json"));
    print(jsonDecode(res.body).runtimeType);
    for (var i in jsonDecode(res.body)) {
      locs.add(LocBox(
        lat: i["lat"],
        lon: i["lon"],
        name: i["display_name"],
      ));
    }
  }

  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return Dialog(
            backgroundColor: bgColor,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff21D4FD)),
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: LocTxtfld(txt: "Location", contro: loc)),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            await fetchlocs();
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: bgColor,
                              border: Border.all(color: Color(0xff21D4FD)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Icon(
                              Icons.search,
                              size: 38,
                              color: Color(0xff21D4FD),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.55,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: locs,
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
  print(_coordinates);
  return _coordinates;
}

class LocBox extends StatelessWidget {
  LocBox({
    required this.lat,
    required this.lon,
    required this.name,
  });
  String lat, lon, name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        _coordinates = [];
        _coordinates.add(lat);
        _coordinates.add(lon);
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff21D4FD)),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 16),
        )),
      ),
    );
  }
}

class LocTxtfld extends StatelessWidget {
  LocTxtfld({required this.txt, required this.contro});

  String txt;
  TextEditingController contro;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: contro,
      autocorrect: true,
      style: TextStyle(color: Colors.white),
      cursorColor: Color(0xff21D4FD),
      decoration: InputDecoration(
        labelText: txt,
        labelStyle: TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Color(0xff21D4FD)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Color(0xff21D4FD)),
        ),
      ),
    );
  }
}
