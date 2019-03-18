import 'package:flutter/services.dart';
import 'package:flutter_ijkplayer/src/video_info.dart';

import './ijkplayer.dart';
import 'dart:async';

class IJKEventChannel {
  int get textureId => controller?.textureId;

  IjkMediaController controller;

  IJKEventChannel(this.controller);

  MethodChannel channel;

  String get channelName => "top.kikt/ijkplayer/event/$textureId";

  Completer _prepareCompleter;

  Future<void> init() async {
    channel = MethodChannel(channelName);
    channel.setMethodCallHandler(handler);
  }

  void dispose() {
    channel.setMethodCallHandler(null);
    controller = null;
  }

  Future<dynamic> handler(MethodCall call) async {
    switch (call.method) {
      case "finish": // 播放完毕
        // var index = call.arguments["type"];
        // var type = FinishType.values[index];
        onPlayFinish(getInfo(call));
        break;
      case "playStateChange":
        onPlayStateChange(getInfo(call));
        break;
      case "prepare":
        onPrepare(getInfo(call));
        break;
      default:
        return MissingPluginException(
          "$channelName ${call.method} not implement",
        );
    }
    return true;
  }

  VideoInfo getInfo(MethodCall call) {
    var map = call.arguments.cast<String, dynamic>();
    return VideoInfo.fromMap(map);
  }

  void onPlayFinish(VideoInfo info) {
    controller.isPlaying = info.isPlaying;
  }

  void onPlayStateChange(VideoInfo info) {
    controller.isPlaying = info.isPlaying;
  }

  void onPrepare(VideoInfo info) {
    controller.isPlaying = info.isPlaying;
    _prepareCompleter?.complete();
    _prepareCompleter = null;
  }

  Future<void> waitPrepare() {
    _prepareCompleter = Completer();
    return _prepareCompleter.future;
  }

  void autoPlay(IjkMediaController ijkMediaController) async {
    try {
      await waitPrepare();
      ijkMediaController.play();
    } catch (e) {
      print(e);
    }
  }
}

// enum FinishType {
//   playEnd,
//   userExit,
//   error,
// }