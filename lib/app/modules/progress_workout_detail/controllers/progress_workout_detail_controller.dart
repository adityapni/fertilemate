/*import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../data/apis/api_models/get_workout_blog_by_workout_week_id_model.dart';

class ProgressWorkoutDetailController extends GetxController {
  final count = 0.obs;

  late VideoPlayerController videoPlayerController;
  String longVideo = "";

*/ /*
  final videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
*/ /*

  var chewieController;
  Result? result = Get.arguments;

  @override
  Future<void> onInit() async {
    super.onInit();
    longVideo = result?.pwbVideo ??
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
    try {
      videoPlayerController = VideoPlayerController.network(
        longVideo,
      )..initialize().then((value) {
          increment();
        });
    } catch (e) {
      print("e:::::::::::::::::::::${e}");
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}*/

import 'package:get/get.dart';

import '../../../data/apis/api_models/get_workout_blog_by_workout_week_id_model.dart';

class ProgressWorkoutDetailController extends GetxController {
  final count = 0.obs;
  String longVideo = "";
  Result? result = Get.arguments;

  @override
  Future<void> onInit() async {
    super.onInit();
    longVideo =
        extractVimeoId(result?.pwbVideo ?? 'https://vimeo.com/942303497');
  }

  String extractVimeoId(String url) {
    final regex = RegExp(r'vimeo\.com\/(\d+)');
    final match = regex.firstMatch(url);
    if (match != null) {
      return match.group(1)!;
    } else {
      throw Exception("Invalid Vimeo URL");
    }
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
}
