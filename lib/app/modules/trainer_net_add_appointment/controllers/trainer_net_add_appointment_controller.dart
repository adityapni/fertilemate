import 'package:fertility_boost/app/data/apis/api_models/personal_trainer_category.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/date_picker_view.dart';
import '../../../../common/time_picker_view.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/personal_trainer_list.dart';
import '../../../data/constants/string_constants.dart';

class TrainerNetAddAppointmentController extends GetxController {
  List listOfTextTitle = [
    {
      'hint': StringConstants.email,
    },
    {
      'hint': StringConstants.fullName,
    },
    {
      'hint': StringConstants.clientsPhoneNumber,
    },
    {
      'hint': StringConstants.amount,
    },
    {
      'hint': StringConstants.description,
    },
    {
      'hint': StringConstants.clientsSurName,
    },
  ];

  final formKey = GlobalKey<FormState>();
  final inAsyncCall = false.obs;
  PersonalTrainerGetPersonalTrainerModel?
      personalTrainerGetPersonalTrainerModel;
  List<PersonalTrainerData>? personalTrainerData;

  List<Data> data = [];

  final count = 0.obs;
  Map<String, dynamic> bodyParams = {};
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController clientsPhoneNumberController = TextEditingController();
  TextEditingController clientsSurNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController doctorsBookingDoctorsIdController =
      TextEditingController();
  TextEditingController personalTrainerCatIdController =
      TextEditingController();
  TextEditingController doctorsBookingDateController = TextEditingController();
  TextEditingController doctorsBookingTimeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String userId = '';

  DateTime selectedDate = DateTime.now();

  TextEditingController pickUpDateController = TextEditingController();

  Object? selectedRadio;
  Object? selectedRadioTrainersCategory;
  SharedPreferences? prefs;

  PersonalTrainerGetPersonalTrainerCategoryModel?
      personalTrainerGetPersonalTrainerCategoryModel;

  Map<String, dynamic> queryParameters = {};
  final personalTrainerCategoryId = ''.obs;

  @override
  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();
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

  clickOnAddAppointmentButton() async {
    inAsyncCall.value = true;
    await doctorsBookingExtraBookingAddApi();
    inAsyncCall.value = false;
  }

  Future<void> doctorsBookingExtraBookingAddApi() async {
    if (doctorsBookingDateController.text.isNotEmpty &&
        doctorsBookingTimeController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        clientsSurNameController.text.isNotEmpty &&
        clientsPhoneNumberController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        amountController.text.isNotEmpty) {
      bodyParams = {
        ApiKeyConstants.doctorsBookingDoctorsId:
            prefs?.getString(ApiKeyConstants.userId),
        ApiKeyConstants.doctorsBookingDate:
            doctorsBookingDateController.text.toString(),
        ApiKeyConstants.doctorsBookingTime:
            doctorsBookingTimeController.text.toString(),
        ApiKeyConstants.name: firstNameController.text.toString(),
        ApiKeyConstants.email: emailController.text.toString(),
        // ApiKeyConstants.clientSurname: clientsSurNameController.text.toString(),
        ApiKeyConstants.clientNumber:
            clientsPhoneNumberController.text.toString(),
        ApiKeyConstants.amount: amountController.text.toString(),
        ApiKeyConstants.description: descriptionController.text.toString(),
        ApiKeyConstants.personalTrainerCatId: '3',
      };
      http.Response? response = await ApiMethods.doctorsBookingExtraBookingAdd(
          bodyParams: bodyParams);
      if (response != null) {
        Get.back();
      }
    } else {
      CommonWidgets.snackBarView(title: 'All Fields Required');
    }
  }

  clickOnTime() async {
    TimeOfDay? picked = await TimePickerView()
        .timePickerView(color: Theme.of(Get.context!).primaryColor);
    if (picked != null) {
      doctorsBookingTimeController.text = picked.format(Get.context!);
    }
  }

  Future<void> onInitWork() async {
    await getPersonalTrainerListApi();
  }

  getPersonalTrainerListApi() async {
    queryParameters = {
      ApiKeyConstants.personalTrainerCategoryId: personalTrainerCategoryId.value
    };
    personalTrainerGetPersonalTrainerModel =
        await ApiMethods.getPersonalTrainerList(
            queryParameters: queryParameters);
    if (personalTrainerGetPersonalTrainerModel != null &&
        personalTrainerGetPersonalTrainerModel!.personalTrainerData != null &&
        personalTrainerGetPersonalTrainerModel!
            .personalTrainerData!.isNotEmpty) {
      personalTrainerData =
          personalTrainerGetPersonalTrainerModel!.personalTrainerData!;
    }
  }

  getPersonalTrainerCategoryApi() async {
    /*personalTrainerGetPersonalTrainerCategoryModel =
        await ApiMethods.getPersonalTrainerCategory(queryParameters: );
    if (personalTrainerGetPersonalTrainerCategoryModel != null &&
        personalTrainerGetPersonalTrainerCategoryModel!.data != null &&
        personalTrainerGetPersonalTrainerCategoryModel!.data!.isNotEmpty) {
      data = personalTrainerGetPersonalTrainerCategoryModel!.data!;
    }*/
  }

  clickOnDate() async {
    final DateTime? picked =
        await PickDate.pickDateView(color: Theme.of(Get.context!).primaryColor);
    if (picked != null) {
      doctorsBookingDateController.text =
          DateFormat.yMMMMd().format(picked).toString();
      increment();
    }
  }
}
