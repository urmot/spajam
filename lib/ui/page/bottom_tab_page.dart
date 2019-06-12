import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:spajam/ui/page/home_page.dart';
import 'package:spajam/ui/page/member_list/member_list_page.dart';
import 'package:spajam/ui/page/mission_page.dart';
import 'package:spajam/logic/health_kit_logic.dart';
import 'package:http/http.dart' as http;
import 'package:spajam/services/firestore.dart';

class BottomTabPage extends StatefulWidget {
  BottomTabPage({Key key, this.projectId}) : super(key: key);
  final int projectId;

  @override
  _BottomTabPageState createState() => new _BottomTabPageState();
}

class _BottomTabPageState extends State<BottomTabPage> {
  PageController _pageController;
  var _page = 0;
  FirebaseFirestoreService db = new FirebaseFirestoreService();
  bool _isAuthorized;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('深センに行く'),
      ),
      body: PageView(
        children: <Widget>[
          HomePage(),
          MemerListPage(),
          MissionPage(),
          // Container(
          //   color: Colors.orangeAccent,
          // ),
          // Container(
          //   color: Colors.redAccent,
          // ),
          // Container(
          //   color: Colors.blueAccent,
          // ),
        ],
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Member"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text("Mission"),
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  ///
  /// Bottom Navigation tap listener
  ///
  void navigationTapped(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    setState(() {
      _isAuthorized = false;
    });
    _setInitializePercent();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
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
