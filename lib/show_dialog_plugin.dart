
import 'package:show_dialog_plugin/show_dialog_plugin_method_channel.dart';

import 'show_dialog_plugin_platform_interface.dart';

class ShowDialogPlugin {
  MethodChannelShowDialogPlugin methodChannelPluginShowdialod = MethodChannelShowDialogPlugin();

  Future<String?> getPlatformVersion() {
    return ShowDialogPluginPlatform.instance.getPlatformVersion();
  }

  Future<void> showDialog () {
    return methodChannelPluginShowdialod.showAleartDialog();
  }
}
