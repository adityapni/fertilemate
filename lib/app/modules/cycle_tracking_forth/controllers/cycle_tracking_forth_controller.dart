import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:get/get.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/cycle_tracking_sub_option_model.dart';
import '../../../routes/app_pages.dart';

class CycleTrackingForthController extends GetxController {
  final count = 0.obs;

  final selectedCard = 0.obs;
  final inAsyncCall = false.obs;
  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  String id = '';
  String title = '';

  CycleTrackingSubOptionModel? cycleTrackingSubOptionModel;
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
    Get.toNamed(Routes.CYCLE_TRACKING_FIFTH, parameters: parameter);
    // CommonWidgets.snackBarView(title: StringConstants.comingSoon);
  }

  Future<void> onInitWork() async {
    await subCategoriesByCategoryIdApi();
  }

  Future<void> subCategoriesByCategoryIdApi() async {
    bodyParams = {ApiKeyConstants.cycleTrackingSubOptionId: id.toString()};
    cycleTrackingSubOptionModel =
        await ApiMethods.cycleTrackingSubOption(bodyParams: bodyParams);
    if (cycleTrackingSubOptionModel != null &&
        cycleTrackingSubOptionModel!.result!.isNotEmpty) {
      result = cycleTrackingSubOptionModel!.result!;
    }
  }
}
