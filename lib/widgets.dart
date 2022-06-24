import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
