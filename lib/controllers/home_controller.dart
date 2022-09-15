import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController{
  final OnAudioQuery audioQuery = OnAudioQuery();
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void onInit() {
  requestPermission();
    super.onInit();
  }
  

void requestPermission() {
    Permission.storage.request();
    update();
  }

}