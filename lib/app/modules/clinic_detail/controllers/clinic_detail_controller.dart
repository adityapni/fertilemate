import 'dart:convert';

import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/available_clinics_get_available_clinics_by_id_model.dart';
import '../../../data/constants/string_constants.dart';

class ClinicDetailController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  Map<String, String> bodyParams = {};
  String clinicId = '';

  Map<String, String?> parameters = Get.parameters;

  String title = '';

  AvailableClinicsGetAvailableClinicsByIdModel?
      availableClinicsGetAvailableClinicsByIdModel;
  Category? category;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController icNoController = TextEditingController();
  TextEditingController telNoController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  List listOfTextTitle = [
    {
      'hint': StringConstants.fullName,
    },
    {
      'hint': StringConstants.icNo,
    },
    {
      'hint': StringConstants.telNo,
    },
    {
      'hint': StringConstants.dateOfBirth,
    },
    {
      'hint': StringConstants.gender,
    },
    {
      'hint': StringConstants.age,
    },
    {
      'hint': StringConstants.email,
    },
  ];

  List selectedTestList = [];
  List selectedTestListAmount = [];

  @override
  Future<void> onInit() async {
    clinicId = parameters[ApiKeyConstants.clinicId] ?? '';
    title = parameters[ApiKeyConstants.clinicName] ?? '';
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

  Future<void> onInitWork() async {
    await availableClinicsGetAvailableClinicsByIdApi();
  }

  Future<void> availableClinicsGetAvailableClinicsByIdApi() async {
    bodyParams = {ApiKeyConstants.clinicId: clinicId.toString()};
    availableClinicsGetAvailableClinicsByIdModel =
        await ApiMethods.availableClinicsGetAvailableClinicsById(
            bodyParams: bodyParams);
    if (availableClinicsGetAvailableClinicsByIdModel != null &&
        availableClinicsGetAvailableClinicsByIdModel!.category != null) {
      category = availableClinicsGetAvailableClinicsByIdModel!.category!;
    }
  }

  clickOnCheckOutButton() async {
    if (fullNameController.text.isNotEmpty &&
        icNoController.text.isNotEmpty &&
        telNoController.text.isNotEmpty &&
        dateOfBirthController.text.isNotEmpty &&
        genderController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      if (selectedTestList.isNotEmpty && selectedTestListAmount.isNotEmpty) {
        inAsyncCall.value = true;
        bodyParams = {
          ApiKeyConstants.clinicId: clinicId,
          ApiKeyConstants.fullName: fullNameController.text,
          ApiKeyConstants.icNo: icNoController.text,
          ApiKeyConstants.telNo: telNoController.text,
          ApiKeyConstants.dob: dateOfBirthController.text,
          ApiKeyConstants.gender: genderController.text,
          ApiKeyConstants.age: ageController.text,
          ApiKeyConstants.email: emailController.text,
          ApiKeyConstants.selectedPackage: selectedTestList.join(","),
          ApiKeyConstants.amount: selectedTestListAmount
              .reduce((a, b) => int.parse(a) + int.parse(b))
              .toString(),
        };
        http.Response? res =
            await ApiMethods.testDataFromClinic(bodyParams: bodyParams);
        if (res != null) {
          Map<String, String> parameter = {
            ApiKeyConstants.trainerId: '',
            ApiKeyConstants.bookingType: ApiKeyConstants.tvsScan,
            ApiKeyConstants.consultantfee: (category != null &&
                    category!.consultan != null &&
                    category!.consultan!.isNotEmpty)
                ? category!.consultan!
                : selectedTestListAmount
                    .reduce((a, b) => int.parse(a) + int.parse(b))
                    .toString(),
            ApiKeyConstants.title: title,
            ApiKeyConstants.description: category?.serviceAddress ?? '',
            ApiKeyConstants.testDataFromClinicId:
                jsonDecode(res.body)['id'] ?? '',
            /*ApiKeyConstants.amount: selectedTestListAmount
                .reduce((a, b) => int.parse(a) + int.parse(b))
                .toString(),*/
          };
          Get.toNamed(Routes.BOOKING_BY_CALENDAR, parameters: parameter);
        }
        inAsyncCall.value = false;
      } else {
        CommonWidgets.snackBarView(title: 'Package required');
      }
    } else {
      CommonWidgets.snackBarView(title: 'All field required');
    }
  }
}
