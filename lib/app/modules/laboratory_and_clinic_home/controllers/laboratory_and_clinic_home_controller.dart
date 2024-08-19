import 'package:fertility_boost/app/data/apis/api_models/get_clinic_notification_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../../nav_bar/controllers/nav_bar_controller.dart';

class LaboratoryAndClinicHomeController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  String id = '';

  GetClinicNotificationModel? getClinicNotificationModel;

  List<Result> result = [];
  String userImage = ImageConstants.defaultNetworkImage;

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
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

  void clickOnMap({required int index}) {
    Map<String, String> parameters = {
      ApiKeyConstants.lat: result[index].userLat.toString(),
      ApiKeyConstants.long: result[index].userLon.toString(),
    };
    Get.toNamed(Routes.LABORATORY_AND_CLINIC_MAP, parameters: parameters);
  }

  onInitWork() async {
    await getDoctorAppointmentDetailsApi();
  }

  Future<void> getDoctorAppointmentDetailsApi() async {
    Map<String, dynamic> queryParameters = {ApiKeyConstants.clinicId: '1'};
    getClinicNotificationModel = await ApiMethods.getClinicNotification(
        queryParameters: queryParameters);
    if (getClinicNotificationModel != null &&
        getClinicNotificationModel!.result != null) {
      result = getClinicNotificationModel!.result!;
    }
  }

  clickOnProfile() {
    Get.toNamed(Routes.PRT_PROFILE);
  }

  clickOnCard({required int index}) {
    Map<String, String> parameters = {
      ApiKeyConstants.clinicNotificationsId: result[index].id.toString()
    };
    Get.toNamed(Routes.LABORATORY_AND_CLINIC_ORDER_STATUS,
        parameters: parameters);
  }

  onWillPop() {
    if (selectedIndex.value == 0) {
      CommonWidgets.showAlertDialog(
        title: StringConstants.exit,
        content: StringConstants.doYouWantToExitAnApp,
        onPressedYes: () => SystemNavigator.pop(),
      );
    } else {
      selectedIndex.value = 0;
    }
  }
}
