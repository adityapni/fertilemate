import 'dart:io';
import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:saver_gallery/saver_gallery.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_fertility_webinars_details_model.dart';

class FertilityEducationNowPlayingController extends GetxController {
  final count = 0.obs;

  VideoPlayerController? videoController;
  ChewieController? chewieController;

  String webinarsBlogId = '';
  String userId = '';

  GetFertilityWebinarsDetailsModel? getFertilityWebinarsDetailsModel;
  Result? result;
  Map<String, String?> parameters = Get.parameters;

  final inAsyncCall = false.obs;
  final progress = 0.0.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    webinarsBlogId = parameters[ApiKeyConstants.webinarsBlogId] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getFertilityWebinarsDetailsApi();
    inAsyncCall.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }

  @override
  void dispose() {
    videoController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  void increment() => count.value++;

  getFertilityWebinarsDetailsApi() async {
    Map<String, dynamic> queryParameters = {
      ApiKeyConstants.webinarsBlogId: webinarsBlogId.toString(),
      ApiKeyConstants.userId: userId,
    };
    getFertilityWebinarsDetailsModel =
        await ApiMethods.getFertilityWebinarsDetails(
            queryParameters: queryParameters);
    try {
      if (getFertilityWebinarsDetailsModel != null) {
        if (getFertilityWebinarsDetailsModel!.result != null) {
          result = getFertilityWebinarsDetailsModel!.result;
          if (result != null &&
              result?.video != null &&
              result!.video!.isNotEmpty) {
            videoController =
                VideoPlayerController.network(result!.video!.toString());
            await videoController?.initialize();
          }
        }
      }
    } catch (e) {
      print('e:::::::::$e');
      await onInit();
      CommonWidgets.snackBarView(title: 'Video Not Found');
    }
    increment();
  }

  Future<void> clickOnSaveButton() async {
    if (result != null && result?.video != null && result!.video!.isNotEmpty) {
      inAsyncCall.value = true;
      progress.value = 0;
      try {
        var url = result!.video!;
        var response = await http.get(Uri.parse(url));
        var dir = await getApplicationDocumentsDirectory();
        var filePath = '${dir.path}/video${Random().nextInt(10)}.mp4';
        var file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        final resultValue = await SaverGallery.saveFile(
            file: filePath,
            androidExistNotSave: true,
            name: 'Fertility video ${Random().nextInt(10)}.mp4',
            androidRelativePath: "Movies");
        print(resultValue);
      } catch (e) {
        print(e);
      }
      print('Download complete');
      inAsyncCall.value = false;
    }
  }

  clickOnBookmarkIcon() async {
    http.Response? response =
        await ApiMethods.addDeleteFertilityBlogEducation(bodyParams: {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.fertilityBlogEducationId: result?.id,
      ApiKeyConstants.type: ApiKeyConstants.webinar,
    });
    if (response != null) {
      inAsyncCall.value = true;
      await getFertilityWebinarsDetailsApi();
      inAsyncCall.value = false;
    }
  }
}

/*

final count = 0.obs;

Map<String, dynamic> queryParameters = {};

String webinarsBlogId = '';

GetFertilityWebinarsDetailsModel? getFertilityWebinarsDetailsModel;
Result? result;

final inAsyncCall = false.obs;

Map<String, String?> parameters = Get.parameters;

VideoPlayerController? videoController;
var chewieController;

@override
Future<void> onInit() async {
  webinarsBlogId = parameters[ApiKeyConstants.id] ?? '';
  super.onInit();
  inAsyncCall.value = true;
  await getFertilityWebinarsDetailsApi();
  inAsyncCall.value = false;
}

@override
void onReady() {
  super.onReady();
}

@override
void onClose() {
  videoController?.dispose();
  chewieController.dispose();
  super.onClose();
}

void increment() => count.value++;

clickOnBackIcon() {
  Get.back();
}

Future<void> getFertilityWebinarsDetailsApi() async {
  queryParameters = {ApiKeyConstants.webinarsBlogId: webinarsBlogId};
  getFertilityWebinarsDetailsModel =
  await ApiMethods.getFertilityWebinarsDetails(
      queryParameters: queryParameters);
  if (getFertilityWebinarsDetailsModel != null &&
      getFertilityWebinarsDetailsModel!.result != null) {
    result = getFertilityWebinarsDetailsModel!.result!;
    if (result != null && result?.video != null && result!.video!.isNotEmpty) {
      print('result:::::::::::$result');

      videoController = VideoPlayerController.network(result!.video!.toString());
      await videoController?.initialize();
      increment();
    }
  }
}
}*/
