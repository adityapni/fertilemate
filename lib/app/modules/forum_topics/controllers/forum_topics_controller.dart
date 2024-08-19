import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_forum_discussion_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_forum_topic_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_latest_question_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_methods/api_methods.dart';

class ForumTopicsController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  TextEditingController searchController = TextEditingController();

  List searchResult = [];

  GetForumTopicModel? getForumTopicModel;

  List<Doctor> doctor = [];

  Map<String, String> bodyParams = {};

  GetForumDiscussionModel? getForumDiscussionModel;

  List<Result> result = [];

  Map<String, String> parameter = {};

  GetLatestQuestionModel? getLatestQuestionModel;

  List<Data> data = [];
  String userId = '';

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getForumTopicApi();
    await getLatestQuestionApi();
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

  searchMethod({required String value}) {
    searchResult.clear();
    if (searchController.text.isEmpty) {
      increment();
      return;
    }
    doctor.forEach((res) {
      if (res.name!
          .toUpperCase()
          .contains(searchController.text.toUpperCase())) {
        searchResult.add(res);
      }
    });
    increment();
  }

  Future<void> getForumTopicApi() async {
    getForumTopicModel = await ApiMethods.getForumTopic();
    if (getForumTopicModel != null && getForumTopicModel!.doctor != null) {
      doctor = getForumTopicModel!.doctor!;
    }
  }

  Future<void> getForumDiscussionApi() async {
    bodyParams = {ApiKeyConstants.topicId: ''};
    getForumDiscussionModel =
        await ApiMethods.getForumDiscussion(bodyParams: bodyParams);
    if (getForumDiscussionModel != null &&
        getForumDiscussionModel!.result != null) {
      result = getForumDiscussionModel!.result!;
    }
  }

  Future<void> getLatestQuestionApi() async {
    getLatestQuestionModel = await ApiMethods.getLatestQuestion();
    if (getLatestQuestionModel != null &&
        getLatestQuestionModel!.data != null) {
      data = getLatestQuestionModel!.data!;
      increment();
    }
  }

  clickOnCard({String? id, String? title}) {
    Map<String, String> parameters = {
      ApiKeyConstants.forumTopicId: id ?? '',
      ApiKeyConstants.title: title ?? ''
    };
    Get.toNamed(Routes.FORUM_TOPICS_LIST, parameters: parameters);
  }

  clickOnView({required int index}) {
    parameter.clear();
    parameter = {
      ApiKeyConstants.forumTopicQuestionId: data[index].id.toString()
    };
    Get.toNamed(Routes.FORUM, parameters: parameter);
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
      await getLatestQuestionApi();
    }
  }
}
