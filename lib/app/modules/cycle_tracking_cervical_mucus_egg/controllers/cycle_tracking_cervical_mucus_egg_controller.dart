import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/alert_dialog_view.dart';
import '../../../../common/date_picker_view.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_cervical_mucus_history_model.dart';
import '../../../data/constants/string_constants.dart';

class CycleTrackingCervicalMucusEggController extends GetxController {
  TextEditingController notesController = TextEditingController();
  TextEditingController datePickerController = TextEditingController();
  List<bool> selectedCervicalStatus = List<bool>.generate(5, (index) => false);
  List<String> titleList = ['Dry', 'Sticky', 'Creamy', 'Watery', 'Egg White'];
  List<GetCervicalMucusHistoryData> historyList = [];
  final presentCervicalData = false.obs;
  final btnLoading = false.obs;
  final count = 0.obs;
  final inAsyncCall = false.obs;
  Map<String, String?> parameter = Get.parameters;
  @override
  void onInit() {
    super.onInit();
    getCycleTrackingCervicalMucusHistoryApi();
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
    if (datePickerController.text.isNotEmpty &&
        notesController.text.isNotEmpty) {
      btnLoading.value = true;
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.userId: parameter[ApiKeyConstants.userId],
        ApiKeyConstants.date: datePickerController.text.toString(),
        ApiKeyConstants.conditionData: getTracker(),
        ApiKeyConstants.remark: notesController.text.toString()
      };
      http.Response? response =
          await ApiMethods.cycleTrackingAddCervicalMucusEgg(
              bodyParams: bodyParams);
      if (response != null && response.statusCode == 200) {
        Get.back();
      }
      btnLoading.value = false;
    } else {
      CommonWidgets.snackBarView(title: 'Please fill all the fields');
    }
  }

  String getTracker() {
    String conditionData = '';
    for (int i = 0; i < selectedCervicalStatus.length; i++) {
      if (selectedCervicalStatus[i]) {
        conditionData += titleList[i] + ',';
      }
    }

    return conditionData;
  }

  clickOnDate() async {
    final DateTime? picked =
        await PickDate.pickDateView(color: Theme.of(Get.context!).primaryColor);
    if (picked != null) {
      datePickerController.text = DateFormat.yMMMMd().format(picked).toString();
      increment();
    }
  }

  Future<void> getCycleTrackingCervicalMucusHistoryApi() async {
    Map<String, dynamic> queryParameters = {
      ApiKeyConstants.userId: parameter[ApiKeyConstants.userId]
    };
    GetCervicalMucusHistoryModel? getCervicalMucusHistoryModel =
        await ApiMethods.getCycleTrackingAddCervicalMucusEggHistory(
            bodyParams: queryParameters);
    if (getCervicalMucusHistoryModel != null &&
        getCervicalMucusHistoryModel.data != null &&
        getCervicalMucusHistoryModel.data!.isNotEmpty) {
      print("Successfully get...");
      historyList = getCervicalMucusHistoryModel.data!;
      presentCervicalData.value = true;
    } else {
      presentCervicalData.value = false;
      print("failed get...");
    }
  }

  deleteCervicalMucusEgg(int index) async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.id: historyList[index].id,
    };
    presentCervicalData.value = false;
    http.Response? res = await ApiMethods.cycleTrackingDeleteCervicalMucusEgg(
        bodyParams: bodyParams);
    if (res != null && res.statusCode == 200) {
      getCycleTrackingCervicalMucusHistoryApi();
    } else {
      presentCervicalData.value = true;
    }
  }

  void showAlertDialog(int index) {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text(
                StringConstants.yes,
                style: Theme.of(Get.context!)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: 10.px, color: Colors.redAccent),
              ),
              onPressed: () {
                Get.back();
                deleteCervicalMucusEgg(index);
              },
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text(
                StringConstants.no,
                style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
                    fontSize: 10.px,
                    color: Theme.of(Get.context!).primaryColor),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
          title: Text(
            StringConstants.delete,
            style: Theme.of(Get.context!)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 18.px),
          ),
          content: Text(
            StringConstants.doYouWantToDelete,
            style: Theme.of(Get.context!)
                .textTheme
                .titleSmall
                ?.copyWith(fontSize: 14.px),
          ),
        );
      },
    );
  }
}
