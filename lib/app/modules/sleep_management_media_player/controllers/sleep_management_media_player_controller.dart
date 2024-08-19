// ignore_for_file: deprecated_member_us
import 'package:chewie/chewie.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_single_video_model.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class SleepManagementMediaPlayerController extends GetxController {
  final count = 0.obs;

  VideoPlayerController? videoController;
  late ChewieController chewieController;
  String videoId = '';

  GetSingleVideoModel? getSingleVideoModel;
  Data? data;
  List<Result> result = [];
  Map<String, String?> parameters = Get.parameters;

  final inAsyncCall = false.obs;

  @override
  Future<void> onInit() async {
    videoId = parameters[ApiKeyConstants.videoId] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getSingleVideoApi();
    inAsyncCall.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose:::::::::::::::::::::::done');
    dispose();
    super.onClose();
  }

  @override
  void dispose() {
    /* videoController?.dispose();
    chewieController.dispose();*/
    print('dispose:::::::::::::::::::::::dispose');
    super.dispose();
  }

  void increment() => count.value++;

  getSingleVideoApi() async {
    Map<String, dynamic> queryParameters = {
      ApiKeyConstants.videoId: videoId.toString()
    };
    getSingleVideoModel =
        await ApiMethods.getSingleVideo(queryParameters: queryParameters);
    try {
      if (getSingleVideoModel != null) {
        if (getSingleVideoModel!.data != null) {
          data = getSingleVideoModel!.data;
          if (data != null && data?.video != null && data!.video!.isNotEmpty) {
            videoController =
                VideoPlayerController.network(data!.video!.toString());
            await videoController?.initialize();
          }
        }
        if (getSingleVideoModel!.data != null &&
            getSingleVideoModel!.result != null &&
            getSingleVideoModel!.result!.isNotEmpty) {
          result = getSingleVideoModel!.result!;
        }
      }
    } catch (e) {
      CommonWidgets.snackBarView(title: 'Video Not Found');
    }
    increment();
  }

  clickOnBackIcon() {
    print('onClose:::::::::::::::::::::::done');
    // dispose();
  }
}
