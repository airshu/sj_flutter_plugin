
import 'sj_flutter_plugin_platform_interface.dart';


export 'src/opengl_widget.dart';

class SjFlutterPlugin {
  Future<String?> getPlatformVersion() {
    return SjFlutterPluginPlatform.instance.getPlatformVersion();
  }




}
