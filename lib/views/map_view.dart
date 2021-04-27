import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:design/essential.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:design/model/gsheetmodel.dart';
import 'package:http/http.dart' as http;

import 'dart:convert' as convert;

import 'package:location/location.dart';

// ignore: camel_case_types
class Maper_View extends StatefulWidget {
  @override
  _Maper_ViewState createState() => _Maper_ViewState();
}

// ignore: camel_case_types
class _Maper_ViewState extends State<Maper_View> {
  List gshetMarker = [];
  List<Marker> allMarker = [];
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  GoogleMapController _controller;
  Circle circle;

  getlocationfromSheet(Uint8List imageData) async {
    var raw = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbxDPzsgvKfkSpAO4m0WN8S-JkWcAiYOuknPJ4qpg0OipyfvADwrSMAA/exec"));
    var jsonmarker = convert.jsonDecode(raw.body);

    gshetMarker = jsonmarker.map((json) => MarkerModel.fromJson(json)).toList();

    jsonmarker.forEach((element) {
      allMarker.add(Marker(
          markerId: MarkerId(element["marker_id"]),
          icon: BitmapDescriptor.fromBytes(imageData),
          anchor: Offset(0.5, 0.5),
          position: LatLng(element["y"], element["x"]),
          draggable: false));

      //   print(element["x"]);
    });
    print("finished");
  }

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/pothole.png");
    return byteData.buffer.asUint8List();
  }

  void updateCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.black,
          center: latlng,
          fillColor: Colors.red);
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateCircle(location, imageData);

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
          updateCircle(newLocalData, imageData);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  void imageVaruthanulla() async {
    Uint8List imageData = await getMarker();
    getlocationfromSheet(imageData);
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    imageVaruthanulla();
    // print(allMarker);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.refresh),
      //       onPressed: () {},
      //     ),
      //   ],
      //   title: Text("maps"),
      // ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .85,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: LatLng(10.8505, 76.2711)
                          // 20.5937, 78.9629),
                          ),
                  markers: Set.from(allMarker),

                  circles: Set.from((circle != null) ? [circle] : []),
                  //   onMapCreated: mapCreated,
                ),
              ),

              // Padding(
              //   padding: EdgeInsets.only(
              //       top: MediaQuery.of(context).size.height -
              //           MediaQuery.of(context).size.height / 5),
              //   child: FloatingActionButton(
              //     onPressed: () {
              //       setState(() {
              //         imageVaruthanulla();

              //         print(allMarker);
              //       });
              //     },
              //     child: Icon(Icons.refresh_outlined),
              //   ),
              // )
            ],
          ),
          Container(
            padding: EdgeInsets.all(proW(16)),
            margin: EdgeInsets.only(top: proH(15)),
            child: DefaultButton(
              press: () {
                setState(() {
                  imageVaruthanulla();
                  getCurrentLocation();
                  print(allMarker);
                });
              },
              colored: HexColor("45526c"),
              text: "Refresh",
            ),
          )
        ],
      ),
      // floatingActionButton: Padding(
      //   padding: EdgeInsets.only(bottom: proH(90.0)),
      //   child: FloatingActionButton(
      //       child: Icon(Icons.location_searching),
      //       onPressed: () {
      //         getCurrentLocation();
      //       }),
      // ),
    );
  }
}
