import 'package:fertility_boost/app/data/apis/api_models/get_find_coach_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';

class ExpertConsultationGetStartController extends GetxController {
  final count = 0.obs;

  SharedPreferences? sharedPreferences;

  final expertConsultation = ''.obs;

  final inAsyncCall = false.obs;

  GetFindCoachModel? getFindCoachApiModel;

  List<Result> result = [];

  Result? selectedRadio;

  @override
  Future<void> onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    expertConsultation.value =
        sharedPreferences?.getString(StringConstants.expertConsultation) ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getFindCoachApi();
    inAsyncCall.value = false;
    increment();
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

  clickOnBookButton() {
    Get.toNamed(Routes.EXPERT_CONSULTATION_DASHBOARD);
  }

  getFindCoachApi() async {
    getFindCoachApiModel = await ApiMethods.getFindCoach();
    if (getFindCoachApiModel != null &&
        getFindCoachApiModel!.result != null &&
        getFindCoachApiModel!.result!.isNotEmpty) {
      result = getFindCoachApiModel!.result!;
      if (result.isNotEmpty) {
        selectedRadio = result.first;
      }
    }
  }
}
