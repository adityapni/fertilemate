import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/nutritional_guidance_get_nutritional_guidance_blog_by_sub_categorie_id_model.dart';

class NutritionalGuidanceDetailBlogController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;
  final isLike = false.obs;

  GuidanceGetNutritionalGuidanceBlogBySubCategorieIdModel?
      guidanceGetNutritionalGuidanceBlogBySubCategorieIdModel;
  List<Result> result = [];
  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};

  String subCategoryId = '';

  @override
  Future<void> onInit() async {
    subCategoryId = parameters[ApiKeyConstants.subCategoryId].toString();
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

  clickOnStartButton({required int index}) {
    Get.toNamed(Routes.NUTRITIONAL_GUIDANCE_DETAIL_BLOG_DETAIL,
        arguments: result[index]);
  }

  Future<void> onInitWork() async {
    await guidanceGetNutritionalGuidanceBlogBySubCategorieIdApi();
  }

  Future<void> guidanceGetNutritionalGuidanceBlogBySubCategorieIdApi() async {
    bodyParams = {ApiKeyConstants.subCategoryId: subCategoryId.toString()};
    guidanceGetNutritionalGuidanceBlogBySubCategorieIdModel =
        await ApiMethods.guidanceGetNutritionalGuidanceBlogBySubCategorieId(
            bodyParams: bodyParams);
    if (guidanceGetNutritionalGuidanceBlogBySubCategorieIdModel != null &&
        guidanceGetNutritionalGuidanceBlogBySubCategorieIdModel!
            .result!.isNotEmpty) {
      result = guidanceGetNutritionalGuidanceBlogBySubCategorieIdModel!.result!;
    }
  }
}
