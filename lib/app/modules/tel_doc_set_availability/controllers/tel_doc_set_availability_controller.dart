import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/time_picker_view.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class TelDocSetAvailabilityController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;
  final selectedDayId = '1'.obs;
  final selectedTime = '00 : 00 PM'.obs;

  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController otherController = TextEditingController();

  List<Map<String, String>> availabilityList = [
    {"id": "1", "day": "Monday"},
    {"id": "2", "day": "Tuesday"},
    {"id": "3", "day": "Wednesday"},
    {"id": "4", "day": "Thursday"},
    {"id": "5", "day": "Friday"},
    {"id": "6", "day": "Saturday"},
    {"id": "7", "day": "Sunday"},
  ];
  DateTime date = DateTime.now();

  String userId = '';

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
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

  clickOnSetNow() async {
    if (startTimeController.text == '' && startTimeController.text == '') {
      CommonWidgets.snackBarView(title: "please select time");
    } else {
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.doctorId: userId,
        ApiKeyConstants.availabilityTime:
            "${startTimeController.text} To ${endTimeController.text}",
        ApiKeyConstants.availabilityDate: date.toString(),
        ApiKeyConstants.availabilityType: otherController.text,
      };
      http.Response? res =
          await ApiMethods.addDoctorAvailability(bodyParams: bodyParams);
      if (res != null && res.statusCode == 200) {
        Get.back();
      }
    }
  }

  clickOnTime({required String type}) async {
    TimeOfDay? picked = await TimePickerView().timePickerView(
      color: Theme.of(Get.context!).primaryColor,
    );
    if (picked != null) {
      selectedTime.value = picked.format(Get.context!);
      if (type == 'start') {
        startTimeController.text = selectedTime.value;
      } else {
        endTimeController.text = selectedTime.value;
      }
      increment();
    }
  }

  Future<void> editDoctorAvailability() async {
    Map<String, String> bodyParams = {
      ApiKeyConstants.doctorId: userId,
      ApiKeyConstants.dayId: selectedDayId.value,
      ApiKeyConstants.time: (startTimeController.text.isNotEmpty &&
              endTimeController.text.isNotEmpty)
          ? "${startTimeController.text} - ${endTimeController.text}"
          : "Close",
      ApiKeyConstants.other: otherController.text,
    };
    inAsyncCall.value = true;
    http.Response? res =
        await ApiMethods.editDoctorAvailability(queryParameters: bodyParams);
    if (res != null && res.statusCode == 200) {
      CommonWidgets.snackBarView(title: "Successfully update availability ...");
      startTimeController.text = '';
      endTimeController.text = '';
      otherController.text = '';
      increment();
    }
    inAsyncCall.value = false;
  }
}
