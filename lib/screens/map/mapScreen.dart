import 'dart:convert';

import 'package:flash_chat/screens/map/helper/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

void main() => runApp(MapScreen());

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  BitmapDescriptor pinLocationIcon;
  var position;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  String searchCity;

  @override
  void initState() {
    super.initState();
    setCustomMapPin();
  }

  void setCustomMapPin() async {
    Location location = Location();

    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/destination_map_marker.png');

    var tempLocation = await location.getCurrentLocation();
    setState(() {
      position = tempLocation;
    });
  }

  searchLocationApi (String search) async {
    var url = 'https://maps.googleapis.com/maps/api/geocode/json?address=';
    url = search != null ? (url += search += '+CA&key=AIzaSyDX6WPGLg5FpI_36fTQBIAtGUoFpHAiPdk') : (url += 'surat+CA&key=AIzaSyDX6WPGLg5FpI_36fTQBIAtGUoFpHAiPdk');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print(response);
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    LatLng pinPosition = LatLng(position != null ? position.latitude : 19.0760,
        position != null ? position.longitude : 72.8777);

    CameraPosition initialLocation =
        CameraPosition(zoom: 16, bearing: 30, target: pinPosition);

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.red,
        title: const Text('Google Map'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                right: 20.0, left: 20.0, bottom: 10.0, top: 10.0),
            child: TextField(
              onChanged: (newValue) {
                setState(() {
                  searchLocationApi(newValue);
                  searchCity = newValue;
                });
              },
              decoration: kMapSearchTextFiledDecorationStyle
            ),
          ),
          Expanded(
            child: GoogleMap(
              myLocationEnabled: true,
              compassEnabled: true,
              markers: _markers,
              initialCameraPosition: initialLocation,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                setState(() {
                  _markers.add(Marker(
                      markerId: MarkerId('<MARKER_ID>'),
                      position: pinPosition,
                      icon: pinLocationIcon));
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
