import 'package:flutter_test/flutter_test.dart';
import 'package:show_dialog_plugin/show_dialog_plugin.dart';
import 'package:show_dialog_plugin/show_dialog_plugin_platform_interface.dart';
import 'package:show_dialog_plugin/show_dialog_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockShowDialogPluginPlatform
    with MockPlatformInterfaceMixin
    implements ShowDialogPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
  
  @override
  Future<void> showAlertDialog() {
    // TODO: implement showAlertDialog
    throw UnimplementedError();
  }
}

void main() {
  final ShowDialogPluginPlatform initialPlatform = ShowDialogPluginPlatform.instance;

  test('$MethodChannelShowDialogPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelShowDialogPlugin>());
  });

  test('getPlatformVersion', () async {
    ShowDialogPlugin showDialogPlugin = ShowDialogPlugin();
    MockShowDialogPluginPlatform fakePlatform = MockShowDialogPluginPlatform();
    ShowDialogPluginPlatform.instance = fakePlatform;

    expect(await showDialogPlugin.getPlatformVersion(), '42');
  });
}
