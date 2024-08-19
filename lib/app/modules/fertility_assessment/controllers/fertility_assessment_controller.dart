import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/sub_categories_by_category_id_model.dart';
import '../../../data/constants/string_constants.dart';

class FertilityAssessmentController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  String categoryId = '';
  String title = '';
  String userId = '';

  SubCategoriesByCategoryIdModel? subCategoriesByCategoryIdModel;
  List<Result> result = [];

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    categoryId = parameters[ApiKeyConstants.categoryId].toString();
    title = parameters[StringConstants.title].toString();
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

  clickOnCard({required int index}) async {
    Map<String, String> parameter = {
      ApiKeyConstants.id: result[index].id.toString(),
      StringConstants.title: result[index].name.toString(),
    };
    switch (result[index].name.toString()) {
      case 'Male Fertility':
        Get.toNamed(Routes.QUIZ, parameters: parameter);
        break;
      case 'Pre diabetes Quiz':
        Get.toNamed(Routes.PREDIABETES_QUIZ_ASSESMENT, parameters: parameter);
        break;
      case 'PCOS Quiz':
        Get.toNamed(Routes.PCOS_QUIZ_ASSESSMENT, parameters: parameter);
        break;
      case 'Menopause Quiz':
        Get.toNamed(Routes.MENOPAUSE_QUIZ_ASSESMENT, parameters: parameter);
        break;
    }
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
    }
  }
}
