import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_expert_consultation_doctors_details_model.dart';
import '../../../data/constants/string_constants.dart';

class ExpertConsultationCoachProfileController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;
  GetExpertConsultationDoctorsDetailsModel?
      getExpertConsultationDoctorsDetailsModel;
  Result? result;
  Map<String, dynamic> bodyParams = {};
  Map<String, String?> parameters = Get.parameters;
  String doctorId = '';
  SharedPreferences? sharedPreferences;

  String expertConsultation = '';

  getPersonalTrainerList() async {
    bodyParams = {ApiKeyConstants.doctorId: doctorId};
    getExpertConsultationDoctorsDetailsModel =
        await ApiMethods.getExpertConsultationDoctorsDetails(
            queryParameters: bodyParams);
    if (getExpertConsultationDoctorsDetailsModel != null &&
        getExpertConsultationDoctorsDetailsModel!.result != null) {
      result = getExpertConsultationDoctorsDetailsModel!.result!;
    }
    increment();
  }

  @override
  Future<void> onInit() async {
    doctorId = parameters[ApiKeyConstants.doctorId] ?? '';
    sharedPreferences = await SharedPreferences.getInstance();
    expertConsultation =
        sharedPreferences?.getString(StringConstants.expertConsultation) ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getPersonalTrainerList();
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

  clickOnBookNowButton() {
    Map<String, String> parameter = {
      ApiKeyConstants.doctorId: doctorId ?? '',
      ApiKeyConstants.bookingType:
          expertConsultation == 'Telehealth Doctor'
              ? ApiKeyConstants.telehealthDoctor
              : ApiKeyConstants.telehealthMentalDoctor,
      ApiKeyConstants.consultantfee: result?.consultFee ?? '',
      ApiKeyConstants.title: StringConstants.bookYourAppointment,
      ApiKeyConstants.description: 'Choose a $expertConsultation',
    };
    Get.toNamed(Routes.BOOKING_BY_CALENDAR, parameters: parameter);
  }
}
