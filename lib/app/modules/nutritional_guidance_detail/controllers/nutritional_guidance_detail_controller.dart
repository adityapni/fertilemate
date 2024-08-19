import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/guides_get_guid_by_sub_categorie_id_model.dart';

class NutritionalGuidanceDetailController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  String subCategoryId = '';

  GuidesGetGuidBySubCategoryIdModel? guidesGetGuidBySubCategoryIdModel;
  List<Result> result = [];

  List listOfDashboard = [
    {'title': 'Upload Menu'},
    {'title': 'History'},
    {'title': 'Menu Suggestions'},
  ];

  @override
  Future<void> onInit() async {
    subCategoryId = parameters[ApiKeyConstants.subCategoryId] ?? '';
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

  clickOnBackButton() {
    Get.back();
  }

  clickOnListTile({required int index}) {
    Map<String, String>? parameter = {
      ApiKeyConstants.guideId: result.first.guideId.toString()
    };
    switch (index) {
      case 0:
        Get.toNamed(Routes.NUTRITIONAL_GUIDANCE_DETAIL_MENU_UPLOAD,
            parameters: parameter);
        break;
      case 1:
        Get.toNamed(Routes.NUTRITIONAL_GUIDANCE_DETAIL_DASHBOARD,
            parameters: parameter);
        break;
      case 2:
        Get.toNamed(Routes.NUTRITIONAL_GUIDANCE_DETAIL_DASHBOARD, parameters: {
          ApiKeyConstants.guideId: result.first.guideId.toString(),
          ApiKeyConstants.admin: ApiKeyConstants.admin,
        });
        break;
    }
  }

  Future<void> onInitWork() async {
    await guidesGetGuidBySubCategorieIdApi();
  }

  Future<void> guidesGetGuidBySubCategorieIdApi() async {
    bodyParams = {ApiKeyConstants.subCategoryId: subCategoryId.toString()};
    guidesGetGuidBySubCategoryIdModel =
        await ApiMethods.guidesGetGuidBySubCategorieId(bodyParams: bodyParams);
    if (guidesGetGuidBySubCategoryIdModel != null &&
        guidesGetGuidBySubCategoryIdModel!.result!.isNotEmpty) {
      result = guidesGetGuidBySubCategoryIdModel!.result!;
      increment();
    }
  }
}
