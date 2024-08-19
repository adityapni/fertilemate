import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/alert_dialog_view.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/date_picker_view.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_temperature_history_model.dart';
import '../../../data/constants/string_constants.dart';

class CycleTrackingAddTemperatureController extends GetxController {
  TextEditingController temperatureController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  Map<String, String?> parameters = Get.parameters;
  List<TemperatureHistoryData> temperatureList = [];
  final btnLoading = false.obs;
  final presentTemperatureData = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getCycleTrackingUltrasoundTemperatureHistoryApi();
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
    if (temperatureController.text.isNotEmpty &&
        dateController.text.isNotEmpty) {
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
        ApiKeyConstants.temperature: temperatureController.text,
        ApiKeyConstants.dateTime: dateController.text
      };
      btnLoading.value = true;
      http.Response? res =
          await ApiMethods.cycleTrackingAddTemperature(bodyParams: bodyParams);
      if (res != null && res.statusCode == 200) {
        Get.back();
      }
      btnLoading.value = false;
    } else {
      CommonWidgets.snackBarView(title: "please enter temperature and date.");
    }
  }

  clickOnDate() async {
    final DateTime? picked =
        await PickDate.pickDateView(color: Theme.of(Get.context!).primaryColor);
    if (picked != null) {
      dateController.text = DateFormat('dd-MM-yyyy').format(picked).toString();
      increment();
    }
  }

  Future<void> getCycleTrackingUltrasoundTemperatureHistoryApi() async {
    Map<String, dynamic> queryParameters = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]
    };
    TemperatureHistoryModel? temperatureHistoryModel =
        await ApiMethods.getCycleTrackingTemperatureHistory(
            queryParameters: queryParameters);
    if (temperatureHistoryModel != null &&
        temperatureHistoryModel.doctor != null &&
        temperatureHistoryModel.doctor!.isNotEmpty) {
      temperatureList = temperatureHistoryModel.doctor!;
      presentTemperatureData.value = true;
    } else {
      presentTemperatureData.value = false;
    }
  }

  deleteTemperature(int index) async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.id: temperatureList[index].id,
    };
    presentTemperatureData.value = false;
    http.Response? res =
        await ApiMethods.cycleTrackingDeleteTemperature(bodyParams: bodyParams);
    if (res != null && res.statusCode == 200) {
      getCycleTrackingUltrasoundTemperatureHistoryApi();
    } else {
      presentTemperatureData.value = true;
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
                deleteTemperature(index);
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
