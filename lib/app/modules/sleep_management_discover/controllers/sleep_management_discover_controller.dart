import 'dart:io';

import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_discover_filters_model.dart';
import '../../../data/apis/api_models/get_next_video_list_discover_model.dart';
import '../../../routes/app_pages.dart';

class SleepManagementDiscoverController extends GetxController {
  final count = 0.obs;
  TextEditingController searchController = TextEditingController();
  final inAsyncCall = false.obs;
  final selectedTab = 0.obs;
  bool thumbnailLoaded = false;
  GetDiscoverFiltersModel? getDiscoverFiltersModel;
  List<Result> result = [];

  GetNextVideoListDiscoverModel? getNextVideoListDiscoverModel;
  List<GetNextVideoListDiscoverResult> getNextVideoListDiscoverResult = [];
  List<GetNextVideoListDiscoverResult> searchResult = [];
  String selectedFilter = '';
  String soundTracksCateId = '';
  Map<String, String> parameters = {};
  Map<String, String?> parameter = Get.parameters;

  @override
  Future<void> onInit() async {
    soundTracksCateId = parameter[ApiKeyConstants.id] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await sleepManagementGetDiscoverFiltersApi();
    await getNextVideoListDiscoverApi();
    inAsyncCall.value = false;
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

  clickOnCard({required int index}) async {
    getNextVideoListDiscoverModel = null;
    getNextVideoListDiscoverResult.clear();
    selectedTab.value = index;
    inAsyncCall.value = true;
    selectedFilter = result[index].id.toString();
    await getNextVideoListDiscoverApi();
    inAsyncCall.value = false;
    increment();
  }

  sleepManagementGetDiscoverFiltersApi() async {
    getDiscoverFiltersModel =
        await ApiMethods.sleepManagementGetDiscoverFilters();
    if (getDiscoverFiltersModel != null &&
        getDiscoverFiltersModel!.result != null &&
        getDiscoverFiltersModel!.result!.isNotEmpty) {
      result = getDiscoverFiltersModel!.result!;
      selectedFilter = result.first.id.toString();
    }
    increment();
  }

  getNextVideoListDiscoverApi() async {
    Map<String, dynamic> queryParameters = {
      ApiKeyConstants.filterId: selectedFilter.toString(),
      ApiKeyConstants.soundTracksCateId: soundTracksCateId.toString(),
    };
    getNextVideoListDiscoverModel = await ApiMethods.getNextVideoListDiscover(
        queryParameters: queryParameters);
    getNextVideoListDiscoverResult.clear();
    if (getNextVideoListDiscoverModel != null &&
        getNextVideoListDiscoverModel!.getNextVideoListDiscoverResult != null &&
        getNextVideoListDiscoverModel!
            .getNextVideoListDiscoverResult!.isNotEmpty) {
      getNextVideoListDiscoverResult =
          getNextVideoListDiscoverModel!.getNextVideoListDiscoverResult!;
    }
    increment();
  }

  clickOnVideo({required int index}) {
    parameters = {
      ApiKeyConstants.videoId:
          getNextVideoListDiscoverResult[index].id.toString()
    };
    Get.toNamed(Routes.SLEEP_MANAGEMENT_MEDIA_PLAYER, parameters: parameters);
  }

  Future<Widget> getVideoThumbnail(String videoUrl) async {
    final thumbnailPath = await VideoThumbnail.thumbnailFile(
      video: videoUrl,
      thumbnailPath: (await VideoThumbnail.thumbnailFile(
        video: videoUrl,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.JPEG,
        maxHeight: 100,
        quality: 25,
      )),
      imageFormat: ImageFormat.JPEG,
      maxHeight: 100,
      quality: 50,
    );
    final thumbnailImage = Image.file(
      File(thumbnailPath!),
      fit: BoxFit.cover,
    );
    return thumbnailImage;
  }

  searchMethod({required String value}) {
    searchResult.clear();
    if (searchController.text.isEmpty) {
      increment();
      return;
    }
    getNextVideoListDiscoverResult.forEach((res) {
      if (res.name!
          .toUpperCase()
          .contains(searchController.text.toUpperCase())) {
        searchResult.add(res);
      }
    });
    increment();
  }
}
