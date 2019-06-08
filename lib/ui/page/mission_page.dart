import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MissionPage extends StatefulWidget {
  MissionPage({Key key}) : super(key: key);

  @override
  _MissionPageState createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  LocationData currentLocation;
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
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void _onMapCreated(GoogleMapController controller) {
    // _controller.complete(controller);
    setState(() {
      Marker marker = Marker(
        markerId: MarkerId('111'),
        position: LatLng(35.6580339, 139.7016358),
      );
      markers[MarkerId('111')] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentLocation == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height) - 183,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(35.6580339, 139.7016358),
                  zoom: 17.0,
                ),
                myLocationEnabled: true,
                mapType: MapType.hybrid,
                markers: markers.values.toSet(),
              ),
            ),
          ],
        ),
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
