import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/date_picker_view.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class CycleTrackingAddCycleDataController extends GetxController {
  TextEditingController startDateController = TextEditingController();
  TextEditingController periodDurationController = TextEditingController();
  TextEditingController note1Controller = TextEditingController();
  TextEditingController ovulationDateController = TextEditingController();
  TextEditingController note2Controller = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  Map<String, String?> parameters = Get.parameters;
  final kLastDay = DateTime(
      DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);
  final btnLoading = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
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

  void clickOnSaveButton() async {
    if (startDateController.text.isNotEmpty &&
        periodDurationController.text.isNotEmpty) {
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
        ApiKeyConstants.startDate: startDateController.text,
        ApiKeyConstants.periodDuration: periodDurationController.text,
        ApiKeyConstants.notePeriod: note1Controller.text,
        ApiKeyConstants.ovulationDate: ovulationDateController.text,
        ApiKeyConstants.noteOvulation: note2Controller.text,
        ApiKeyConstants.intimateDate: endDateController.text,
      };
      btnLoading.value = true;
      http.Response? res =
          await ApiMethods.cycleTrackingAddCycleData(bodyParams: bodyParams);
      if (res != null && res.statusCode == 200) {
        Get.back();
      }
      btnLoading.value = false;
    } else {
      CommonWidgets.snackBarView(
          title: "Please enter minimum period date and duration ...");
    }
  }

  clickOnDate(int index) async {
    final DateTime? picked =
        await PickDate.pickDateView(color: Theme.of(Get.context!).primaryColor);
    if (picked != null) {
      switch (index) {
        case 0:
          startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
          break;
        case 1:
          ovulationDateController.text =
              DateFormat('yyyy-MM-dd').format(picked);
          break;
        case 2:
          endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
          break;
      }
      increment();
    }
  }
}
