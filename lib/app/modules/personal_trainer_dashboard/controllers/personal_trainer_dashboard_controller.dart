import 'package:fertility_boost/app/data/apis/api_models/get_personal_trainer_details_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';

class PersonalTrainerDashboardController extends GetxController {
  final count = 0.obs;

  String otherUserId = '';
  final expertConsultation = ''.obs;
  final inAsyncCall = false.obs;
  SharedPreferences? sharedPreferences;

  GetPersonalTrainerDetailsModel? getPersonalTrainerDetailsModel;

  Result? result;

  String personalTrainerId = '';
  Map<String, dynamic> parameters = Get.parameters;

  @override
  Future<void> onInit() async {
    personalTrainerId = parameters[ApiKeyConstants.personalTrainerId] ?? '';
    sharedPreferences = await SharedPreferences.getInstance();
    expertConsultation.value =
        sharedPreferences?.getString(StringConstants.expertConsultation) ?? '';
    print('expertConsultation.value::::::${expertConsultation.value}');
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

  clickOnBookButton() {
    Map<String, String> parameter = {
      ApiKeyConstants.trainerId: result?.id ?? '',
      ApiKeyConstants.bookingType:
          expertConsultation.value == 'Personal Trainer'
              ? ApiKeyConstants.personalTrainer
              : ApiKeyConstants.nutritionist,
      ApiKeyConstants.consultantfee: result?.consultFee ?? '',
      ApiKeyConstants.title: StringConstants.bookYourPersonalTrainingSession,
      ApiKeyConstants.description: 'Certified trainers',
    };
    Get.toNamed(Routes.BOOKING_BY_CALENDAR, parameters: parameter);
  }

  clickOnChatNowButton() async {
    Map<String, String> parameter = {
      ApiKeyConstants.otherUserId: result!.id.toString(),
      ApiKeyConstants.userName: result!.name.toString(),
    };
    await Get.toNamed(Routes.CHAT, parameters: parameter);
  }

  onInitWork() async {
    await getPersonalTrainerDetailsApi();
  }

  Future<void> getPersonalTrainerDetailsApi() async {
    Map<String, dynamic> queryParameters = {
      ApiKeyConstants.personalTrainerId: personalTrainerId
    };
    getPersonalTrainerDetailsModel = await ApiMethods.getPersonalTrainerDetails(
        queryParameters: queryParameters);
    if (getPersonalTrainerDetailsModel != null &&
        getPersonalTrainerDetailsModel!.result != null) {
      result = getPersonalTrainerDetailsModel!.result!;
    }
  }
}
