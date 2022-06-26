import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets.dart';

class askQuestion extends StatefulWidget {
  const askQuestion({Key? key}) : super(key: key);

  @override
  State<askQuestion> createState() => _askQuestionState();
}

class _askQuestionState extends State<askQuestion> {
  var Questions = [
    "Mostly asked questions!",
    "When will I find my true love?",
    "Will a be getting a government job in my life?"
  ];
  String dropdownValue = "Mostly asked questions!";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff21D4FD),
          onPressed: () {},
          child: CircleAvatar(
            radius: getheight(context, 26.5),
            backgroundColor: bgColor,
            child: Padding(
              padding: EdgeInsets.only(left: getwidth(context, 6)),
              child: Icon(
                Icons.send_outlined,
                size: 30,
                color: Color(0xff21D4FD),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: bgColor,
          elevation: 1.0,
          title: Text(
            "Ask Question ?",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: getheight(context, 10),
            ),
            Form(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getwidth(context, 12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Question",
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              "0/100",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getheight(context, 14),
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          maxLines: 8,
                          decoration: InputDecoration(
                            hintText: "Enter your question here!",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xff21D4FD), width: 1.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff21D4FD), width: 1.0),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getheight(context, 12),
                  ),
                  Text("OR"),
                  SizedBox(
                    height: getheight(context, 12),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getwidth(context, 12)),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getwidth(context, 10),
                          vertical: getheight(context, 5)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff21D4FD)),
                          borderRadius: BorderRadius.circular(8)),
                      child: DropdownButton<String>(
                        menuMaxHeight: 460,
                        dropdownColor: bgColor,
                        isExpanded: true,
                        value: dropdownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                        underline: Container(
                          height: 0.0,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: Questions.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getheight(context, 18),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getwidth(context, 12)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: getheight(context, 16),
                              horizontal: getwidth(context, 15)),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff21D4FD)),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "Birth Time - 12:35",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.5),
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff21D4FD)),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "DOB - 16/01/2001",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.5),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getheight(context, 18),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getwidth(context, 12)),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getwidth(context, 15),
                          vertical: getheight(context, 16)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff21D4FD)),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Text(
                            "Birth Place - shimla, HP, 171001",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getheight(context, 18),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getwidth(context, 12)),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getwidth(context, 15),
                          vertical: getheight(context, 16)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff21D4FD)),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Text(
                            "Astrologer: Select Astrologer!",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
