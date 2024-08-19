import 'package:fertility_boost/app/data/apis/api_models/available_tests_model.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class HormoneBloodTestController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  AvailableTestsModel? availableTestsModel;
  List<AvailableTest> availableTest = [];

  Map<String, String?> parameters = Get.parameters;
  String title = '';
  String categoryId = '';

  @override
  Future<void> onInit() async {
    title = parameters[StringConstants.title] ?? '';
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

  clickOnCard({required int index}) {}

  Future<void> onInitWork() async {
    await availableTestsApi();
  }

  Future<void> availableTestsApi() async {
    availableTestsModel = await ApiMethods.availableTests();
    if (availableTestsModel != null &&
        availableTestsModel!.availableTest != null &&
        availableTestsModel!.availableTest!.isNotEmpty) {
      availableTest = availableTestsModel!.availableTest!;
    }
  }

  clickOnBookNowButton({required int index}) {
    Map<String, String> parameters = {
      ApiKeyConstants.categoryId: categoryId,
      ApiKeyConstants.testId: availableTest[index].testId.toString()
    };
    Get.toNamed(Routes.CLINICS, parameters: parameters);
  }
}
