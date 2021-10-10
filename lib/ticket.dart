// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:myflutter/mainpage.dart';

// class _Profile extends StatefulWidget {
//   @override
//   Profile createState() => Profile();
// }

class Ticket extends StatelessWidget {
  late final going, from, oneWay, when, who, howMany, perAssist, kindAssist;

  Ticket.hello(
      {required this.going,
      required this.from,
      required this.howMany,
      required this.kindAssist,
      required this.oneWay,
      required this.perAssist,
      required this.when,
      required this.who});

  final number = Random().nextInt(500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(children: [
                  Image.asset(
                    "assets/LOGO.png",
                    height: 90,
                    width: 200,
                  ),
                  Text("Your ticket:",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  Text("#" + '$number', style: TextStyle(fontSize: 28)),
                  Divider(
                    color: Colors.black,
                  ),
                  Expanded(
                      child: ListView(children: [
                    RichText(
                      text: TextSpan(
                          text: 'Going to: ',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: '$going',
                              style: TextStyle(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                          text: 'From: ',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: '$from',
                              style: TextStyle(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                          text: 'One way trip: ',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: '$oneWay',
                              style: TextStyle(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                          text: 'When: ',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: '$when',
                              style: TextStyle(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                          text: 'Names: ',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: '$who',
                              style: TextStyle(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                          text: 'Pax: ',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: '$howMany',
                              style: TextStyle(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                          text: 'Personal assistance?: ',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: '$perAssist',
                              style: TextStyle(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                          text: 'Kind of assistance: ',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: '$kindAssist',
                              style: TextStyle(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Please screenshot/print this as it will serve as your official receipt.",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(height: 12),
                    Center(
                      child: Text(
                        "Thank you for travelling with us! \nPress the back button to go back.",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 10),
                  ]))
                ]))));
  }
}
