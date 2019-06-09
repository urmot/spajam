import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:spajam/ui/page/home_page/index.dart';
import 'package:spajam/ui/widgets/helper.dart';
import 'package:spajam/logic/health_kit_logic.dart';
import 'package:http/http.dart' as http;
import 'package:spajam/services/firestore.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  Size deviceSize;
  FirebaseFirestoreService db = new FirebaseFirestoreService();
  bool _isAuthorized;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget allCards(BuildContext context) => SingleChildScrollView(
          child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          space(height: 32),
          countdownCard(),
          space(height: 32),
          Row(children: <Widget>[
            space(width: 16),
            Text(
              "やばそうなメンバー",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ]),
          storyMembersCard(deviceSize),
          space(height: 16),
          Row(children: <Widget>[
            space(width: 16),
            Text(
              "概要",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ]),
          // space(height: 4),
          projectOverviewCard(),
        ],
      ));
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Stack(fit: StackFit.expand, children: <Widget>[
      // RoundBackground(
      //   backgroundColor: Colors.white,
      // ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: allCards(context),
      ),
    ]);
  }

  @override
  void _initState() {
    setState(() {
      _isAuthorized = false;
    });
    _setInitializePercent();
  }

  _setInitializePercent() async {
    await _authorizeHealthOrFit();
    final data = await _getHealthData();
    final url =
        "https://us-central1-spajam-lev.cloudfunctions.net/predict_attend";
    print(data);
    final response = await http.post(url,
        body: json.encode({
          "bodyTemperature": data[0],
          "heartRate": data[1],
          "sleepAnalysis": data[2]
        }),
        headers: {"Content-Type": "application/json"});
    await db.updateMember({
      "id": "wmfjCb5quEqb8gVFOMAW",
      "participationRate": json.decode(response.body)["percentage"]
    });
  }

  _authorizeHealthOrFit() async {
    bool isAuthorized = await FlutterHealthFit.authorize;
    setState(() {
      _isAuthorized = isAuthorized;
    });
  }

  Future<List> _getHealthData() async {
    var bodyTemperature = await FlutterHealthFit.getBodyTemperature;
    var heartRate = await FlutterHealthFit.getHeartRate;
    var sleepAnalysis = await FlutterHealthFit.getSleepAnalysis;
    return [bodyTemperature, heartRate, sleepAnalysis];
  }
}
