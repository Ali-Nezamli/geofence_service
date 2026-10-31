import Flutter
import UIKit

public class GeofenceServicePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let instance = GeofenceServicePlugin()
    instance.initServices()
    instance.initChannels(registrar.messenger())
  }

  private func initServices() {
    // initServices
  }

  private func initChannels(_ messenger: FlutterBinaryMessenger) {
    // initChannels
  }
}
