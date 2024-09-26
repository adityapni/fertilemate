import 'dart:io';

import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/modules/Profile/views/profile_view.dart';
import 'package:fertility_boost/app/modules/cart/views/cart_view.dart';
import 'package:fertility_boost/app/modules/home/controllers/home_controller.dart';
import 'package:fertility_boost/app/modules/home/views/home_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/common_widgets.dart';
import '../../../app_controller/ac.dart';
import '../../Profile/controllers/profile_controller.dart';
import '../../cart/controllers/cart_controller.dart';

final selectedIndex = 0.obs;

class NavBarController extends AC {
  final count = 0.obs;
  SharedPreferences? prefs;

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    late String? token;
    if(Platform.isIOS){
      String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      if (apnsToken != null){
         token = await FirebaseMessaging.instance.getToken();
      }
    } else {
       token = await FirebaseMessaging.instance.getToken();
    }
    if(prefs != null && token != null){
      Map<String,String> bodyParams = {
        'user_id': prefs!.getString(ApiKeyConstants.userId)??'',
        'token': token??''
      };
      await ApiMethods.saveFCMToken(bodyParams: bodyParams);
    }

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
