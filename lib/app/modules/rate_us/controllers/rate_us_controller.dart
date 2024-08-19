import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import 'package:http/http.dart' as http;

import '../../../data/apis/api_methods/api_methods.dart';

class RateUsController extends GetxController {
  final count = 0.obs;
  Map<String, dynamic> bodyParams = {};

  String userId = '';
  String rating = '';
  TextEditingController reviewController = TextEditingController();

  final inAsyncCall = false.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId)!;
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

  clickOnSendButton() async {
    inAsyncCall.value = true;
    if (rating.isNotEmpty && reviewController.text.isNotEmpty) {
      await addRates();
    } else {
      CommonWidgets.snackBarView(title: 'Please give rating and review both');
    }
    inAsyncCall.value = false;
  }

  Future<void> addRates() async {
    bodyParams = {
      ApiKeyConstants.review: reviewController.text.toString(),
      ApiKeyConstants.rating: rating.toString(),
      ApiKeyConstants.userId: userId.toString(),
    };
    http.Response? response = await ApiMethods.addRates(bodyParams: bodyParams);
    if (response != null && response.statusCode == 200) {
      Get.back();
    }
  }

  clickOnRatting({required double ratingStatus}) {
    rating = ratingStatus.toString();
  }
}
