import 'package:fertility_boost/app/modules/nav_bar/controllers/nav_bar_controller.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/doctors_get_profile_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  List listOfListTileImages = [
    IconConstants.icHealthRecorde,
    IconConstants.icMyProfile,
    IconConstants.icChangePassword,
    // IconConstants.icFaqs,
    IconConstants.icRateUs,
    IconConstants.icLogout,
  ];

  List listOfListTileTitles = [
    'Health Recorde',
    'My Profile',
    'Change Password',
    // 'FAQs',
    'Rate Us',
    'Log Out',
  ];
  String userId = '';
  String type = '';

  Map<String, String> bodyParams = {};

  DoctorsGetProfileModel? doctorsGetProfileModel;

  UserData? userData;

  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString(ApiKeyConstants.userId) ?? '';
    type = prefs.getString(ApiKeyConstants.type) ?? '';
    super.onInit();
    await onInitWork();
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

  clickOnListTilePersonalInfo({required int index}) {}

  Future<void> onInitWork() async {
    inAsyncCall.value = true;
    await doctorsGetProfileApi();
    inAsyncCall.value = false;
  }

  Future<void> doctorsGetProfileApi({int value = 0}) async {
    bodyParams = {
      ApiKeyConstants.id: userId.toString(),
      ApiKeyConstants.type: type.toString(),
    };
    doctorsGetProfileModel =
        await ApiMethods.doctorsGetProfile(bodyParams: bodyParams);
    if (doctorsGetProfileModel != null &&
        doctorsGetProfileModel!.userData != null) {
      userData = doctorsGetProfileModel!.userData!;
    }
  }

  clickOnListTile({required int index}) async {
    switch (index) {
      case 0:
        Get.toNamed(Routes.HEALTH_RECORDE);
        break;
      case 1:
        await Get.toNamed(Routes.MY_PROFILE);
        onInitWork();
        break;
      case 2:
        Get.toNamed(Routes.CHANGE_PASSWORD);
        break;
      case 3:
        Get.toNamed(Routes.RATE_US);
        break;
      case 4:
        CommonWidgets.showAlertDialog(
          onPressedYes: () => clickOnYes(),
        );
        break;
    }
  }

  clickOnYes() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(ApiKeyConstants.userId, '');
    await sharedPreferences.setString(ApiKeyConstants.token, '');
    sharedPreferences.clear();
    selectedIndex.value = 0;
    Get.delete<NavBarController>();
    Get.offAllNamed(Routes.GET_START);
  }
}
