import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/expert_consultation_get_expert_consultation_doctors_by_categories_model.dart';
import '../../../data/constants/string_constants.dart';

class ExpertConsultationDiscoverController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  ExpertConsultationGetExpertConsultationDoctorsByCategoriesModel?
      expertConsultationGetExpertConsultationDoctorsByCategoriesModel;
  List<Result> result = [];

  SharedPreferences? sharedPreferences;

  final expertConsultation = ''.obs;
  String expertConsultationCategoriesId = '';
  String findCoachCategoryId = '';
  String title = '';

  Map<String, dynamic> queryParameters = {};
  Map<String, String?> parameters = Get.parameters;

  @override
  Future<void> onInit() async {
    findCoachCategoryId = parameters[ApiKeyConstants.findCoachCategoryId] ?? '';
    title = parameters[ApiKeyConstants.title] ?? '';
    sharedPreferences = await SharedPreferences.getInstance();
    expertConsultation.value =
        sharedPreferences?.getString(StringConstants.expertConsultation) ?? '';
    expertConsultationCategoriesId = sharedPreferences
            ?.getString(ApiKeyConstants.expertConsultationCategoriesId) ??
        '';
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

  clickOnBookButton({required int index}) {
    Map<String, String> parameters = {
      ApiKeyConstants.doctorId: result[index].id.toString(),
    };
    Get.toNamed(Routes.EXPERT_CONSULTATION_COACH_PROFILE,
        parameters: parameters);
  }

  Future<void> onInitWork() async {
    await expertConsultationGetExpertConsultationDoctorsByCategoriesApi();
  }

  Future<void>
      expertConsultationGetExpertConsultationDoctorsByCategoriesApi() async {
    queryParameters = {
      ApiKeyConstants.expertConsultationCategoriesId:
          expertConsultationCategoriesId,
      ApiKeyConstants.findCoachCategoryId: findCoachCategoryId,
    };
    result.clear();
    expertConsultationGetExpertConsultationDoctorsByCategoriesModel =
        await ApiMethods
            .expertConsultationGetExpertConsultationDoctorsByCategories(
                queryParameters: queryParameters);
    if (expertConsultationGetExpertConsultationDoctorsByCategoriesModel !=
            null &&
        expertConsultationGetExpertConsultationDoctorsByCategoriesModel!
                .result !=
            null &&
        expertConsultationGetExpertConsultationDoctorsByCategoriesModel!
            .result!.isNotEmpty) {
      result = expertConsultationGetExpertConsultationDoctorsByCategoriesModel!
          .result!;
    }
  }

  clickOnViewProfileButton({required int index}) {
    Map<String, String> parameters = {
      ApiKeyConstants.doctorId: result[index].id.toString(),
    };
    Get.toNamed(Routes.EXPERT_CONSULTATION_COACH_PROFILE,
        parameters: parameters);
  }
}
