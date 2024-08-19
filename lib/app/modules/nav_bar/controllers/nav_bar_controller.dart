import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/modules/Profile/views/profile_view.dart';
import 'package:fertility_boost/app/modules/cart/views/cart_view.dart';
import 'package:fertility_boost/app/modules/home/controllers/home_controller.dart';
import 'package:fertility_boost/app/modules/home/views/home_view.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../common/common_widgets.dart';
import '../../../app_controller/ac.dart';
import '../../Profile/controllers/profile_controller.dart';
import '../../cart/controllers/cart_controller.dart';

final selectedIndex = 0.obs;

class NavBarController extends AC {
  final count = 0.obs;

  @override
  void onInit() {
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

  body() {
    switch (selectedIndex.value) {
      case 0:
        Get.delete<HomeController>();
        Get.lazyPut<HomeController>(
          () => HomeController(),
        );
        return const HomeView();
      /*case 1:
        return const SearchView();*/
      case 1: //2
        Get.delete<CartController>();
        Get.lazyPut<CartController>(
          () => CartController(),
        );
        return const CartView();
      case 2: //3
        Get.delete<ProfileController>();
        Get.lazyPut<ProfileController>(
          () => ProfileController(),
        );
        return const ProfileView();
    }
  }

  onWillPop() {
    if (selectedIndex.value == 0) {
      CommonWidgets.showAlertDialog(
        title: StringConstants.exit,
        content: StringConstants.doYouWantToExitAnApp,
        onPressedYes: () => SystemNavigator.pop(),
      );
    } else {
      selectedIndex.value = 0;
    }
  }
}
