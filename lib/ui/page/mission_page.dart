import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MissionPage extends StatefulWidget {
  final String title;
  MissionPage({Key key, this.title}) : super(key: key);

  @override
  _MissionPageState createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  LocationData currentLocation;

  // StreamSubscription<LocationData> locationSubscription;

  Location _locationService = new Location();
  String error;

  @override
  void initState() {
    super.initState();

    initPlatformState();
    _locationService.onLocationChanged().listen((LocationData result) async {
      setState(() {
        currentLocation = result;
      });

      print(currentLocation.latitude);
      print(currentLocation.longitude);
    });
  }

  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    if (currentLocation == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Maps Sample App'),
              backgroundColor: Colors.green[700],
            ),
            body: Column(children: [
              Container(
                height: (MediaQuery.of(context).size.height) - 300,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(35.6580339, 139.7016358),
                    zoom: 17.0,
                  ),
                  myLocationEnabled: true,
                  mapType: MapType.hybrid,
                ),
              ),
            ])),
      );
    }
  }

  void initPlatformState() async {
    LocationData myLocation;
    try {
      myLocation = await _locationService.getLocation();
      error = "";
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENITED')
        error = 'Permission denited';
      else if (e.code == 'PERMISSION_DENITED_NEVER_ASK')
        error =
            'Permission denited - please ask the user to enable it from the app settings';
      myLocation = null;
    }
    setState(() {
      currentLocation = myLocation;
    });
  }
}
