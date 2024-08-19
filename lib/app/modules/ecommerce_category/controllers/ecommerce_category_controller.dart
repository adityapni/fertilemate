import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/categories_by_main_category_id_model.dart';

class EcommerceCategoryController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  CategoriesByMainCategoryIdModel? categoriesByMainCategoryIdModel;
  List<Data> data = [];
  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  String mainCategoryId = '';

  @override
  Future<void> onInit() async {
    mainCategoryId = parameters[ApiKeyConstants.mainCategoryId].toString();
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
    Map<String, String> parameter = {
      ApiKeyConstants.categoryId: data[index].categoryId.toString(),
      ApiKeyConstants.categoryName: data[index].categoryName.toString(),
    };
    Get.toNamed(Routes.ECOMMERCE_PRODUCTS, parameters: parameter);
  }

  Future<void> onInitWork() async {
    await categoriesByMainCategoryIdApi();
  }

  Future<void> categoriesByMainCategoryIdApi() async {
    bodyParams = {ApiKeyConstants.mainCategoryId: mainCategoryId.toString()};
    categoriesByMainCategoryIdModel =
        await ApiMethods.categoriesByMainCategoryId(bodyParams: bodyParams);
    if (categoriesByMainCategoryIdModel != null &&
        categoriesByMainCategoryIdModel!.data!.isNotEmpty) {
      data = categoriesByMainCategoryIdModel!.data!;
    }
  }
}
