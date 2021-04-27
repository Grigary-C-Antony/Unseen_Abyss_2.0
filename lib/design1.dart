import 'package:design/info.dart';
import 'package:design/views/map_adder.dart';
import 'package:design/views/map_view.dart';
import 'package:flutter/material.dart';

import 'essential.dart';

class Design1 extends StatefulWidget {
  @override
  _Design1State createState() => _Design1State();
}

Color colorGiven = Colors.red;

class _Design1State extends State<Design1> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: HexColor("ffc288"),
        body: Container(
          child: Container(
            child: CustomPaint(
                painter: CurvePainter1(),
                child: Column(children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("UNSEEN ",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: HexColor("5aa897"),
                                    letterSpacing: 10,
                                    fontWeight: FontWeight.w600,
                                    fontSize: proW(30),
                                    fontFamily: "Teko")),
                            Text("ABYSS",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: HexColor("45526c"),
                                    letterSpacing: 10,
                                    fontWeight: FontWeight.w600,
                                    fontSize: proW(30),
                                    fontFamily: "Teko"))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 6,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Image(
                              image: AssetImage("assets/images/nav1.png")),
                        ),
                      )),
                  Expanded(
                      flex: 11,
                      child: Container(
                          child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Row(children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 60, 20, 40),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Maper_View()),
                                        );
                                      },
                                      child: Container(
                                          width: 20,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: HexColor("45526c"),
                                                  width: 1.50),
                                              color: HexColor("f8f5f1"),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              )),
                                          child: Column(children: [
                                            SizedBox(height: proH(20)),
                                            CircleAvatar(
                                              backgroundColor:
                                                  HexColor("45526c"),
                                              radius: 20,
                                              child: Icon(Icons.map_outlined),
                                            ),
                                            SizedBox(height: proH(30)),
                                            Text("FIND POTHOLE",
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: HexColor("02475e"),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: proW(25),
                                                    fontFamily: "Teko")),
                                          ])),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 60, 20, 40),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MapAdder()),
                                        );
                                      },
                                      child: Container(
                                          width: 20,
                                          decoration: BoxDecoration(
                                              color: HexColor("f8f5f1"),
                                              border: Border.all(
                                                  color: HexColor("45526c"),
                                                  width: 1.50),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: Column(children: [
                                            SizedBox(height: proH(20)),
                                            CircleAvatar(
                                              backgroundColor:
                                                  HexColor("45526c"),
                                              radius: 20,
                                              child: Icon(Icons.pin_drop),
                                            ),
                                            SizedBox(height: proH(30)),
                                            Text("SPOT POTHOLE",
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: HexColor("02475e"),
                                                    fontSize: proW(25),
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Teko")),
                                          ])),
                                    ),
                                  ),
                                ),
                              ])),
                          Expanded(
                              flex: 1,
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => InfoPage()),
                                      );
                                    },
                                    child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: HexColor("f8f5f1"),
                                            border: Border.all(
                                                color: HexColor("45526c"),
                                                width: 1.50),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: Column(children: [
                                          SizedBox(height: proH(20)),
                                          CircleAvatar(
                                            backgroundColor: HexColor("45526c"),
                                            radius: 15,
                                            child: Icon(
                                                Icons.info_outline_rounded),
                                          ),
                                          SizedBox(height: proH(5)),
                                          Text("ABOUT US",
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: HexColor("45526c"),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: proW(30),
                                                  fontFamily: "Teko")),
                                        ])),
                                  )))
                        ],
                      )))
                ])),
          ),
        ));
  }
}
