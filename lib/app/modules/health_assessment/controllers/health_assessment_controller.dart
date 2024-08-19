import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/categories_by_main_category_id_model.dart';

class HealthAssessmentController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  CategoriesByMainCategoryIdModel? categoriesByMainCategoryIdModel;
  List<Data> data = [];
  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  String mainCategoryId = '';

  final selectedCard = 0.obs;

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
    selectedCard.value = index;
    Map<String, String> parameter = {
      ApiKeyConstants.categoryId: data[index].categoryId.toString(),
      StringConstants.title: data[index].categoryName.toString(),
    };
    switch (index) {
      case 0:
        Get.toNamed(Routes.FERTILITY_ASSESSMENT, parameters: parameter);
        break;
      case 1:
        Get.toNamed(Routes.HORMONE_BLOOD_TEST, parameters: parameter);
        break;
      case 2:
        Get.toNamed(Routes.GENERAL_WELLNESS_BLOOD_TEST, parameters: parameter);
        break;
      case 3:
        Get.toNamed(Routes.TVS_SCAN_PACKAGE_DASHBORD, parameters: parameter);
        break;
      case 4:
        Get.toNamed(Routes.SPERM_TEST_PACKAGE, parameters: parameter);
        break;
      case 5:
        Get.toNamed(Routes.FERTILITY_HOME_TEST_KIT, parameters: parameter);
        break;
      default:
        CommonWidgets.snackBarView(title: 'Data not found');
    }
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
