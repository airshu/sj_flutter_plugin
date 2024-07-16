import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'sj_flutter_plugin_method_channel.dart';

abstract class SjFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a SjFlutterPluginPlatform.
  SjFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static SjFlutterPluginPlatform _instance = MethodChannelSjFlutterPlugin();

  /// The default instance of [SjFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelSjFlutterPlugin].
  static SjFlutterPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SjFlutterPluginPlatform] when
  /// they register themselves.
  static set instance(SjFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int> initialize(int width, int height) async {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  Future<void> dispose() {
    throw UnimplementedError('dispose() has not been implemented.');
  }

  bool get isInitialized => false;
  int? textureId;
}
