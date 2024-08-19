import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_intimacy_category_model.dart';

class IntimacyManagementConversationStartersController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  GetIntimacyCategoryModel? getIntimacyCategoryModel;

  List<Result> result = [];

  Map<String, String> parameters = {};

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
      ApiKeyConstants.intimacyCategoryId: result[index].id.toString(),
      ApiKeyConstants.title: result[index].name.toString()
    };
    Get.toNamed(Routes.INTIMACY_MANAGEMENT_CONVERSATION_STARTERS_EXPLORE,
        parameters: parameters);
  }

  clickOnStartNowButton() {
    parameters = {
      ApiKeyConstants.intimacyCategoryId: result.first.id.toString(),
      ApiKeyConstants.title: result.first.name.toString()
    };
    Get.toNamed(Routes.INTIMACY_MANAGEMENT_CONVERSATION_STARTERS_EXPLORE,
        parameters: parameters);
  }

  Future<void> onInitWork() async {
    await getIntimacyCategoryApi();
  }

  Future<void> getIntimacyCategoryApi() async {
    getIntimacyCategoryModel =
        await ApiMethods.intimacyCategoryGetIntimacyCategory();
    if (getIntimacyCategoryModel != null &&
        getIntimacyCategoryModel!.result != null) {
      result = getIntimacyCategoryModel!.result!;
    }
  }
}
