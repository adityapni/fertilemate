import 'package:fertility_boost/app/data/apis/api_models/get_forum_category_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_forum_question_answer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class ForumController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  GetForumCategoryModel? getForumCategoryModel;
  List<Data1> data1 = [];
  List<Data2> data2 = [];

  Map<String, String?> parameters = Get.parameters;
  String forumTopicQuestionId = '';
  String userId = '';

  Map<String, dynamic> queryParameters = {};

  GetForumQuestionAnswerModel? getForumQuestionAnswerModel;
  List<Data> data = [];

  TextEditingController textControllers = TextEditingController();

  Map<String, String> bodyParams = {};

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    forumTopicQuestionId =
        parameters[ApiKeyConstants.forumTopicQuestionId] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getForumQuestionAnswerApi();
    inAsyncCall.value = false;
  }

/*
  Future<void> getPeaceCategoryApi() async {
    queryParameters = {ApiKeyConstants.forumDiscussionId: forumDiscussionId};
    getForumCategoryModel =
        await ApiMethods.getForumCategory(queryParameters: queryParameters);
    if (getForumCategoryModel != null) {
      if (getForumCategoryModel!.data1 != null &&
          getForumCategoryModel!.data1!.isNotEmpty) {
        data1 = getForumCategoryModel!.data1!;
      }
      if (getForumCategoryModel!.data2 != null &&
          getForumCategoryModel!.data2!.isNotEmpty) {
        data2 = getForumCategoryModel!.data2!;
      }
    }
  }
*/

  Future<void> getForumQuestionAnswerApi() async {
    queryParameters = {
      ApiKeyConstants.forumTopicQuestionId: forumTopicQuestionId
    };
    getForumQuestionAnswerModel = await ApiMethods.getForumQuestionAnswer(
        queryParameters: queryParameters);
    if (getForumQuestionAnswerModel != null) {
      if (getForumQuestionAnswerModel!.data != null &&
          getForumQuestionAnswerModel!.data!.isNotEmpty) {
        data = getForumQuestionAnswerModel!.data!;
        increment();
      }
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

  clickOnPostButton() async {
    if (textControllers.text.trim().isNotEmpty) {
      bodyParams = {
        ApiKeyConstants.userId: userId.toString(),
        ApiKeyConstants.forumTopicQuestionId: forumTopicQuestionId.toString(),
        ApiKeyConstants.answer: textControllers.text.toString(),
      };
      http.Response? response = await ApiMethods.addForumQuestionAnswer(
        bodyParams: bodyParams,
      );
      if (response != null && response.statusCode == 200) {
        textControllers.clear();
        await getForumQuestionAnswerApi();
      }
    } else {
      Get.snackbar('Error', 'Please enter question');
    }
  }
}
