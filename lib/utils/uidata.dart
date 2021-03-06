import 'dart:ui';
import 'package:flutter/material.dart';

class UIData {
  //routes
  // static const String splashRoute = "/Splash";
  static const String loginRoute = "/Login";
  static const String bottomTabRoute = "/BottomTab";
  static const String homeRoute = "/Home";
  static const String memberListRoute = "/memberList";
  static const String missionRoute = "/Mission";

  //strings
  static const String appName = "Mission Impossible";

  //fonts
  static const String quickFont = "Quicksand";

  //colors
  static List<Color> kitGradients = [
    // new Color.fromRGBO(103, 218, 255, 1.0),
    // new Color.fromRGBO(3, 169, 244, 1.0),
    // new Color.fromRGBO(0, 122, 193, 1.0),
    Colors.blueGrey.shade800,
    Colors.black87,
  ];
}
