import 'dart:async';
import 'package:flushbar/flushbar.dart';
import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:design/essential.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapAdder extends StatefulWidget {
  @override
  _MapAdderState createState() => _MapAdderState();
}

class _MapAdderState extends State<MapAdder> {
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  GoogleMapController _controller;
  Circle circle;
  double long;
  double lat;

  void submitpost(postName, postId, postX, postY) async {
    // String postName;
    // String postId;
    // String postX;
    // String postY;
    String URL =
        "https://script.google.com/macros/s/<your Api>/exec?marker_name=$postName&marker_id=$postId&x=$postY&y=$postX";
    try {
      await http.get(
        // URL + "?marker_name=$postName&marker_id=$postId&x=$postY&y=$postX");
        Uri.parse(URL),
      );
    } catch (e) {
      print(e);
    }
  }

  void updateCircle(LocationData newLocalData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.black,
          center: latlng,
          fillColor: Colors.red);
      long = newLocalData.longitude;
      lat = newLocalData.latitude;
    });
  }

  void getCurrentLocation() async {
    try {
      var location = await _locationTracker.getLocation();

      updateCircle(location);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged.listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              new CameraPosition(
                  bearing: 192.8334901395799,
                  target: LatLng(newLocalData.latitude, newLocalData.longitude),
                  tilt: 0,
                  zoom: 18.00)));
          updateCircle(newLocalData);
          print(newLocalData.latitude);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(20.5937, 78.9629),
                    ),

                    circles: Set.from((circle != null) ? [circle] : []),
                    //   onMapCreated: mapCreated,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                  height: proH(80),
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.redAccent,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(proH(20)),
                          child: Column(
                            children: [
                              Text(
                                "Trying to post a pothole at",
                                style: TextStyle(
                                    color: hexToColor("#00587a"),
                                    fontSize: proW(25)),
                              ),
                              SizedBox(height: proH(5)),
                              Text(
                                "$lat , $long",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: hexToColor("#00587a"),
                                    fontSize: proW(25)),
                              ),
                              SizedBox(height: proH(5)),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(proH(30)),
                          child: DefaultButton(
                            text: "continue",
                            press: () {
                              if (lat != null && long != null) {
                                submitpost("marker_$lat$long",
                                    "marker_id_$lat$long", lat, long);
                                Navigator.pop(context);
                                Flushbar(
                                  flushbarPosition: FlushbarPosition.TOP,
                                  title: "Location Added",
                                  message:
                                      "You have posted location at $lat,$long",
                                  duration: Duration(seconds: 3),
                                )..show(context);
                              }
                            },
                            colored: Colors.blueAccent,
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: proH(280)),
          child: FloatingActionButton(
              child: Icon(Icons.location_searching),
              onPressed: () {
                getCurrentLocation();
              }),
        ));
  }
}
