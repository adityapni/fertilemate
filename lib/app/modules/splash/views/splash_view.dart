import 'package:fertility_boost/app/data/constants/image_constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.0,
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Center(
          child: Image.asset(
            ImageConstants.imageLogo,
            height: 180.px,
            width: 200.px,
          ),
        ),
      );
    });
  }
}
