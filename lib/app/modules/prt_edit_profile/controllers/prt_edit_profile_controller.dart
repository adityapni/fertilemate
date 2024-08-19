import 'dart:async';
import 'dart:io';

import 'package:fertility_boost/app/data/apis/api_models/doctors_get_profile_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter_api/google_places_flutter_api.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/alert_dialog_view.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../../common/time_picker_view.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';

class PrtEditProfileController extends GetxController {
  final count = 0.obs;
  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParams = {};
  final inAsyncCall = false.obs;
  SharedPreferences? prefs;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController yearOfExperienceController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController identificationCardNoPassportController =
      TextEditingController();
  TextEditingController consultFeesController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final image = Rxn<File>();
  final imageMedicalLicence = Rxn<File>();
  DoctorsGetProfileModel? doctorsGetProfileModel;
  UserData? userData;
  String userImage = '';
  String medicalLicenceImage = '';
  String lat = '';
  String long = '';

  Map<String, File> imageMap = {};

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
    if (prefs!.getString(ApiKeyConstants.userId) != null &&
        prefs!.getString(ApiKeyConstants.userId)!.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        birthDateController.text.isNotEmpty &&
        postController.text.isNotEmpty &&
        yearOfExperienceController.text.isNotEmpty &&
        educationController.text.isNotEmpty &&
        identificationCardNoPassportController.text.isNotEmpty &&
        consultFeesController.text.isNotEmpty &&
        languageController.text.isNotEmpty &&
        nationalityController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        aboutMeController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        lat.isNotEmpty &&
        long.isNotEmpty) {
      if (userImage.isNotEmpty || image.value != null) {
        if (medicalLicenceImage.isNotEmpty ||
            imageMedicalLicence.value != null) {
          if (image.value != null && imageMedicalLicence.value != null) {
            imageMap = {
              ApiKeyConstants.image: image.value ?? File(''),
              ApiKeyConstants.uploadMedicalLicences:
                  imageMedicalLicence.value ?? File(''),
            };
          } /*else {
            CommonWidgets.snackBarView(
                title: 'Image and Medical Licence Required');
          }*/
          bodyParams = {
            ApiKeyConstants.userId:
                prefs!.getString(ApiKeyConstants.userId).toString(),
            ApiKeyConstants.name: firstNameController.text.toString(),
            ApiKeyConstants.lastName: lastNameController.text.toString(),
            ApiKeyConstants.yearOfExperience:
                yearOfExperienceController.text.toString(),
            ApiKeyConstants.consultFee: consultFeesController.text.toString(),
            ApiKeyConstants.education: educationController.text.toString(),
            ApiKeyConstants.dob: birthDateController.text.toString(),
            ApiKeyConstants.post: postController.text.toString(),
            ApiKeyConstants.identificationCardNo:
                identificationCardNoPassportController.text.toString(),
            ApiKeyConstants.languages: languageController.text.toString(),
            ApiKeyConstants.description: descriptionController.text.toString(),
            ApiKeyConstants.nationality: nationalityController.text.toString(),
            ApiKeyConstants.aboutMe: aboutMeController.text.toString(),
            ApiKeyConstants.address: addressController.text.toString(),
            ApiKeyConstants.lat: lat.toString(),
            ApiKeyConstants.long: long.toString(),
            ApiKeyConstants.type:
                prefs!.getString(ApiKeyConstants.type).toString(),
          };
          http.Response? response = await ApiMethods.doctorsUpdateDoctorProfile(
              bodyParams: bodyParams, imageMap: imageMap);
          if (response != null && response.statusCode == 200) {
            Get.offAllNamed(Routes.WAITING_FOR_APPROVAL);
          }
        } else {
          CommonWidgets.snackBarView(title: 'Medical Licence Image Required!');
        }
      } else {
        CommonWidgets.snackBarView(title: 'Image Required!');
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
        lastNameController.text = userData!.lastName ?? '';
        birthDateController.text = userData!.dob ?? '';
        postController.text = userData!.post ?? '';
        yearOfExperienceController.text = userData!.yearOfExperience ?? '';
        educationController.text = userData!.education ?? '';
        identificationCardNoPassportController.text =
            userData!.identificationCardNo ?? '';
        consultFeesController.text = userData!.consultFee ?? '';
        languageController.text = userData!.languages ?? '';
        descriptionController.text = userData!.description ?? '';
        userImage = userData!.image ?? '';
        medicalLicenceImage = userData!.uploadMedicalLicences ?? '';
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
            .titleMedium
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
    type == 'profile'
        ? image.value = await ImagePickerAndCropper.pickImage(
            context: Get.context!,
            wantCropper: true,
            color: Theme.of(Get.context!).primaryColor,
          )
        : imageMedicalLicence.value = await ImagePickerAndCropper.pickImage(
            context: Get.context!,
            wantCropper: true,
            color: Theme.of(Get.context!).primaryColor,
          );
    increment();
  }

  Future<void> pickGallery({String type = 'profile'}) async {
    type == 'profile'
        ? image.value = await ImagePickerAndCropper.pickImage(
            context: Get.context!,
            wantCropper: true,
            color: Theme.of(Get.context!).primaryColor,
            pickImageFromGallery: true)
        : imageMedicalLicence.value = await ImagePickerAndCropper.pickImage(
            context: Get.context!,
            wantCropper: true,
            color: Theme.of(Get.context!).primaryColor,
            pickImageFromGallery: true);
    increment();
  }

  clickOnDeleteButton({String type = 'profile'}) {
    type == 'profile' ? image.value = null : imageMedicalLicence.value = null;
    increment();
  }

  clickOnUploadCard() {
    showAlertDialog(type: 'Medical Licence');
  }

  clickOnDob() async {
    DateTime? dateTime = await DatePickerView().datePickerView(
      color: Theme.of(Get.context!).primaryColor,
      lastDate: DateTime.now(),
      initialDate: DateTime(1940),
      firstDate: DateTime(1940),
    );
    if (dateTime != null) {
      birthDateController.text = dateTime.toString();
    }
  }

  clickOnAddressTextField() async {
    Prediction? p = await PlacesAutocomplete.show(
      context: Get.context!,
      apiKey: "AIzaSyAUNuNPORcPgdycUwzGTEXU-PCyt2hVKtA",
      mode: Mode.overlay,
    );
    if (p != null) {
      addressController.text = p.description ?? '';
      final locations = await locationFromAddress(p.description ?? '');
      lat = locations.first.latitude.toString();
      long = locations.first.longitude.toString();
    }
  }
}
