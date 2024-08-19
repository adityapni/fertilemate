import 'dart:async';

import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_models/main_categories_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_admin_msg_count_model.dart';
import '../../../data/apis/api_models/get_home_banner_model.dart';
import '../../../data/constants/string_constants.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  MainCategoriesModel? mainCategoriesModel;
  List<Result> result = [];
  Map<String, String> parameters = {};

  List<Data> data = [];

  final totalMessage = ''.obs;
  final userId = ''.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId.value = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    await onInitWork();
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

  clickOnGetStartedButton() {
    // // Get.toNamed(Routes.TRAINER_NET_ADD_APPOINTMENT);
    // Navigator.push(Get.context!,
    //     MaterialPageRoute(builder: (context) => WaterReminderHomePage()));

    Map<String, String> parameter = {
      ApiKeyConstants.categoryId: '12',
      // category id 12 means the feature is attempt quiz
      StringConstants.title: 'Fertility Assessment',
    };
    Get.toNamed(Routes.FERTILITY_ASSESSMENT, parameters: parameter);
  }

  clickOnListTile({required String id}) {
    switch (id) {
      case "1":
        parameters = {ApiKeyConstants.mainCategoryId: id.toString()};
        Get.toNamed(Routes.HEALTH_ASSESSMENT, parameters: parameters);
        break;
      case "2":
        parameters = {ApiKeyConstants.mainCategoryId: id.toString()};
        Get.toNamed(Routes.CYCLE_TRACKING_DASHBOARD, parameters: parameters);
        break;
      case '3':
        parameters = {ApiKeyConstants.mainCategoryId: id.toString()};
        Get.toNamed(Routes.ECOMMERCE_CATEGORY, parameters: parameters);
        break;
      case '4':
        parameters = {ApiKeyConstants.mainCategoryId: id.toString()};
        Get.toNamed(Routes.LIFESTYLE_OPTIMISATION, parameters: parameters);
        break;
      case '5':
        parameters = {ApiKeyConstants.mainCategoryId: id.toString()};
        Get.toNamed(Routes.NUTRITIONAL_GUIDANCE, parameters: parameters);
        break;
      case '6':
        parameters = {ApiKeyConstants.mainCategoryId: id.toString()};
        Get.toNamed(Routes.FERTILITY_EDUCATION_WELL_COME,
            parameters: parameters);
        break;
      case '7':
        parameters = {ApiKeyConstants.mainCategoryId: id.toString()};
        Get.toNamed(Routes.SUPPORTIVE_COMMUNITY, parameters: parameters);
        break;
      case '8':
        parameters = {ApiKeyConstants.mainCategoryId: id.toString()};
        Get.toNamed(Routes.EXPERT_CONSULTATION, parameters: parameters);
        break;
    }
  }

  Future<void> onInitWork() async {
    inAsyncCall.value = true;
    await getBannerData();
    await mainCategoriesApi();
    await getAdminMsgCountApi();
    /* Timer.periodic(const Duration(seconds: 5), (timer) async {
      await getAdminMsgCountApi();
    });*/
    inAsyncCall.value = false;
  }

  Future<void> mainCategoriesApi() async {
    mainCategoriesModel = await ApiMethods.mainCategories();
    if (mainCategoriesModel != null &&
        mainCategoriesModel!.result != null &&
        mainCategoriesModel!.result!.isNotEmpty) {
      result = mainCategoriesModel!.result!;
    }
  }

  getBannerData() async {
    GetHomeBannerModel? getHomeBannerModel;
    getHomeBannerModel = await ApiMethods.getHomeBanner();
    if (getHomeBannerModel != null &&
        getHomeBannerModel.data != null &&
        getHomeBannerModel.data!.isNotEmpty) {
      data = getHomeBannerModel.data!;
    }
  }

  getAdminMsgCountApi() async {
    GetAdminMsgCountModel? getAdminMsgCountModel;
    getAdminMsgCountModel = await ApiMethods.getAdminMsgCount(
        bodyParams: {ApiKeyConstants.userId: userId.value});
    if (getAdminMsgCountModel != null &&
        getAdminMsgCountModel.totalMessage != null &&
        getAdminMsgCountModel.totalMessage!.isNotEmpty) {
      totalMessage.value = getAdminMsgCountModel.totalMessage!;
      increment();
    }
  }

  clickOnChatNowButton() {
    Get.toNamed(Routes.CHAT_WITH_ADMIN);
  }
}
