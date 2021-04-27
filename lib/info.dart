import 'package:design/essential.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: ListView(physics: BouncingScrollPhysics(), children: [
          Padding(
              padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
              child: Image(image: AssetImage("assets/images/logo.png"))),
          Container(
              child: Text("Version 2.0.10",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: HexColor("45526c"),
                      // letterSpacing: ,
                      // fontWeight: FontWeight.w600,
                      fontSize: proW(20),
                      fontFamily: "Teko"),
                  textAlign: TextAlign.center)),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
                "This app helps the user know about the location of the potholes on the road so that he could choose a path with less number of  potholes. Through this app the user can also alert other users by adding the location of the potholes near the user. Hope this app will be useful to all the riders out there.",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: HexColor("45526c"),
                    // letterSpacing: ,
                    // fontWeight: FontWeight.w600,
                    fontSize: proW(30),
                    fontFamily: "Teko"),
                textAlign: TextAlign.justify),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Created by ",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: HexColor("45526c"),
                      // letterSpacing: 10,
                      // fontWeight: FontWeight.w600,
                      fontSize: proW(20),
                      fontFamily: "Teko")),
              Text("Grigary C Antony",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: HexColor("45526c"),
                      // letterSpacing: 10,
                      fontWeight: FontWeight.w600,
                      fontSize: proW(25),
                      fontFamily: "Teko")),
              Text("Fabius S Thottappilly",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: HexColor("45526c"),
                      // letterSpacing: 10,
                      fontWeight: FontWeight.w600,
                      fontSize: proW(25),
                      fontFamily: "Teko")),
              Text("Emmanuel Davis Biju",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: HexColor("45526c"),
                      // letterSpacing: 10,
                      fontWeight: FontWeight.w600,
                      fontSize: proW(25),
                      fontFamily: "Teko")),
              Text("Disan Davis",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: HexColor("45526c"),
                      // letterSpacing: 10,
                      fontWeight: FontWeight.w600,
                      fontSize: proW(25),
                      fontFamily: "Teko")),
            ],
          ),
        ])));
  }
}
