import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/nav_bar_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () => controller.onWillPop(),
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: controller.body(),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20.px,
                  color: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .color!
                      .withOpacity(.1.px),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.px, vertical: 4.px),
                child: GNav(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.px, vertical: 4.px),
                  tabs: [
                    button(
                        image: IconConstants.icHome,
                        text: StringConstants.home,
                        index: 0),
                    /*button(
                        image: IconConstants.icSearch,
                        text: StringConstants.search,
                        index: 1),*/
                    button(
                        image: IconConstants.icCart,
                        text: StringConstants.cart,
                        index: 1), //2
                    button(
                        image: IconConstants.icProfile,
                        text: StringConstants.profile,
                        index: 2), //3
                  ],
                  selectedIndex: selectedIndex.value,
                  onTabChange: (index) {
                    selectedIndex.value = index;
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  button({required String image, required String text, required int index}) {
    return GButton(
      icon: Icons.add,
      leading: Column(
        children: [
          Image.asset(
            image,
            height: 24.px,
            width: 24.px,
            color: selectedIndex.value == index
                ? Theme.of(Get.context!).primaryColor
                : Theme.of(Get.context!).colorScheme.onSecondary,
          ),
          SizedBox(height: 4.px),
          Text(
            text,
            style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                  color: selectedIndex.value == index
                      ? Theme.of(Get.context!).primaryColor
                      : Theme.of(Get.context!).colorScheme.onSecondary,
                ),
          ),
        ],
      ),
      textStyle: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
            color: selectedIndex.value == index
                ? Theme.of(Get.context!).primaryColor
                : Theme.of(Get.context!).colorScheme.onSecondary,
          ),
      // text: text,
    );
  }
}
