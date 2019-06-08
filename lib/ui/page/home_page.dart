import 'package:flutter/material.dart';
import 'package:spajam/ui/page/home_page/index.dart';
import 'package:spajam/ui/widgets/helper.dart';
import 'package:spajam/ui/widgets/round_background.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  Size deviceSize;

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
}
