import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../controllers/prt_nav_bar_controller.dart';

class PrtNavBarView extends GetView<PrtNavBarController> {
  const PrtNavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/favorite sleep.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CommonWidgets.appBarView(
                title: StringConstants.welcomeToFertileMate),
            body: ListView.builder(
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.px, vertical: 4.px),
                      child: GestureDetector(
                        onTap: () => controller.clickOnCard(index: index),
                        child: Container(
                          height: 100.px,
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            borderRadius: BorderRadius.circular(20.px),
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(.4.px),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 100.px,
                                  width: 100.px,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.px),
                                  ),
                                  child: Image.asset(
                                      controller.listOfCardTitle[index]
                                          ["image"],
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  controller.listOfCardTitle[index]["title"],
                                  maxLines: 2,
                                  style: Theme.of(Get.context!)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 14.px),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.px),
                                  ),
                                  child: Image.asset(
                                    IconConstants.icRightArrow,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                itemCount: controller.listOfCardTitle.length),
          ),
        ],
      ),
    );
  }
}
