import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'sj_flutter_plugin_platform_interface.dart';

/// An implementation of [SjFlutterPluginPlatform] that uses method channels.
class MethodChannelSjFlutterPlugin extends SjFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('sj_flutter_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }


  bool get isInitialized => textureId != null;

  Future<int> initialize(int width, int height) async {
    textureId = await methodChannel.invokeMethod('create', {
      'width': width,
      'height': height,
    });
    return textureId!;
  }

  Future<Null> dispose() => methodChannel.invokeMethod('dispose', {'textureId': textureId});

}
