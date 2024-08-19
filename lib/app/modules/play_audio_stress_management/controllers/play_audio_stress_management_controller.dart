import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class PlayAudioStressManagementController extends GetxController {

  final count = 0.obs;
  Map<String, String?>  parameters= Get.parameters;
  String musicUrl = "";
  String thumbnailImgUrl = "";
  var player = AudioPlayer();
  final loaded = false.obs;
  final playing = false.obs;

  String title = '';

  String subTitle = '';

  void loadMusic() async {
    await player.setUrl(musicUrl);
    loaded.value = true;
  }

  void playMusic() async {
    playing.value = true;
    await player.play();
  }

  void pauseMusic() async {
      playing.value = false;
    await player.pause();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
  @override
  void onInit() {
    title = parameters[StringConstants.postName] ?? '';
    subTitle = parameters[StringConstants.postDescription] ?? '';
    musicUrl = parameters[StringConstants.postAudio] ?? '';
    thumbnailImgUrl = parameters[StringConstants.postImage] ?? '';
    loadMusic();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnBackIcon() {
    Get.back();
    pauseMusic();
    musicUrl = '';
    thumbnailImgUrl= '';
    loaded.value = false;
    playing.value = false;
  }
}
