import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'show_dialog_plugin_method_channel.dart';

abstract class ShowDialogPluginPlatform extends PlatformInterface {
  /// Constructs a ShowDialogPluginPlatform.
  ShowDialogPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static ShowDialogPluginPlatform _instance = MethodChannelShowDialogPlugin();

  /// The default instance of [ShowDialogPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelShowDialogPlugin].
  static ShowDialogPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ShowDialogPluginPlatform] when
  /// they register themselves.
  static set instance(ShowDialogPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
  
   Future<void> showAlertDialog() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
