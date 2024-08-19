import 'package:get/get.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/sub_categories_by_category_id_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class HealthAssessmentSubCategoryController extends GetxController {
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

  clickOnCard({required int index}) {
    Get.toNamed(Routes.PREDIABETES_ASSESSMENT);
  }
}
