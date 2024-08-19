import 'package:fertility_boost/app/data/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonMethods {
  static void unFocsKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void error() {
    showSnackBar(message: 'Something went wrong');
  }

  static void noInternet() {
    showSnackBar(message: 'Please check your internet connection');
  }

  ///FOR SHOW SNACKBAR required flutter pub add responsive_sizer
  static void showSnackBar(
      {required String message,
      Duration? duration,
      bool isFloating = true,
      Color? backgroundColor,
      bool showCloseIcon = false}) {
    backgroundColor = Theme.of(Get.context!).primaryColor;
    if (isFloating) {
      var snackBar = SnackBar(
        elevation: .4,
        showCloseIcon: showCloseIcon,
        closeIconColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.px)),
        content: Text(
          message,
          style: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(
                fontSize: 14.px,
              ),
        ),
        backgroundColor: backgroundColor,
        margin: EdgeInsets.symmetric(horizontal: 20.px, vertical: 20.px),
        behavior: SnackBarBehavior.floating,
        duration: duration ?? const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    } else {
      var snackBar = SnackBar(
        elevation: .4,
        showCloseIcon: showCloseIcon,
        closeIconColor: Colors.white,
        content: Text(
          message,
          style: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(
                fontSize: 14.px,
              ),
        ),
        backgroundColor: backgroundColor,
        duration: duration ?? const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    }
  }

  static Future<void> commonAndroidNoInternetDialog(
      {bool isDismiss = true}) async {
    await showDialog(
      context: Get.context!,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200,
                  child: Image.asset(ImageConstants.imageNotFound),
                ),
                const SizedBox(height: 32),
                const Text(
                  "Whoops!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  "No internet connection found.",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Check your connection and try again.",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
      useSafeArea: true,
      barrierDismissible: isDismiss,
    );
  }
}
