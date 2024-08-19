import 'dart:math';

import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/notification.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/categories_by_main_category_id_model.dart';

class NutritionalGuidanceController extends GetxController {
  final count = 0.obs;
  TextEditingController weightForBimController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightForWaterController = TextEditingController();

  Map<String, String> parameter = {};

  final inAsyncCall = false.obs;
  CategoriesByMainCategoryIdModel? categoriesByMainCategoryIdModel;
  List<Data> data = [];
  MainCategory? mainCategory;
  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  String mainCategoryId = '';
  final calculatedBmi = '00.00'.obs;
  final calculatedCategory = 'Severely Underweight'.obs;

  final activityValueController = ''.obs;

  TextEditingController activityController = TextEditingController();
  final activitySelectedIndexValue = 0.obs;
  List listOfActivity = [
    {
      'title': 'sedentary',
      'value': '1.0',
    },
    {
      'title': 'light activity',
      'value': '1.2',
    },
    {
      'title': 'moderate',
      'value': '1.5',
    },
    {
      'title': 'active',
      'value': '1.7',
    },
  ];

  TextEditingController climateController = TextEditingController();
  final climateValueController = ''.obs;
  final climateSelectedIndexValue = 0.obs;
  List listOfClimate = [
    {
      'title': 'Temperature',
      'value': '25.0',
    },
    {
      'title': 'Humidity',
      'value': '70.0',
    },
    {
      'title': 'Wind Speed',
      'value': '15.0',
    },
    {
      'title': 'Air Quality',
      'value': '50.0',
    },
  ];

  double waterIntake = 0.0;

