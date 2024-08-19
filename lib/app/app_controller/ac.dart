///flutter pub add connectivity_plus => For Check Internet on real time
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fertility_boost/common/common_methods.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AC extends GetxController {
  static final isConnect = false.obs;
  int isDialogShow = 0;

  final Connectivity connectivity = Connectivity();

  Future<void> getNetworkConnectionType() async {
    try {
      List<ConnectivityResult> connectivityResult;
      connectivityResult = await connectivity.checkConnectivity();
      return updateConnectionState(connectivityResult);
    } on PlatformException catch (e) {
      CommonMethods.error();
    }
  }

  StreamSubscription checkNetworkConnection() {
    final networkConnection = false.obs;
    return connectivity.onConnectivityChanged.listen((event) async {
      networkConnection.value =
          await CommonWidgets.internetConnectionCheckerMethod();
      if (networkConnection.value) {
        isConnect.value = true;
        if (isDialogShow == 1) {
          Get.back();
        }
      } else {
        isConnect.value = false;
        isDialogShow = 1;
        CommonMethods.commonAndroidNoInternetDialog();
        CommonMethods.noInternet();
      }
      return updateConnectionState(event);
    });
  }

  void updateConnectionState(List<ConnectivityResult> result) {
    switch (result) {
      case ConnectivityResult.wifi:
        update();
        break;
      case ConnectivityResult.mobile:
        update();
        break;
      case ConnectivityResult.none:
        update();
        break;
      default:
        //Get.snackbar('Network Error', 'Failed to get Network Status');
        break;
    }
  }
}
