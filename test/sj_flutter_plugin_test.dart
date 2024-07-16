import 'package:flutter_test/flutter_test.dart';
import 'package:sj_flutter_plugin/sj_flutter_plugin.dart';
import 'package:sj_flutter_plugin/sj_flutter_plugin_platform_interface.dart';
import 'package:sj_flutter_plugin/sj_flutter_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSjFlutterPluginPlatform
    with MockPlatformInterfaceMixin
    implements SjFlutterPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  int? textureId;

  @override
  Future<void> dispose() {
    throw UnimplementedError();
  }

  @override
  Future<int> initialize(int width, int height) {
    throw UnimplementedError();
  }

  @override
  // TODO: implement isInitialized
  bool get isInitialized => throw UnimplementedError();
}

void main() {
  final SjFlutterPluginPlatform initialPlatform = SjFlutterPluginPlatform.instance;

  test('$MethodChannelSjFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSjFlutterPlugin>());
  });

  test('getPlatformVersion', () async {
    SjFlutterPlugin sjFlutterPlugin = SjFlutterPlugin();
    MockSjFlutterPluginPlatform fakePlatform = MockSjFlutterPluginPlatform();
    SjFlutterPluginPlatform.instance = fakePlatform;

    expect(await sjFlutterPlugin.getPlatformVersion(), '42');
  });
}
