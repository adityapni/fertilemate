// ignore_for_file: deprecated_member_use

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:get/get.dart';

import '../../../data/constants/string_constants.dart';

class PlayVideoStressManagementController extends GetxController {
  final count = 0.obs;
  late VideoPlayerController videoPlayerController;
  String longVideo = "";

  late CustomVideoPlayerController customVideoPlayerController;

  final CustomVideoPlayerSettings customVideoPlayerSettings =
      const CustomVideoPlayerSettings(showSeekButtons: true);

  Map<String, String?> parameters = Get.parameters;

  String title = '';
  String subTitle = '';

  final inAsyncCall = false.obs;

  @override
  void onInit() {
    title = parameters[StringConstants.postName] ?? '';
    subTitle = parameters[StringConstants.postDescription] ?? '';
    longVideo = parameters[StringConstants.postVideo] ?? '';
    try{
      videoPlayerController = VideoPlayerController.network(
        longVideo,
      )..initialize().then((value) {
        increment();
      });
      customVideoPlayerController = CustomVideoPlayerController(
        context: Get.context!,
        videoPlayerController: videoPlayerController,
        customVideoPlayerSettings: customVideoPlayerSettings,
      );
    }catch(e){
      print("e:::::::::::::::::::::${e}");
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  clickOnBackIcon() {
    Get.back();
    longVideo = '';
    videoPlayerController.dispose();
    videoPlayerController.pause();
  }
}
