import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'show_dialog_plugin_platform_interface.dart';

/// An implementation of [ShowDialogPluginPlatform] that uses method channels.
class MethodChannelShowDialogPlugin extends ShowDialogPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('show_dialog_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> showAlertDialog() async {
    await methodChannel.invokeMethod('showAlertDialog');
  }
 
}
