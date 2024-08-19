import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/date_picker_view.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class CycleTrackingAddSymtopmTrackerController extends GetxController {
  TextEditingController datePickerController = TextEditingController();
  List<bool> selectedCervicalStatus = List<bool>.generate(3, (index) => false);
  List<String> titleList = ['Headache', 'Cramps', 'Fatigue'];
  final btnLoading = false.obs;
  final selectedIndex = 0.obs;
  final inAsyncCall = false.obs;
  final count = 0.obs;
  SharedPreferences? prefs;
  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
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

  void changeSelectionStatus(int index) {
    selectedCervicalStatus[index] = !selectedCervicalStatus[index];
    increment();
  }

  clickOnSubmitButton() async {
    if (selectedIndex.value != 0 && datePickerController.text.isNotEmpty) {
      inAsyncCall.value = true;
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.userId:
            prefs!.getString(ApiKeyConstants.userId).toString(),
        ApiKeyConstants.date: datePickerController.text.toString(),
        ApiKeyConstants.tracker: getTracker(),
        ApiKeyConstants.mood: selectedIndex.toString()
      };
      http.Response? response = await ApiMethods.cycleTrackingAddSymptomTracker(
          bodyParams: bodyParams);
      if (response != null && response.statusCode == 200) {
        Get.back();
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(
          title: "please enter date, select mood type  and tracker");
    }
  }

  String getTracker() {
    String tracker = '';
    for (int i = 0; i < selectedCervicalStatus.length; i++) {
      if (selectedCervicalStatus[i]) {
        tracker += titleList[i] + ',';
      }
    }
    return tracker;
  }

  clickOnDate() async {
    final DateTime? picked =
        await PickDate.pickDateView(color: Theme.of(Get.context!).primaryColor);
    if (picked != null) {
      datePickerController.text = DateFormat.yMMMMd().format(picked).toString();
      increment();
    }
  }
}
