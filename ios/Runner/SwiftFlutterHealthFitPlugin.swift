//
//  SwiftFlutterHealthFitPlugin.swift
//  Runner
//
//  Created by 本山　貴大 on 2019/06/09.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import Flutter
import UIKit
import HealthKit


public class SwiftFlutterHealthFitPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_health_fit", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterHealthFitPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "requestAuthorization"{
            HealthkitReader.sharedInstance.requestHealthAuthorization() { success in
                result(success)
            }
        }
        if call.method == "getActivity"{
            self.getActivity(call, result: result)
        }

        if call.method == "getSleepAnalysis" {
            self.getSleepAnalysis(call, result: result)
        }
    }
 
    func getActivity(_ call: FlutterMethodCall, result: @escaping FlutterResult){
        guard let params = call.arguments as? Dictionary<String,String> else {
            result(nil)
            return
        }
        
        guard let metric = params["name"] else {
            result(nil)
            return
        }
        
        guard let units = params["units"] else {
            result(nil)
            return
        }
        
        
        var type: HKQuantityTypeIdentifier;
        switch metric {
//        case "steps":
//            type = HKQuantityTypeIdentifier.stepCount
//        case "cycling":
//            type = HKQuantityTypeIdentifier.distanceCycling
//        case "walkRun":
//            type = HKQuantityTypeIdentifier.distanceWalkingRunning
//        case "flights":
//            type = HKQuantityTypeIdentifier.flightsClimbed
        case "heartRate":
            type = HKQuantityTypeIdentifier.heartRate
        case "bodyTemperature":
            type = HKQuantityTypeIdentifier.bodyTemperature
        default:
            result(["errorCode": "4040", "error": "unsupported type"])
            return;
        }
        
        HealthkitReader.sharedInstance.requestHealthAuthorization() { success in
            HealthkitReader.sharedInstance.getHealthDataValue(type: type, strUnitType: units) { results in
                if let data = results {
                    var value: Double = 0
                    if data.count > 0
                    {
                        for result in data
                        {
                            value += Double(result["value"]as! String)!
                        }
                        let dic:Dictionary<String, Any> = ["name": metric, "value": value, "units": units]
                        result(dic)
                        return
                    }
                }
                result([])
            }
        }
    }
    
    func getSleepAnalysis(_ call: FlutterMethodCall, result: @escaping FlutterResult){
        HealthkitReader.sharedInstance.getSleepAnalysis() { results in
            if let data = results {
                result(data)
                return
            } else {
                result([])
            }
        }
    }

}

extension Date {
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: startDay)!
    }
    
    var startDay: Date {
        return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
    }
}
