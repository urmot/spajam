import 'package:flutter/material.dart';
import 'package:spajam/logic/health_kit_logic.dart';
//import 'package:flutter/services.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool _isAuthorized = false;
  String _activityData;

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {}

  _authorizeHealthOrFit() async {
    bool isAuthorized = await FlutterHealthFit.authorize;
    setState(() {
      _isAuthorized = isAuthorized;
    });
  }

  // _getActivityHealthData() async {
  //   var bodyTemperature = await FlutterHealthFit.getBodyTemperature;
  //   var sleepAnalysis = await FlutterHealthFit.getSleepAnalysis;
  //   setState(() {
  //     _activityData =
  //         "bodyTemperature: $bodyTemperature\n sleepAnalysis: $sleepAnalysis";
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Authorized: $_isAuthorized\n'),
              RaisedButton(
                  child: Text("Authorize Health"),
                  onPressed: () {
                    _authorizeHealthOrFit();
                  }),
              // RaisedButton(
              //     child: Text("Get Activity Data"),
              //     onPressed: _getActivityHealthData),
              Text('\n$_activityData\n'),
            ],
          ),
        ),
      ),
    );
  }
}
