import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/available_clinics_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class SpermTestPackageNearbyClinicsController extends GetxController {
  final inAsyncCall = false.obs;
  final count = 0.obs;
  AvailableClinicsModel? availableClinicsModel;
  List<AvailableTest> availableTest = [];
  Map<String, String?> parameters = Get.parameters;

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

  String title = '';
  String categoryId = '';
  String testId = '';

  @override
  Future<void> onInit() async {
    title = parameters[StringConstants.title] ?? '';
    categoryId = parameters[ApiKeyConstants.categoryId] ?? '';
    testId = parameters[ApiKeyConstants.testId] ?? '';
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

  clickOnProceedButton(String clinicId) {
    Get.toNamed(Routes.SPERM_TEST_PACKAGE_NEARBY_CLINICS_DETAIL, parameters: {
      ApiKeyConstants.clinicId: clinicId,
      ApiKeyConstants.testId: testId
    });
  }
}
