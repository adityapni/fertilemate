import 'package:fertility_boost/app/data/apis/api_models/posts_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/sub_categories_by_category_id_model.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class StressManagementController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  final selectedTab = 0.obs;
  String categoryId = '5';

  final inAsyncCall = false.obs;
  Map<String, dynamic> bodyParams = {};

  PostsModel? postsModel;
  List<Post> postAudio = [];
  List<Post> postVideo = [];

  SubCategoriesByCategoryIdModel? subCategoriesByCategoryIdModel;
  List<Result> result = [];

  @override
  Future<void> onInit() async {
    categoryId = parameters[ApiKeyConstants.categoryId].toString();
    super.onInit();
    inAsyncCall.value = true;
    await onInitWork();
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

  clickOnListTile({required int index}) {
    Map<String, String> parameter = {
      StringConstants.postName: postAudio[index].postName.toString(),
      StringConstants.postDescription:
          postAudio[index].postDescription.toString(),
      StringConstants.postAudio: postAudio[index].postAudio.toString(),
      StringConstants.postImage: postAudio[index].postImage.toString(),
      StringConstants.title: postAudio[index].postName.toString(),
    };
    Get.toNamed(Routes.PLAY_AUDIO_STRESS_MANAGEMENT, parameters: parameter);
  }

  Widget cards({
    required String bgImageString,
    required String textString,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /*SizedBox(
          height: 64.px,
          width: 64.px,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.px),
            child: Image.network(
              bgImageString,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(ImageConstants.defaultNetworkImage);
              },
            ),
          ),
        ),*/
        CommonWidgets.imageView(
            image: bgImageString, height: 64.px, width: 64.px, radius: 8.px),
        SizedBox(height: 4.px),
        Text(
          textString,
          style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
              fontSize: 12.px, color: Theme.of(Get.context!).primaryColor),
        ),
      ],
    );
  }

  clickOnTabs({required int value}) async {
    selectedTab.value = value;
    inAsyncCall.value = true;
    await postsApi(
        value: selectedTab.value,
        id: result.isNotEmpty ? result[0].id.toString() : '');
    inAsyncCall.value = false;
  }

  Future<void> onInitWork() async {
    await subCategoriesByCategoryIdApi();
    await postsApi(id: result.isNotEmpty ? result[0].id.toString() : '');
  }

  Future<void> postsApi({int value = 0, String? id}) async {
    bodyParams = {
      ApiKeyConstants.type:
          value == 0 ? ApiKeyConstants.audio : ApiKeyConstants.video,
      ApiKeyConstants.subCategoryId: id ?? '',
    };
    postsModel = null;
    postVideo.clear();
    postAudio.clear();
    postsModel = await ApiMethods.posts(bodyParams: bodyParams);
    if (postsModel != null && postsModel!.post!.isNotEmpty) {
      value == 0
          ? (postAudio = postsModel!.post!)
          : (postVideo = postsModel!.post!);
    }
  }

  Future<void> subCategoriesByCategoryIdApi() async {
    bodyParams = {ApiKeyConstants.categoryId: categoryId.toString()};
    subCategoriesByCategoryIdModel =
        await ApiMethods.subCategoriesByCategoryId(bodyParams: bodyParams);
    if (subCategoriesByCategoryIdModel != null &&
        subCategoriesByCategoryIdModel!.result!.isNotEmpty) {
      result = subCategoriesByCategoryIdModel!.result!;
      increment();
    }
  }

  clickOnCard({required int index}) async {
    inAsyncCall.value = true;
    await postsApi(value: selectedTab.value, id: result[index].id.toString());
    inAsyncCall.value = false;
  }

  clickOnVideoCard({required int index}) {
    Map<String, String> parameter = {
      StringConstants.postName: postVideo[index].postName.toString(),
      StringConstants.postDescription:
          postVideo[index].postDescription.toString(),
      StringConstants.postVideo: postVideo[index].postVideo.toString(),
      StringConstants.postImage: postVideo[index].postImage.toString(),
    };
    Get.toNamed(Routes.PLAY_VIDEO_STRESS_MANAGEMENT, parameters: parameter);
  }
}
