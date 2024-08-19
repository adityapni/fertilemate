import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:fertility_boost/app/data/apis/api_models/SpermBannerModel.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_models/SpermAssessmentModel.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class SpermTestPackageController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  List<Data> banner = [];
  List<SpermAssessmentData> spermAssessmentList = [];

  getBannerData() async {
    SpermBannerModel? SpermBannerlist;
    SpermBannerlist = await ApiMethods.GetSpermBanner();
    if (SpermBannerlist != null && SpermBannerlist.data!.isNotEmpty) {
      banner = SpermBannerlist.data!;
    }
  }

  GetSpermAssessment() async {
    SpermAssessmentModel? SpermAssessmentlist;
    SpermAssessmentlist = await ApiMethods.GetSpermAssessment();
    if (SpermAssessmentlist != null &&
        SpermAssessmentlist.data != null &&
        SpermAssessmentlist.data!.isNotEmpty) {
      spermAssessmentList = SpermAssessmentlist.data!;
    }
  }

  Map<String, String?> parameters = Get.parameters;
  String title = '';
  String categoryId = '';

  @override
  Future<void> onInit() async {
    title = parameters[StringConstants.title] ?? '';
    categoryId = parameters[ApiKeyConstants.categoryId] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getBannerData();
    await GetSpermAssessment();
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
    Get.toNamed(Routes.SPERM_TEST_PACKAGE_NEARBY_CLINICS, parameters: {
      ApiKeyConstants.categoryId: categoryId,
      ApiKeyConstants.testId: clinicId,
    });
  }

  clickOnAppointment() {
    Get.toNamed(Routes.TVS_SCAN_PACKAGE);
  }
}
