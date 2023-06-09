import Flutter
import UIKit

public class ShowDialogPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "show_dialog_plugin", binaryMessenger: registrar.messenger())
    let instance = ShowDialogPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

   if (call.method == "getPlatformVersion") {
             result("iOS " + UIDevice.current.systemVersion)
         }
         else if (call.method == "showAlertDialog") {
             DispatchQueue.main.async {
                 let alert = UIAlertController(title: "Alert", message: "Hi, My name is Augustine", preferredStyle: .alert);
                 alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
                 UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil);
             }
         }
   }
   // result("iOS " + UIDevice.current.systemVersion)
  }

