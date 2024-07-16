package com.sj.sj_flutter_plugin;

import android.graphics.SurfaceTexture;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.view.TextureRegistry;

/** SjFlutterPlugin */
public class SjFlutterPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  TextureRegistry textureRegistry;
  TextureRegistry.SurfaceTextureEntry surfaceEntry;
  ExternalGLThread externalGLThread;


  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "sj_flutter_plugin");
    channel.setMethodCallHandler(this);

    textureRegistry = flutterPluginBinding.getTextureRegistry();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if(call.method.equals("create")) {
      int width = call.argument("width");
      int height = call.argument("height");

      surfaceEntry = textureRegistry.createSurfaceTexture();
      SurfaceTexture surfaceTexture = surfaceEntry.surfaceTexture();
      surfaceTexture.setDefaultBufferSize(width, height);
      externalGLThread = new ExternalGLThread(surfaceTexture, new SimpleRenderer());
      externalGLThread.start();

      result.success(surfaceEntry.id());
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}



