import 'dart:io';

import 'package:fertility_boost/app/data/apis/api_models/doctors_get_profile_model.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/alert_dialog_view.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../../common/time_picker_view.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';

class EditProfileController extends GetxController {
  final count = 0.obs;
  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParams = {};
  final inAsyncCall = false.obs;
  SharedPreferences? prefs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  final image = Rxn<File>();
  DateTime? dateTime;
  DoctorsGetProfileModel? doctorsGetProfileModel;
  UserData? userData;
  Map<String, File> imageMap = {};

  final maritalStatusValue = false.obs;
  final genderValue = false.obs;

  List maritalStatusList = ['Single', 'Married', 'Widowed', 'Divorced'];
  List genderList = ['Male', 'Female', 'Other'];

  @override
  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();
    super.onInit();
    inAsyncCall.value = true;
    await onInitWorking();
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

  clickOnSubmitButton() async {
    inAsyncCall.value = true;
    if ((image.value != null ||
            (userData != null &&
                userData!.image != null &&
                userData!.image!.isNotEmpty)) &&
        prefs!.getString(ApiKeyConstants.userId) != null &&
        prefs!.getString(ApiKeyConstants.userId)!.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        birthDateController.text.isNotEmpty &&
        occupationController.text.isNotEmpty &&
        maritalStatusController.text.isNotEmpty &&
        genderController.text.isNotEmpty) {
      if (image.value != null) {
        imageMap = {
          ApiKeyConstants.image: image.value ?? File(''),
        };
      }
      bodyParams = {
        ApiKeyConstants.userId:
            prefs!.getString(ApiKeyConstants.userId).toString(),
        ApiKeyConstants.userName: firstNameController.text.toString(),
        ApiKeyConstants.gender: genderController.text.toString(),
        ApiKeyConstants.dob: birthDateController.text,
        ApiKeyConstants.email: emailController.text.toString(),
        ApiKeyConstants.mobile: phoneNumberController.text.toString(),
        ApiKeyConstants.occupation: occupationController.text.toString(),
        ApiKeyConstants.maritalStatus: maritalStatusController.text.toString(),
      };
      http.Response? response = await ApiMethods.updateUserProfile(
          bodyParams: bodyParams, imageMap: imageMap);
      if (response != null && response.statusCode == 200) {
        Get.back();
      }
    } else {
      CommonWidgets.snackBarView(title: 'All Fields Required');
    }
    inAsyncCall.value = false;
  }

  onInitWorking() async {
    await doctorsGetDoctorByIdApi(
      id: prefs!.getString(ApiKeyConstants.userId).toString(),
      type: prefs!.getString(ApiKeyConstants.type).toString(),
    );
  }

  Future<void> doctorsGetDoctorByIdApi(
      {required String id, required String type}) async {
    bodyParams = {
      ApiKeyConstants.id: id.toString(),
      ApiKeyConstants.type: type.toString()
    };
    doctorsGetProfileModel =
        await ApiMethods.doctorsGetProfile(bodyParams: bodyParams);
    if (doctorsGetProfileModel != null &&
        doctorsGetProfileModel!.userData != null) {
      userData = doctorsGetProfileModel!.userData!;
      if (userData != null) {
        firstNameController.text = userData!.userName ?? '';
        emailController.text = userData!.email ?? '';
        phoneNumberController.text = userData!.mobile ?? '';
        birthDateController.text = userData!.dob ?? '';
        occupationController.text = userData!.occupation ?? '';
        maritalStatusController.text = userData!.maritalStatus ?? '';
        genderController.text = userData!.gender ?? '';
      }
    }
  }

  clickOnChangeProfilePicture() {
    showAlertDialog();
  }

  void showAlertDialog({String type = 'profile'}) {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: cameraTextButtonView(),
              onPressed: () => clickCameraTextButtonView(type: type),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: galleryTextButtonView(),
              onPressed: () => clickGalleryTextButtonView(type: type),
            ),
          ],
          title: selectImageTextView(),
          content: contentTextView(),
        );
      },
    );
  }

  Widget selectImageTextView() => Text(
        StringConstants.selectImage,
        style: Theme.of(Get.context!)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 18.px),
      );

  Widget contentTextView() => Text(
        StringConstants.chooseImageFromTheOptionsBelow,
        style: Theme.of(Get.context!)
            .textTheme
            .titleSmall
            ?.copyWith(fontSize: 14.px),
      );

  Widget cameraTextButtonView() => Text(
        StringConstants.camera,
        style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
            fontSize: 10.px, color: Theme.of(Get.context!).primaryColor),
      );

  Widget galleryTextButtonView() => Text(
        StringConstants.gallery,
        style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
            fontSize: 10.px, color: Theme.of(Get.context!).primaryColor),
      );

  Future<void> clickCameraTextButtonView({String type = 'profile'}) async {
    pickCamera(type: type);
    Get.back();
  }

  Future<void> clickGalleryTextButtonView({String type = 'profile'}) async {
    pickGallery(type: type);
    Get.back();
  }

  Future<void> pickCamera({String type = 'profile'}) async {
    image.value = await ImagePickerAndCropper.pickImage(
      context: Get.context!,
      wantCropper: true,
      color: Theme.of(Get.context!).primaryColor,
    );

    increment();
  }

  Future<void> pickGallery({String type = 'profile'}) async {
    image.value = await ImagePickerAndCropper.pickImage(
        context: Get.context!,
        wantCropper: true,
        color: Theme.of(Get.context!).primaryColor,
        pickImageFromGallery: true);
    increment();
  }

  clickOnDeleteButton({String type = 'profile'}) {
    image.value = null;
    increment();
  }

  clickOnUploadCard() {
    showAlertDialog(type: 'Medical Licence');
  }

  clickOnDob() async {
    dateTime = await DatePickerView().datePickerView(
      color: Theme.of(Get.context!).primaryColor,
      lastDate: DateTime.now(),
      initialDate: DateTime(1940),
      firstDate: DateTime(1940),
    );
    if (dateTime != null) {
      birthDateController.text = DateFormat('dd-MM-yyyy')
          .format(dateTime ?? DateTime.now())
          .toString();
    }
  }

  clickOnMaritalStatus() {
    maritalStatusValue.value = !maritalStatusValue.value;
  }

  clickOnMaritalStatusTile({required int index}) {
    maritalStatusController.text = maritalStatusList[index];
    maritalStatusValue.value = !maritalStatusValue.value;
  }

  clickOnGender() {
    genderValue.value = !genderValue.value;
  }

  clickOnGenderTile({required int index}) {
    genderController.text = genderList[index];
    genderValue.value = !genderValue.value;
  }
}
