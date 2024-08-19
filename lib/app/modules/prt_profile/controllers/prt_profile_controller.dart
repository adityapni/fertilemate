import 'package:fertility_boost/app/modules/nav_bar/controllers/nav_bar_controller.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/doctors_get_profile_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../routes/app_pages.dart';

class PrtProfileController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  List listOfListTileImages = [
    IconConstants.icMyProfile,
    IconConstants.icChangePassword,
    // IconConstants.icFaqs,
    IconConstants.icRateUs,
    IconConstants.icLogout,
  ];

  List listOfListTileTitles = [
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

  String image = ImageConstants.defaultNetworkImage;
  String userName = '';
  String email = '';

  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString(ApiKeyConstants.userId) ?? '';
    type = prefs.getString(ApiKeyConstants.type) ?? '';
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

  clickOnEditButton() {
    Get.toNamed(Routes.PRT_EDIT_PROFILE);
  }

  clickOnListTilePersonalInfo({required int index}) {}

  Future<void> onInitWork() async {
    await doctorsGetProfileApi();
  }

  Future<void> doctorsGetProfileApi({int value = 0}) async {
    bodyParams = {
      ApiKeyConstants.id: userId.toString(),
      ApiKeyConstants.type: type.toString(),
    };
    doctorsGetProfileModel =
        await ApiMethods.doctorsGetProfile(bodyParams: bodyParams);
    /*if (doctorsGetProfileModel != null &&
        doctorsGetProfileModel!.userData != null) {
      userData = doctorsGetProfileModel!.userData!;
    }*/
    if (doctorsGetProfileModel != null) {
      if (doctorsGetProfileModel!.userData != null) {
        if (doctorsGetProfileModel!.userData!.userName != null) {
          userName = doctorsGetProfileModel!.userData!.userName!;
        }
        if (doctorsGetProfileModel!.userData!.image != null) {
          image = doctorsGetProfileModel!.userData!.image!;
        }
        if (doctorsGetProfileModel!.userData!.email != null) {
          email = doctorsGetProfileModel!.userData!.email!;
        }
      }
    }
  }

  clickOnListTile({required int index}) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.PRT_MY_PROFILE);
        break;
      case 1:
        Get.toNamed(Routes.CHANGE_PASSWORD);
        break;
      case 2:
        Get.toNamed(Routes.RATE_US);
        break;
      case 3:
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
