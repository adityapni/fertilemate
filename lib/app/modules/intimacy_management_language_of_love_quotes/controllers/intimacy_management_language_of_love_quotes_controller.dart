import 'package:fertility_boost/app/data/apis/api_models/love_language_get_love_language_model.dart';
import 'package:get/get.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../routes/app_pages.dart';

class IntimacyManagementLanguageOfLoveQuotesController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  LoveLanguageGetLoveLanguageModel? loveLanguageGetLoveLanguageModel;

  List<Result> result = [];

  Map<String, String> parameters = {};

  Future<void> loveLanguageGetLoveLanguageApi() async {
    loveLanguageGetLoveLanguageModel =
        await ApiMethods.loveLanguageGetLoveLanguage();
    if (loveLanguageGetLoveLanguageModel != null &&
        loveLanguageGetLoveLanguageModel!.result!.isNotEmpty) {
      result = loveLanguageGetLoveLanguageModel!.result!;
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    await loveLanguageGetLoveLanguageApi();
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

  clickOnExploreButton() {
    parameters = {
      ApiKeyConstants.loveLanguageId: result.first.id.toString(),
      ApiKeyConstants.title: result.first.name.toString()
    };
    Get.toNamed(Routes.INTIMACY_MANAGEMENT_LOVE_LANGUAGE_SUB_CATEGORY,
        parameters: parameters);
  }

  clickOnCard({required int index}) {
    parameters = {
      ApiKeyConstants.loveLanguageId: result[index].id.toString(),
      ApiKeyConstants.title: result[index].name.toString()
    };
    Get.toNamed(Routes.INTIMACY_MANAGEMENT_LOVE_LANGUAGE_SUB_CATEGORY,
        parameters: parameters);
  }
}
