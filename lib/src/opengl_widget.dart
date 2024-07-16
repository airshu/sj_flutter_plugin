import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sj_flutter_plugin/sj_flutter_plugin_platform_interface.dart';

import '../sj_flutter_plugin.dart';

// ignore: must_be_immutable
class OpenGLWidget extends StatefulWidget {
  OpenGLWidget({Key? key, this.width = 200, this.height = 200}) : super(key: key);

  var width;
  var height;

  @override
  State<StatefulWidget> createState() {
    return _TextureState();
  }
}

class _TextureState extends State<OpenGLWidget> {
  @override
  void initState() {
    super.initState();
    initPlugin();
  }

  void initPlugin() async {
    await SjFlutterPluginPlatform.instance.initialize(widget.width, widget.height);
    setState(() {});
  }

  @override
  Future<void> dispose() async {
    SjFlutterPluginPlatform.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width.toDouble(),
        height: widget.height.toDouble(),
        child: SjFlutterPluginPlatform.instance.isInitialized
            ? Texture(textureId: SjFlutterPluginPlatform.instance.textureId!)
            : Container(color: Colors.blue));
  }
}
