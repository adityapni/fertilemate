import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/available_clinics_model.dart';
import '../../../routes/app_pages.dart';

class ClinicsController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  String testId = '';
  String categoryId = '';

  AvailableClinicsModel? availableClinicsModel;
  List<AvailableTest> availableTest = [];
  Map<String, String?> parameters = Get.parameters;

  @override
  Future<void> onInit() async {
    testId = parameters[ApiKeyConstants.testId] ?? '';
    categoryId = parameters[ApiKeyConstants.categoryId] ?? '';
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
      ApiKeyConstants.clinicId: availableTest[index].clinicId.toString(),
      ApiKeyConstants.clinicName: availableTest[index].clinicName.toString(),
    };
    Get.toNamed(Routes.CLINIC_DETAIL, parameters: parameter);
  }

  Future<void> onInitWork() async {
    await availableClinicsApi();
  }

  Future<void> availableClinicsApi() async {
    availableClinicsModel =
        await ApiMethods.availableClinics(queryParameters: parameters);
    if (availableClinicsModel != null &&
        availableClinicsModel!.availableTest != null &&
        availableClinicsModel!.availableTest!.isNotEmpty) {
      availableTest = availableClinicsModel!.availableTest!;
    }
  }
}
