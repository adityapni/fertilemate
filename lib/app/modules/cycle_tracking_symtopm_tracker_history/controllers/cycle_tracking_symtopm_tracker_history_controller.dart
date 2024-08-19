import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_period_symtoms_history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/alert_dialog_view.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class CycleTrackingSymtopmTrackerHistoryController extends GetxController {
  //TODO: Implement CycleTrackingSymtopmTrackerHistoryController

  List<Map<String, String>> list = [
    {"date": "2021-01-01", "symptoms": "Cramps,Headaches,Fatigue"},
    {"date": "2021-01-01", "symptoms": "Cramps,Headaches,Fatigue"},
    {"date": "2021-01-01", "symptoms": "Cramps,Headaches,Fatigue"},
  ];
  Map<String, String?> parameters = Get.parameters;
  List<PeriodSymtomsHistoryDoctor> periodSymptomsList = [];
  final inAsyncCall = true.obs;
  final historyPresent = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getCycleTrackingPeriodSymptomsHistoryApi();
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

  void clickOnAddSymptomsRecord() async {
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? ''
    };
    await Get.toNamed(Routes.CYCLE_TRACKING_ADD_SYMTOPM_TRACKER,
        parameters: data);
    inAsyncCall.value = true;
    getCycleTrackingPeriodSymptomsHistoryApi();
  }

  Future<void> getCycleTrackingPeriodSymptomsHistoryApi() async {
    Map<String, dynamic> queryParameters = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]
    };
    PeriodSymtomsHistoryModel? periodSymtomsHistoryModel =
        await ApiMethods.getCycleTrackingPeriodSymptomHistory(
            queryParameters: queryParameters);
    if (periodSymtomsHistoryModel != null &&
        periodSymtomsHistoryModel.doctor != null &&
        periodSymtomsHistoryModel.doctor!.isNotEmpty) {
      periodSymptomsList = periodSymtomsHistoryModel.doctor!;
      historyPresent.value = true;
    } else {
      historyPresent.value = false;
    }
    inAsyncCall.value = false;
  }

  deleteSymtopmPeriod(int index) async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.id: periodSymptomsList[index].id,
    };
    historyPresent.value = false;
    http.Response? res = await ApiMethods.cycleTrackingDeleteSymtomTracker(
        bodyParams: bodyParams);
    if (res != null && res.statusCode == 200) {
      getCycleTrackingPeriodSymptomsHistoryApi();
    } else {
      historyPresent.value = true;
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
                deleteSymtopmPeriod(index);
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
