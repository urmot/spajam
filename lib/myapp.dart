import 'package:flutter/material.dart';
import 'package:spajam/ui/page/splash_page.dart';
import 'package:spajam/ui/page/home_page.dart';
import 'package:spajam/utils/uidata.dart';

class MyApp extends StatelessWidget {

  final materialApp = MaterialApp(
    title: UIData.appName,
    theme: ThemeData(
      primaryColor: Colors.black,
      fontFamily: UIData.quickFont,
      primarySwatch: Colors.amber,
    ),
    // @todo 本番の時にコメントアウトを外す
    // debugShowCheckedModeBanner: false,
    // showPerformanceOverlay: false,
    home: SplashPage(), // この画面からスタートしないといけないわけではないが、静的遷移の書き方を示すためにあえてhomeの前に挟んだ
    routes: <String, WidgetBuilder>{
      UIData.homeRoute: (BuildContext context) => HomePage(title: 'Flutter Demo Home Page'),
    },
  );

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
