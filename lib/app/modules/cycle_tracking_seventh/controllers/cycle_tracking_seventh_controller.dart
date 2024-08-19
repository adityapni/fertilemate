import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_insights_model.dart';

class CycleTrackingSeventhController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  final selectedCard = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  String id = '';
  String title = '';

  GetInsightsModel? getInsightsModel;
  List<Data> data = [];

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

  Future<void> onInitWork() async {
    await getInsightsApi();
  }

  Future<void> getInsightsApi() async {
    getInsightsModel = await ApiMethods.getInsights();
    if (getInsightsModel != null && getInsightsModel!.data!.isNotEmpty) {
      data = getInsightsModel!.data!;
    }
  }

  clickOnListTile({required int index}) {
    selectedCard.value = index;
  }

  clickOnContinueButton() {
    Get.toNamed(Routes.CYCLE_TRACKING_EIGHTH);
  }
}
