//
//  AppDelegate.swift
//  Runner
//
//  Created by 本山　貴大 on 2019/06/09.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit
import Flutter
import GoogleMaps

enum ChannelName {
    static let battery = "samples.flutter.io/battery"
    static let charging = "samples.flutter.io/charging"
}

enum BatteryState {
    static let charging = "charging"
    static let discharging = "discharging"
}

enum MyFlutterErrorCode {
    static let unavailable = "UNAVAILABLE"
}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

    let plugin = SwiftFlutterHealthFitPlugin()

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
            let batteryChannel = FlutterMethodChannel(name: "flutter_health_fit",
                                                    binaryMessenger: controller)
            batteryChannel.setMethodCallHandler({
                (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                self.plugin.handle(call, result: result)
            })

            GMSServices.provideAPIKey("")
            GeneratedPluginRegistrant.register(with: self)
            return super.application(application, didFinishLaunchingWithOptions: launchOptions)
        }
}
