import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/doctors_get_profile_model.dart';
import '../../nav_bar/controllers/nav_bar_controller.dart';

class MyProfileController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  List listOfListTilePersonalInfoTitles = [
    StringConstants.yourName,
    StringConstants.occupation,
    StringConstants.gender,
    StringConstants.maritalStatus,
    StringConstants.dateOfBirth,
  ];

  final switchValue = false.obs;

  List listOfListTileContactInfoTitles = [
    StringConstants.phoneNumber,
    StringConstants.email,
  ];

  String userId = '';
  String type = '';
  Map<String, dynamic> bodyParams = {};

  DoctorsGetProfileModel? doctorsGetProfileModel;
  UserData? userData;

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    type = sharedPreferences.getString(ApiKeyConstants.type) ?? '';
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

  clickOnEditButton() async {
    await Get.toNamed(Routes.EDIT_PROFILE);
    inAsyncCall.value = true;
    await onInit();
    inAsyncCall.value = false;
  }

  clickOnListTilePersonalInfo({required int index}) {}

  Future<void> onInitWork() async {
    await doctorsGetProfileApi();
  }

  Future<void> doctorsGetProfileApi() async {
    bodyParams = {
      ApiKeyConstants.id: userId.toString(),
      ApiKeyConstants.type: type.toString(),
    };
    doctorsGetProfileModel =
        await ApiMethods.doctorsGetProfile(bodyParams: bodyParams);
    if (doctorsGetProfileModel != null &&
        doctorsGetProfileModel!.userData != null) {
      userData = doctorsGetProfileModel!.userData!;
      print('userData::::::::${userData?.maritalStatus}');
      print('userData::::::::${userData?.occupation}');
    }
  }

  Future<void> deleteAccountApi() async {
    bodyParams = {
      ApiKeyConstants.userId: userId.toString(),
      ApiKeyConstants.type: type.toString(),
    };
    http.Response? response =
        await ApiMethods.deleteAccount(bodyParams: bodyParams);
    if (response != null && response.statusCode == 200) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString(ApiKeyConstants.userId, '');
      await sharedPreferences.setString(ApiKeyConstants.token, '');
      sharedPreferences.clear();
      selectedIndex.value = 0;
      Get.delete<NavBarController>();
      Get.offAllNamed(Routes.GET_START);
    }
  }

  clickOnDeleteButton() {
    CommonWidgets.showAlertDialog(
      title: 'Delete Info',
      content: 'Delete your account permanently',
      onPressedYes: () => deleteAccountApi(),
    );
  }
}
