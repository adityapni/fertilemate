import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/categories_by_main_category_id_model.dart';

class LifestyleOptimisationController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  CategoriesByMainCategoryIdModel? categoriesByMainCategoryIdModel;
  List<Data> data = [];
  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  String mainCategoryId = '';
  String steps = '00';
  Map<String, String> parameter = {};
  SharedPreferences? prefs;

  @override
  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();
    mainCategoryId = parameters[ApiKeyConstants.mainCategoryId].toString();
    steps = prefs?.getString(StringConstants.stepsCount) ?? '00';
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
    parameter = {ApiKeyConstants.categoryId: data[index].categoryId.toString()};
    switch (index) {
      case 0:
        Get.toNamed(Routes.PROGRESS_WORKOUT, parameters: parameter);
        break;
      case 1:
        Get.toNamed(Routes.STRESS_MANAGEMENT, parameters: parameter);
        break;
      case 2:
        Get.toNamed(Routes.SLEEP_MANAGEMENT_SPLASH, parameters: parameter);
        break;
      case 3:
        Get.toNamed(Routes.INTIMACY_MANAGEMENT, parameters: parameter);
        break;
      case 4:
        Get.toNamed(Routes.BOOK_WELL_COME, parameters: parameter);
        break;
    }
  }

  clickOnEditButton() {}

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
