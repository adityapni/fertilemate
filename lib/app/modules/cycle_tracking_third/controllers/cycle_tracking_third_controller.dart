import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/cycle_tracking_option_model.dart';
import '../../../routes/app_pages.dart';

class CycleTrackingThirdController extends GetxController {
  final count = 0.obs;

  final selectedCard = 0.obs;
  final inAsyncCall = false.obs;
  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  String id = '';
  String title = '';

  CycleTrackingOptionModel? cycleTrackingOptionModel;
  List<Result> result = [];

  @override
  Future<void> onInit() async {
    id = parameters[ApiKeyConstants.id].toString();
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

  clickOnListTile({required int index}) {
    selectedCard.value = index;
  }

  clickOnContinueButton() {
    Map<String, String> parameter = {
      ApiKeyConstants.id: result[selectedCard.value].id.toString()
    };
    Get.toNamed(Routes.CYCLE_TRACKING_FORTH, parameters: parameter);
  }

  Future<void> onInitWork() async {
    await subCategoriesByCategoryIdApi();
  }

  Future<void> subCategoriesByCategoryIdApi() async {
    bodyParams = {ApiKeyConstants.cycleTrackingId: id.toString()};
    cycleTrackingOptionModel =
        await ApiMethods.cycleTrackingOption(bodyParams: bodyParams);
    if (cycleTrackingOptionModel != null &&
        cycleTrackingOptionModel!.result!.isNotEmpty) {
      result = cycleTrackingOptionModel!.result!;
    }
  }
}
