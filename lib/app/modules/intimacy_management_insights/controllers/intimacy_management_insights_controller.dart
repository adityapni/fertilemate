import 'package:fertility_boost/app/data/apis/api_models/get_sleep_management_categories_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/intimacy_get_intimacy_insights_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class IntimacyManagementInsightsController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  SleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel?
      sleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel;
  List<Result> result = [];
  Map<String, String> parameters = {};

  IntimacyGetIntimacyInsightsModel? intimacyGetIntimacyInsightsModel;
  ResultData? resultData;

  @override
  Future<void> onInit() async {
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

  clickOnCard({required int index}) {
    parameters = {
      ApiKeyConstants.title:
          result[index].imcName.toString(),
      ApiKeyConstants.imbIntimacyManagementCategoriesId:
          result[index].imcId.toString()
    };
    Get.toNamed(Routes.INTIMACY_MANAGEMENT_COMMUNICATION_TIPS,
        parameters: parameters);

    /* switch (index) {
      case 0:
        Get.toNamed(
          Routes.INTIMACY_MANAGEMENT_COMMUNICATION_TIPS,
        );
        break;
      case 1:
        Get.toNamed(Routes.INTIMACY_MANAGEMENT_RELATIONSHIP_ADVICE);
        break;
      case 2:
        Get.toNamed(Routes.INTIMACY_MANAGEMENT_SEXUAL_WELLNESS);
        break;
      case 3:
        Get.toNamed(Routes.INTIMACY_MANAGEMENT_SPEND_TIME_TOGETHER);
        break;
    }*/
  }

  Future<void> onInitWork() async {
    await sleepManagementIntimacyManagementGetIntimacyManagementCategoriesApi();
    await intimacyGetIntimacyInsightsApi();
  }

  Future<void> intimacyGetIntimacyInsightsApi() async {
    intimacyGetIntimacyInsightsModel =
        await ApiMethods.intimacyGetIntimacyInsights();
    if (intimacyGetIntimacyInsightsModel != null &&
        intimacyGetIntimacyInsightsModel!.resultData != null) {
      resultData = intimacyGetIntimacyInsightsModel!.resultData!;
    }
  }

  Future<void>
      sleepManagementIntimacyManagementGetIntimacyManagementCategoriesApi() async {
    sleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel =
        await ApiMethods
            .sleepManagementIntimacyManagementGetIntimacyManagementCategories();
    if (sleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel != null &&
        sleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel!
                .result !=
            null &&
        sleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel!
            .result!.isNotEmpty) {
      result =
          sleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel!
              .result!;
    }
  }
}
