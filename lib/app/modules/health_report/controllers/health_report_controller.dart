import 'dart:convert';
import 'dart:io';

import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';

class HealthReportController extends GetxController{

  TextEditingController bloodNameController = TextEditingController();
  TextEditingController bloodController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController reportDateController = TextEditingController();
  TextEditingController documentController = TextEditingController();
  RxString type = ''.obs;
  Rxn<File> file = Rxn<File>();
  Rxn<DateTime> reportDate = Rxn<DateTime>();


  Future<String> onSubmitClicked() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';

    Map<String,String> bodyParams = {
      'user_id': userId,
      'blood_name': bloodNameController.text,
      'report_date': reportDate.value.toString(),
      'blood': bloodController.text,
      'type': type.value,
      'file_name': documentController.text
    };
    final response = await ApiMethods.sendHealthAssessmentReport(
        bodyParams: bodyParams,image: file.value, imageKey: ApiKeyConstants.image);
    if (response == null){
      return 'Error while sending report';
    }
    final json = jsonDecode(response.body);
    return json['message'];
  }

}