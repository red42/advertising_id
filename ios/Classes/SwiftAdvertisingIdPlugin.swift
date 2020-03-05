import Flutter
import UIKit
import AdSupport

public class SwiftAdvertisingIdPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "advertising_id", binaryMessenger: registrar.messenger())
    let instance = SwiftAdvertisingIdPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getAdvertisingId":
        var idfaString: String!
        let manager = ASIdentifierManager.shared()

        let ret:[String:Any] = ["advertising_id": manager.advertisingIdentifier.uuidString, "tracking_allowed":manager.isAdvertisingTrackingEnabled]

        result(ret)
    default:
        result(nil)
    }
  }
}
