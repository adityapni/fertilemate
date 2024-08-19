import 'package:fertility_boost/app/data/apis/api_models/get_cycle_tracking_data_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_temperature_history_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/Graph.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/GraphModel.dart';

class CycleTrackingCalendarDetailController extends GetxController {
  List<TemperatureHistoryData> temperatureList = [];
  Map<String, String?> parameters = Get.parameters;
  final presentTemperatureData = false.obs;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  DateTime? rangeStart;
  DateTime? rangeEnd;
  var average = 0.0;
  List<BarData> bardatax = [];
  final kToday = DateTime.now();
  final kFirstDay = DateTime(
      DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);
  final kLastDay = DateTime(
      DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);

  List<DateTime> highlightedDates = [];
  final count = 0.obs;
  final inAsyncCall = false.obs;
  CostListRes? profileRes;
  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    getCycleTrackingDataHistoryApi();
    await getCycleTrackingUltrasoundTemperatureHistoryApi();
    await getGraphData();
    inAsyncCall.value = false;
  }

  getGraphData() {
    var profileResdatat = {
      "message": "Cost details retrieved successfully",
      "status": "1",
      "years": [
        {
          "name": "2023",
          "data": [
            {
              "id": "9",
              "client_id": "21",
              "year": "2023",
              "month": "january",
              "month_code": "0",
              "created_at": "2024-01-01 04:58:11",
              "updated_at": "2024-01-01 04:58:11",
              "amount": "6000.00"
            },
            {
              "id": "10",
              "client_id": "21",
              "year": "2023",
              "month": "february",
              "month_code": "1",
              "created_at": "2024-01-01 04:59:16",
              "updated_at": "2024-01-01 04:59:16",
              "amount": "3000.00"
            },
            {
              "id": "11",
              "client_id": "21",
              "year": "2023",
              "month": "march",
              "month_code": "2",
              "created_at": "2024-01-01 04:59:27",
              "updated_at": "2024-01-01 04:59:27",
              "amount": "3000.00"
            }
          ],
          "grand_total": {
            "client_id": "21",
            "year": "2023",
            "total": "12,000.00",
            "average": "4,000.00"
          }
        }
      ]
    };
    profileRes = CostListRes.fromJson(profileResdatat);
    for (int index = 0; index < profileRes!.years!.length; index++)
      if (profileRes!.years!.isNotEmpty) {
        profileRes!.years![index].data!
            .sort((a, b) => a.monthCode!.compareTo(b.monthCode!));
        List<double> number = [];
        for (var age in profileRes!.years![index].data!) {
          bardatax.add(BarData(
              xAxes: age.monthCode!,
              yAxes: age.amount!,
              barWidth: 15,
              color: appColorCost,
              xText: age.month!,
              yText: age.amount!.toString()));
          number.add(age.amount!);
        }
        average = calculateAndCompliment(number);
      }
  }

  double calculateAndCompliment(List<double> values) {
    double sumValues = values.reduce((a, b) => a + b);

    double countValues = values.length.toDouble();
    double average = sumValues / countValues;
    return average;
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
  void clickOnCalendar() async {
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? ''
    };
    await Get.toNamed(Routes.CYCLE_TRACKING_ADD_CYCLE_DATA, parameters: data);
    getCycleTrackingDataHistoryApi();
  }

  void clickOnAddReadingButton() async {
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? ''
    };
    await Get.toNamed(Routes.CYCLE_TRACKING_ADD_TEMPERATURE, parameters: data);
    inAsyncCall.value = true;
    getCycleTrackingUltrasoundTemperatureHistoryApi();
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
    inAsyncCall.value = false;
  }

  Future<void> getCycleTrackingDataHistoryApi() async {
    Map<String, dynamic> queryParameters = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]
    };
    GetCycleTrackingDataModel? getCycleTrackingDataModel =
        await ApiMethods.getCycleTrackingDataHistory(
            bodyParams: queryParameters);
    if (getCycleTrackingDataModel != null &&
        getCycleTrackingDataModel.data != null &&
        getCycleTrackingDataModel.data!.isNotEmpty) {
      for (int i = 0; i < getCycleTrackingDataModel.data!.length; i++) {
        DateFormat format = DateFormat("yyyy-MM-dd");
        DateTime dateTime =
            format.parse(getCycleTrackingDataModel.data![i].startDate!);
        highlightedDates.add(dateTime);
      }
      increment();
    }
  }
}
