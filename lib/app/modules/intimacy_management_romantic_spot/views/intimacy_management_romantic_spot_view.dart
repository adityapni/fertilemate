import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/intimacy_management_romantic_spot_controller.dart';

class IntimacyManagementRomanticSpotView
    extends GetView<IntimacyManagementRomanticSpotController> {
  const IntimacyManagementRomanticSpotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: StringConstants.romanticSpot),
          body: ListView(
            children: [
              SizedBox(height: 20.px),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.px, vertical: 8.px),
                child: CommonWidgets.commonTextFieldForLoginSignUP(
                  onChanged: (value) => controller.searchMethod(value: value),
                  controller: controller.searchController,
                  borderRadius: 15.px,
                  fillColor:
                      Theme.of(context).colorScheme.onSecondary.withOpacity(.2),
                  hintText: StringConstants.search,
                  prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconConstants.icSearch,
                        height: 24.px,
                        width: 24.px,
                      ),
                    ],
                  ),
                  /*suffixIcon: Image.asset(
                    IconConstants.icFilter,
                    height: 24.px,
                    width: 24.px,
                  ),*/
                ),
              ),
              SizedBox(height: 10.px),
              if (controller.result.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Text(
                    StringConstants.nearbyExperiences,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                ),
              if (controller.result.isNotEmpty) SizedBox(height: 10.px),
              if (controller.result.isNotEmpty)
                controller.searchResult.isNotEmpty ||
                        controller.searchController.text.isNotEmpty
                    ? Align(
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: Wrap(
                            children: List.generate(
                                controller.searchResult.length, (index) {
                              final cellWidth = MediaQuery.of(Get.context!)
                                      .size
                                      .width /
                                  2.2.px; // Every cell's `width` will be set to 1/2 of the screen width.
                              return SizedBox(
                                width: cellWidth,
                                // height: 120.px,
                                child: GestureDetector(
                                  onTap: () => controller.clickOnCardNearBy(
                                      result: controller.searchResult[index]),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.px, bottom: 8.px),
                                    child: Container(
                                      width: 200.px,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.px),
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary
                                              .withOpacity(.4.px),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonWidgets.imageView(
                                            height: 100.px,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            radius: 20.px,
                                            image: controller
                                                .searchResult[index].image
                                                .toString(),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.px),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .searchResult[index].name
                                                      .toString(),
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                        fontSize: 14.px,
                                                      ),
                                                ),
                                                /*SizedBox(height: 8.px),
                                                Text(
                                                  controller.searchResult[index]
                                                      .description
                                                      .toString(),
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),*/
                                                SizedBox(height: 8.px),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: Wrap(
                            children: List.generate(controller.result.length,
                                (index) {
                              final cellWidth = MediaQuery.of(Get.context!)
                                      .size
                                      .width /
                                  2.2.px; // Every cell's `width` will be set to 1/2 of the screen width.
                              return SizedBox(
                                width: cellWidth,
                                // height: 120.px,
                                child: GestureDetector(
                                  onTap: () => controller.clickOnCardNearBy(
                                      result: controller.result[index]),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.px, bottom: 8.px),
                                    child: Container(
                                      width: 200.px,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.px),
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary
                                              .withOpacity(.4.px),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonWidgets.imageView(
                                            height: 100.px,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            radius: 20.px,
                                            image: controller
                                                .result[index].image
                                                .toString(),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.px),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.result[index].name
                                                      .toString(),
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                        fontSize: 14.px,
                                                      ),
                                                ),
                                                /* SizedBox(height: 8.px),
                                                Text(
                                                  controller
                                                      .result[index].description
                                                      .toString(),
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),*/
                                                SizedBox(height: 8.px),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
              if (controller.result.isNotEmpty) SizedBox(height: 10.px),
              if (controller.resultData.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Text(
                    StringConstants.categories,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                ),
              if (controller.resultData.isNotEmpty) SizedBox(height: 10.px),
              if (controller.resultData.isNotEmpty)
                SizedBox(
                  height: 100.px,
                  width: double.infinity,
                  child: Obx(() {
                    controller.count.value;
                    return Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.resultData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => controller.clickOnCard(index: index),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.px),
                              child: cards(
                                index: index,
                                textString: controller.resultData[index].name
                                    .toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ),
              SizedBox(height: 10.px),
            ],
          ),
        ),
      );
    });
  }

  Widget cards({
    required String textString,
    required int index,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonWidgets.imageView(
            image: controller.resultData[index].image.toString(),
            width: 64.px,
            height: 64.px),
        SizedBox(height: 4.px),
        Text(
          textString,
          style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
              fontSize: 12.px, color: Theme.of(Get.context!).primaryColor),
        ),
      ],
    );
  }
}