  @override
  Future<void> onInit() async {
    mainCategoryId = parameters[ApiKeyConstants.mainCategoryId].toString();
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

  clickOnStartedButton() {}

  clickOnEnableWaterReminderButton() {
    NotificationService().scheduleNotification(
        title: 'Scheduled Notification',
        body: DateTime.now().toString(),
        scheduledNotificationDateTime: DateTime.now());
  }

  clickOnCard({required int index}) {
    parameter = {
      ApiKeyConstants.categoryId: data[index].categoryId.toString(),
      ApiKeyConstants.title: data[index].categoryName.toString(),
    };
    Get.toNamed(Routes.NUTRITIONAL_GUIDANCE_SUB_CATEGORY,
        parameters: parameter);
  }

  Future<void> onInitWork() async {
    await categoriesByMainCategoryIdApi();
  }

  Future<void> categoriesByMainCategoryIdApi() async {
    bodyParams = {ApiKeyConstants.mainCategoryId: mainCategoryId.toString()};
    categoriesByMainCategoryIdModel =
        await ApiMethods.categoriesByMainCategoryId(bodyParams: bodyParams);
    if (categoriesByMainCategoryIdModel != null) {
      if (categoriesByMainCategoryIdModel!.data!.isNotEmpty) {
        data = categoriesByMainCategoryIdModel!.data!;
      }
      mainCategory = categoriesByMainCategoryIdModel!.mainCategory!;
    }
  }

  void clickOnBmiCalculatorButton() {
    if (weightForBimController.text.trim().isNotEmpty) {
      if (heightController.text.trim().isNotEmpty) {
        double height = double.parse(heightController.text) / 100;
        double weight = double.parse(weightForBimController.text);
        double result = weight / (height * height);
        calculatedBmi.value = result.toStringAsFixed(2);
        categorizeWeight(value: double.parse(calculatedBmi.value));
        increment();
      } else {
        CommonWidgets.snackBarView(title: 'Please Enter Height');
      }
    } else {
      CommonWidgets.snackBarView(title: 'Please Enter Weight');
    }
  }

  void categorizeWeight({required double value}) {
    switch (value) {
      default:
        if (value < 16.0) {
          calculatedCategory.value = 'Severely Underweight';
        } else if (value >= 16.0 && value <= 18.4) {
          calculatedCategory.value = 'Underweight';
        } else if (value >= 18.5 && value <= 24.9) {
          calculatedCategory.value = 'Normal';
        } else if (value >= 25.0 && value <= 29.9) {
          calculatedCategory.value = 'Overweight';
        } else if (value >= 30.0 && value <= 34.9) {
          calculatedCategory.value = 'Moderately Obese';
        } else if (value >= 35.0 && value <= 39.9) {
          calculatedCategory.value = 'Severely Obese';
        } else if (value >= 40.0) {
          calculatedCategory.value = 'Morbidly Obese';
        } else {
          calculatedCategory.value = 'Invalid value';
        }
    }
  }

  clickOnActivityTextField() {
    return showModalBottomSheet(
        context: Get.context!,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(14.px),
            topLeft: Radius.circular(14.px),
          ),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Theme(
                data: ThemeData(),
                child: RadioListTile(
                  activeColor: Theme.of(context).primaryColor,
                  controlAffinity: ListTileControlAffinity.trailing,
                  selected: index == activitySelectedIndexValue.value,
                  groupValue: activityController.text,
                  value: listOfActivity[index]['title'],
                  onChanged: (value) async {
                    if (value != null) {
                      activityValueController.value =
                          listOfActivity[index]['value'];
                      activityController.text = listOfActivity[index]['title'];
                      increment();
                      setState(() {});
                      Get.back();
                    }
                  },
                  title: Text(
                    listOfActivity[index]['title'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14.px),
                  ),
                ),
              ),
              itemCount: listOfActivity.length,
            );
          });
        });
  }

  clickOnClimateTextField() {
    return showModalBottomSheet(
        context: Get.context!,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(14.px),
            topLeft: Radius.circular(14.px),
          ),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Theme(
                data: ThemeData(),
                child: RadioListTile(
                  activeColor: Theme.of(context).primaryColor,
                  controlAffinity: ListTileControlAffinity.trailing,
                  selected: index == climateSelectedIndexValue.value,
                  groupValue: climateController.text,
                  value: listOfClimate[index]['title'],
                  onChanged: (value) async {
                    if (value != null) {
                      climateController.text = listOfClimate[index]['title'];
                      climateValueController.value =
                          listOfClimate[index]['value'];
                      increment();
                      setState(() {});
                      Get.back();
                    }
                  },
                  title: Text(
                    listOfClimate[index]['title'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14.px),
                  ),
                ),
              ),
              itemCount: listOfClimate.length,
            );
          });
        });
  }

  void clickOnCalculatorButton() {
    if (weightForWaterController.text.trim().isNotEmpty) {
      if (activityValueController.value.trim().isNotEmpty) {
        if (climateValueController.value.trim().isNotEmpty) {
          const baseHydrationMultiplier = 0.03;
          waterIntake = double.parse(weightForWaterController.text) *
              baseHydrationMultiplier *
              double.parse(activityValueController.value) *
              double.parse(climateValueController.value);
          waterIntake = max(2.0, min(waterIntake, 4.0));
          increment();
        } else {
          CommonWidgets.snackBarView(title: 'Please select climate');
        }
      } else {
        CommonWidgets.snackBarView(title: 'Please select activity');
      }
    } else {
      CommonWidgets.snackBarView(title: 'Please enter weight');
    }
  }

  clickOnReference() async {
    if (await canLaunch('https://www.calculator.net/bmi-calculator.html')) {
      await launch('https://www.calculator.net/bmi-calculator.html');
    } else {
      throw 'Could not launch ${'https://www.calculator.net/bmi-calculator.html'}';
    }
  }
  clickOnReferenceWaterCalculate() async {
    if (await canLaunch('https://www.medindia.net/patients/calculators/daily-water-requirement.asp')) {
      await launch('https://www.medindia.net/patients/calculators/daily-water-requirement.asp');
    } else {
      throw 'Could not launch ${'https://www.medindia.net/patients/calculators/daily-water-requirement.asp'}';
    }
  }
}
