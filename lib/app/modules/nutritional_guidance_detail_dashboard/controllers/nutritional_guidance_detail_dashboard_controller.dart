import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_constants/api_url_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/guides_get_menu_by_guide_id_model.dart';

class NutritionalGuidanceDetailDashboardController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  String guideId = '';
  String admin = '';
  String userId = '';

  GuidesGetMenuByGuideIdModel? guidesGetMenuByGuideIdModel;
  List<Result> result = [];

  @override
  Future<void> onInit() async {
    guideId = parameters[ApiKeyConstants.guideId] ?? "";
    admin = parameters[ApiKeyConstants.admin] ?? "";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
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

  clickOnPurchaseHealthyMealButton() {}

  Future<void> onInitWork() async {
    await guidesGetMenuByGuideIdApi();
  }

  Future<void> guidesGetMenuByGuideIdApi() async {
    bodyParams = {
      ApiKeyConstants.userId: userId.toString(),
      ApiKeyConstants.guideId: guideId.toString()
    };
    guidesGetMenuByGuideIdModel = await ApiMethods.guidesGetMenuByGuideId(
        bodyParams: bodyParams,
        url: admin == ApiKeyConstants.admin
            ? ApiUrlConstants.endPointOfGuidesGetMenuByAdmin
            : ApiUrlConstants.endPointOfGuidesGetMenuByGuideId);
    if (guidesGetMenuByGuideIdModel != null &&
        guidesGetMenuByGuideIdModel!.result!.isNotEmpty) {
      result = guidesGetMenuByGuideIdModel!.result!.reversed.toList();
      increment();
    }
  }

  clickOnCard({required int index}) {
    Get.toNamed(Routes.NUTRITIONAL_GUIDANCE_DETAIL_DASHBOARD_DETAIL,
        arguments: result[index]);
  }
}
