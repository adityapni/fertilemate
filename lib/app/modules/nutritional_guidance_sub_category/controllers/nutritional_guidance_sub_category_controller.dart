import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/sub_categories_by_category_id_model.dart';

class NutritionalGuidanceSubCategoryController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  String categoryId = '';
  String title = '';

  SubCategoriesByCategoryIdModel? subCategoriesByCategoryIdModel;
  List<Result> result = [];

  @override
  Future<void> onInit() async {
    categoryId = parameters[ApiKeyConstants.categoryId].toString();
    title = parameters[ApiKeyConstants.title].toString();
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
      ApiKeyConstants.subCategoryId: result[index].id.toString()
    };
    switch (result[index].screenType.toString()) {
      case StringConstants.dashboard:
        Get.toNamed(Routes.NUTRITIONAL_GUIDANCE_DETAIL, parameters: parameter);
        break;
      case StringConstants.bigBlog:
        Get.toNamed(Routes.NUTRITIONAL_GUIDANCE_DETAIL_BLOG,
            parameters: parameter);
        break;
      case StringConstants.openReminderAppForMeal:
        /*Get.toNamed(Routes.NUTRITIONAL_GUIDANCE_DETAIL_TIME_FOR_MEAL,
            parameters: parameter);*/
        openReminderApp();
        break;
      case StringConstants.exercise:
        Get.toNamed(Routes.PROGRESS_WORKOUT);
        break;
      case StringConstants.supplement:
        Get.toNamed(Routes.NUTRITIONAL_GUIDANCE_DETAIL_SUPPLEMENT,
            parameters: parameter);
        break;
      /*case StringConstants.dashboard:
        Get.toNamed(Routes.NUTRITIONAL_GUIDANCE_DETAIL_DASHBOARD);
        // Get.toNamed(Routes.NUTRITIONAL_GUIDANCE_DETAIL_MEAL_PLAN_WEEKS);
        break;*/
    }
  }

  Future<void> openClockApp() async {
    const androidClockUri =
        'content://com.android.deskclock/alarm'; // Common URI for Android's Clock App
    if (await canLaunchUrl(Uri.parse(androidClockUri))) {
      await launchUrl(Uri.parse(androidClockUri));
    } else {
      print('Could not launch $androidClockUri');
    }
  }

  void _openClock() async {
    const platform = MethodChannel('com.example.clock');
    try {
      await platform.invokeMethod('openClock');
    } on PlatformException catch (e) {
      print("Failed to open clock: '${e.message}'.");
    }
  }

  void openAlarmClock() async {
    // URL scheme for opening the alarm clock app on different platforms
    const String packageName = 'com.android.deskclock';
    final String uri = 'package:$packageName';

    // Check if the alarm clock app can be opened
    if (await canLaunch(uri)) {
      // Open the alarm clock app
      await launch(uri);
    } else {
      // Handle the case where the alarm clock app is not available on the device
      print('Could not open alarm clock app.');
    }
  }

  void openReminderApp() async {
    // URL for the reminder app on iOS
    const String iosReminderUrl = 'x-apple-reminder://';
    // URL for Google Calendar on Android
    const String androidCalendarUrl = 'content://com.android.calendar/time/';

    if (await canLaunch(iosReminderUrl)) {
      // Open reminder app on iOS
      await launch(iosReminderUrl);
    } else if (await canLaunch(androidCalendarUrl)) {
      // Open Google Calendar on Android
      await launch(androidCalendarUrl);
    } else {
      // If no app can be opened, show an error message
      print('Could not open reminder or calendar app.');
    }
  }

  clickOnBackButton() {
    Get.back();
  }

  Future<void> onInitWork() async {
    await subCategoriesByCategoryIdApi();
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
}
