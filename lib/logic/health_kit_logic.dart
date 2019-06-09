import 'dart:async';

import 'package:flutter/services.dart';

enum _ActivityType {
  steps,
  cycling,
  walkRun,
  heartRate,
  flights,
  bodyTemperature
}

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
    return await _getActivityData(_ActivityType.bodyTemperature, "degC");
  }

  static Future<double> get getHeartRate async {
    return await _getActivityData(_ActivityType.heartRate, "count/min");
  }

  static Future<int> get getSleepAnalysis async {
    return await _getSleepAnalysis();
  }

  static Future<double> _getActivityData(
      _ActivityType activityType, String units) async {
    var result;

    try {
      result = await _channel.invokeMethod('getActivity',
          {"name": activityType.toString().split(".").last, "units": units});
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
      result = await _channel.invokeMethod('getSleepAnalysis', {});
    } catch (e) {
      return null;
    }

    if (result == null || result.isEmpty) {
      return null;
    }

    return result["value"];
  }
}
