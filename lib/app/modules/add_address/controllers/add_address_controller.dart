import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';
import 'package:http/http.dart' as http;

class AddAddressController extends GetxController {
  final count = 0.obs;

  List listOfTextTitle = [
    {
      'hint': StringConstants.addressName,
    },
    {
      'hint': StringConstants.addressStreetAddress,
    },
    {
      'hint': StringConstants.addressCity,
    },
    {
      'hint': StringConstants.addressState,
    },
    {
      'hint': StringConstants.addressPostalCode,
    },
    {
      'hint': StringConstants.addressCountry,
    },
    {
      'hint': StringConstants.phoneNumber,
    },
    {
      'hint': StringConstants.email,
    },
  ];

  final formKey = GlobalKey<FormState>();
  final inAsyncCall = false.obs;
  Map<String, dynamic> bodyParams = {};
  TextEditingController nameController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otherNotesController = TextEditingController();

  String userId = '';


  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
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

  clickOnSaveButton() async {
    inAsyncCall.value = true;
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      bodyParams = {
        ApiKeyConstants.addressName: nameController.text.toString(),
        ApiKeyConstants.addressStreetAddress:
            streetAddressController.text.toString(),
        ApiKeyConstants.addressCity: cityController.text.toString(),
        ApiKeyConstants.addressState: stateController.text.toString(),
        ApiKeyConstants.addressPostalCode: postalCodeController.text.toString(),
        ApiKeyConstants.addressCountry: countryController.text.toString(),
        ApiKeyConstants.addressPhoneNumber: phoneController.text.toString(),
        ApiKeyConstants.addressEmail: emailController.text.toString(),
        ApiKeyConstants.addressUserId: userId.toString(),
        ApiKeyConstants.addressOtherNotes: otherNotesController.text.toString(),
      };
      http.Response? response =
          await ApiMethods.address(bodyParams: bodyParams);
      if (response != null && response.statusCode == 200) {
        Get.back();
      }
    }
    inAsyncCall.value = false;
  }
}
