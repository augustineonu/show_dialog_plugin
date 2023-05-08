import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:show_dialog_plugin/show_dialog_plugin_method_channel.dart';

void main() {
  MethodChannelShowDialogPlugin platform = MethodChannelShowDialogPlugin();
  const MethodChannel channel = MethodChannel('show_dialog_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
