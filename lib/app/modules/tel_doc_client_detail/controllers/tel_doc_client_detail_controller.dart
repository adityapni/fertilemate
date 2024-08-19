import 'package:fertility_boost/app/data/apis/api_models/get_doctor_appointment_details_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import 'package:http/http.dart' as http;

class TelDocClientDetailController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  String appointmentId = '';

  GetDoctorAppointmentDetailsModel? getDoctorAppointmentDetailsModel;

  GetDoctorAppointmentDetailsResult? getDoctorAppointmentDetailsResult;

  Map<String, dynamic> parameters = Get.parameters;

  String isTrainer = '';

  @override
  Future<void> onInit() async {
    appointmentId = parameters[ApiKeyConstants.appointmentId] ?? '';
    isTrainer = parameters[ApiKeyConstants.isTrainer] ?? '';
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


  clickOnChatButton() {
    Map<String, String> parameter = {
      ApiKeyConstants.otherUserId:
          getDoctorAppointmentDetailsResult!.id.toString(),
      ApiKeyConstants.userName:
          getDoctorAppointmentDetailsResult!.userName.toString()
    };
    Get.toNamed(Routes.CHAT, parameters: parameter);
  }

  onInitWork() async {
    await getDoctorAppointmentDetailsApi();
  }

  Future<void> getDoctorAppointmentDetailsApi() async {
    Map<String, dynamic> queryParameters = {
      ApiKeyConstants.appointmentId: appointmentId
    };
    getDoctorAppointmentDetailsModel =
        await ApiMethods.getDoctorAppointmentDetails(
            queryParameters: queryParameters);
    if (getDoctorAppointmentDetailsModel != null &&
        getDoctorAppointmentDetailsModel!.getDoctorAppointmentDetailsResult !=
            null) {
      getDoctorAppointmentDetailsResult =
          getDoctorAppointmentDetailsModel!.getDoctorAppointmentDetailsResult!;
    }
  }

  clickOnAcceptButton({String? type = ApiKeyConstants.accepted}) async {
    inAsyncCall.value = true;
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.bookingId: appointmentId,
      ApiKeyConstants.trainerId: appointmentId,
      ApiKeyConstants.bookingStatus: type,
    };
    http.Response? response =
        await ApiMethods.updateBookingAppointment(bodyParams: bodyParams);
    if (response != null && response.statusCode == 200) {
      Get.back();
    }
    inAsyncCall.value = false;
  }
}
