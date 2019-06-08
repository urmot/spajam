import 'dart:async';

import 'package:flutter/services.dart';

class FlutterHealthFit {
  static const MethodChannel _channel =
      const MethodChannel('flutter_health_fit');

  // static Future<String> get platformVersion async {
  //   final String version = await _channel.invokeMethod('getPlatformVersion');
  //   return version;
  // }

  static Future<bool> get authorize async {
    return await _channel.invokeMethod('requestAuthorization');
  }

  static Future<double> get getBodyTemperature async {
    return await _getTemperatureData();
  }

  static Future<int> get getSleepAnalysis async {
    return await _getSleepAnalysis();
  }

  static Future<double> _getTemperatureData() async {
    var result;

    try {
      result = await _channel.invokeMethod('getTemperature', {});
    } catch (e) {
      print(e.toString());
      return null;
    }

    if (result == null || result.isEmpty) {
      return null;
    }

    return result["value"];
  }

  static Future<int> _getSleepAnalysis() async {
    var result;

    try {
      result = await _channel.invokeMethod('getAnalysis', {});
    } catch (e) {
      print(e.toString());
      return null;
    }

    if (result == null || result.isEmpty) {
      return null;
    }

    return result["value"];
  }
}
