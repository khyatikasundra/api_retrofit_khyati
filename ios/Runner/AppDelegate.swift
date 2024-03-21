import UIKit
import Flutter

let kChannel = "app"
let kMethodFlavor = "getFlavor"
let kMethodDeviceId = "getDeviceID"

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

     guard let controller = self.window.rootViewController as? FlutterViewController else { return true }
    let flavorChannel = FlutterMethodChannel(name: kChannel, binaryMessenger: controller as! FlutterBinaryMessenger)
    flavorChannel.setMethodCallHandler { (call, result) in
        if call.method == kMethodFlavor {
            let flavor = Bundle.main.object(forInfoDictionaryKey: "Flavor") as! String
            result(flavor)
        } else if call.method == kMethodDeviceId {
            let deviceId = UIDevice.current.identifierForVendor?.uuidString ?? ""
            result(deviceId)
        }
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
