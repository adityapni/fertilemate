import 'package:another_stepper/dto/stepper_data.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_clinic_notification_details_model.dart';

class LaboratoryAndClinicOrderStatusController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  int activeIndex = 0;

  List<StepperData> stepperData = [
    /* StepperData(
      title: StepperText("Notification received"),
      subtitle: StepperText(
          "You have received a notification for package #2294. 22 August 2022, 9:38 AM."),
    ),
    StepperData(
      title: StepperText("Package location"),
      subtitle: StepperText(
          "The blood sample collection location is: 123 Main Street, City, State. 22 August 2022, 10:15 AM."),
    ),
    StepperData(
      title: StepperText("In progress"),
      subtitle: StepperText("The package is currently being processed."),
    ),
    StepperData(
      title: StepperText("Completed"),
      subtitle: StepperText(
          "The package has been successfully delivered. Please provide your feedback here."),
    ),*/
  ];

  Map<String, String?> parameters = Get.parameters;

  String clinicNotificationsId = '';

  GetClinicNotificationDetailsModel? getClinicNotificationDetailsModel;

  Result? result;

  @override
  Future<void> onInit() async {
    clinicNotificationsId =
        parameters[ApiKeyConstants.clinicNotificationsId] ?? '';
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

  clickOnBackToHomepageButton() {
    Get.toNamed(Routes.EXPERT_CONSULTATION_SUCCESS);
  }

  onInitWork() async {
    await getDoctorAppointmentDetailsApi();
  }

  Future<void> getDoctorAppointmentDetailsApi() async {
    Map<String, dynamic> queryParameters = {
      ApiKeyConstants.clinicNotificationsId: clinicNotificationsId
    };
    getClinicNotificationDetailsModel =
        await ApiMethods.getClinicNotificationDetails(
            queryParameters: queryParameters);
    if (getClinicNotificationDetailsModel != null &&
        getClinicNotificationDetailsModel!.result != null) {
      result = getClinicNotificationDetailsModel!.result!;
      if (result != null &&
          result!.notificationSteps != null &&
          result!.notificationSteps!.isNotEmpty) {
        if (result!.notificationSteps!.isNotEmpty) {
          for (int index = 0;
              index < result!.notificationSteps!.length;
              index++) {
            if (result?.status == result!.notificationSteps![index].status) {
              activeIndex = index;
            }
            stepperData.add(
              StepperData(
                title: StepperText(result!.notificationSteps![index].status.toString()),
                subtitle: StepperText(result!.notificationSteps![index].notification.toString()),
              ),
            );
          }
        }
      }
    }
  }
}
