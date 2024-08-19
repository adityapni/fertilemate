import 'package:fertility_boost/app/data/apis/api_models/get_forum_discussion_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_latest_question_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../routes/app_pages.dart';

class ForumTopicsListController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  String title = '';
  String id = '';
  String forumTopicId = '';
  String userId = '';

  Map<String, String?> parameters = Get.parameters;

  Map<String, String?> bodyParams = {};

  GetForumDiscussionModel? getForumDiscussionModel;

  List<Result> result = [];

  Map<String, String> parameter = {};

  GetLatestQuestionModel? getLatestQuestionModel;

  List<Data> data = [];

  TextEditingController textControllers = TextEditingController();

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    forumTopicId = parameters[ApiKeyConstants.forumTopicId] ?? '';
    title = parameters[ApiKeyConstants.title] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getForumQuestionApi();
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

  clickOnView({required int index}) {
    parameter.clear();
    parameter = {
      ApiKeyConstants.forumTopicQuestionId: data[index].id.toString()
    };
    Get.toNamed(Routes.FORUM, parameters: parameter);
  }

  Future<void> getForumDiscussionApi() async {
    bodyParams = {ApiKeyConstants.topicId: id};
    getForumDiscussionModel =
        await ApiMethods.getForumDiscussion(bodyParams: bodyParams);
    if (getForumDiscussionModel != null &&
        getForumDiscussionModel!.result != null) {
      result = getForumDiscussionModel!.result!;
    }
  }

  Future<void> getForumQuestionApi() async {
    bodyParams = {ApiKeyConstants.forumTopicId: forumTopicId};
    getLatestQuestionModel =
        await ApiMethods.getForumQuestion(bodyParams: bodyParams);
    if (getLatestQuestionModel != null &&
        getLatestQuestionModel!.data != null) {
      data = getLatestQuestionModel!.data!;
      increment();
    }
  }

  clickOnPostButton() async {
    if (textControllers.text.trim().isNotEmpty) {
      bodyParams.clear();
      bodyParams = {
        ApiKeyConstants.userId: userId.toString(),
        ApiKeyConstants.forumTopicId: forumTopicId.toString(),
        ApiKeyConstants.question: textControllers.text.toString(),
      };
      http.Response? response = await ApiMethods.addForumQuestion(
        bodyParams: bodyParams,
      );
      if (response != null && response.statusCode == 200) {
        textControllers.clear();
        await getForumQuestionApi();
      }
    } else {
      Get.snackbar('Error', 'Please enter question');
    }
  }

  clickOnDeleteButton({required int index}) async {
    bodyParams.clear();
    bodyParams = {
      ApiKeyConstants.id: data[index].id.toString(),
    };
    http.Response? response = await ApiMethods.deleteForumQuestion(
      bodyParams: bodyParams,
    );
    if (response != null && response.statusCode == 200) {
      await getForumQuestionApi();
    }
  }
}
