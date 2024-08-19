import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/sleep_management_discover_controller.dart';

class SleepManagementDiscoverView
    extends GetView<SleepManagementDiscoverController> {
  const SleepManagementDiscoverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: StringConstants.discover),
          body: ListView(
            children: [
              SizedBox(height: 20.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: CommonWidgets.commonTextFieldForLoginSignUP(
                  controller: controller.searchController,
                  onChanged: (value) => controller.searchMethod(value: value),
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
                  /*  suffixIcon: Image.asset(
                    IconConstants.icFilter,
                    height: 24.px,
                    width: 24.px,
                  ),*/
                ),
              ),
              SizedBox(height: 20.px),
              if (controller.result.isNotEmpty)
                SizedBox(
                  height: 50.px,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.result.length,
                    itemBuilder: (context, index) => tabBarText(index: index),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              if (controller.getNextVideoListDiscoverResult.isNotEmpty)
                SizedBox(height: 20.px),
              (controller.getNextVideoListDiscoverResult.isNotEmpty)
                  ? controller.searchResult.isNotEmpty ||
                          controller.searchController.text.isNotEmpty
                      ? Align(
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            child: Wrap(
                              children: List.generate(
                                  controller.searchResult.length, (index) {
                                final cellWidth =
                                    MediaQuery.of(Get.context!).size.width /
                                        2.2.px;
                                return SizedBox(
                                  width: cellWidth,
                                  height: 220.px,
                                  child: Padding(
                                    padding: EdgeInsets.all(4.px),
                                    child: controller.searchResult[index].type
                                                .toString() ==
                                            "image"
                                        ? CommonWidgets.imageView(
                                            image: controller
                                                .searchResult[index].image
                                                .toString(),
                                            // height: 180.px,
                                            radius: 20.px,
                                            fit: BoxFit.cover,
                                          )
                                        : GestureDetector(
                                            onTap: () => controller
                                                .clickOnVideo(index: index),
                                            child: FutureBuilder(
                                              future: controller
                                                  .getVideoThumbnail(controller
                                                      .searchResult[index].video
                                                      .toString()),
                                              builder: (context, snapshot) {
                                                return snapshot
                                                            .connectionState ==
                                                        ConnectionState.done
                                                    ? Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Container(
                                                            width: cellWidth,
                                                            height: 220.px,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onSecondary
                                                                  .withOpacity(
                                                                      .4.px),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                20.px,
                                                              ),
                                                            ),
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  20.px,
                                                                ),
                                                                child: snapshot
                                                                    .data),
                                                          ),
                                                          Image.asset(
                                                            IconConstants
                                                                .iconPlayerPlay,
                                                            height: 30.px,
                                                            width: 30.px,
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(
                                                        width: cellWidth,
                                                        height: 220.px,
                                                        child:
                                                            Shimmer.fromColors(
                                                          baseColor:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSecondary
                                                                  .withOpacity(
                                                                      .4.px),
                                                          highlightColor:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSecondary,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onSecondary
                                                                  .withOpacity(
                                                                      .4.px),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                20.px,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                              },
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
                              children: List.generate(
                                  controller.getNextVideoListDiscoverResult
                                      .length, (index) {
                                final cellWidth =
                                    MediaQuery.of(Get.context!).size.width /
                                        2.2.px;
                                return SizedBox(
                                  width: cellWidth,
                                  height: 220.px,
                                  child: Padding(
                                    padding: EdgeInsets.all(4.px),
                                    child: controller
                                                .getNextVideoListDiscoverResult[
                                                    index]
                                                .type
                                                .toString() ==
                                            "image"
                                        ? CommonWidgets.imageView(
                                            image: controller
                                                .getNextVideoListDiscoverResult[
                                                    index]
                                                .image
                                                .toString(),
                                            // height: 180.px,
                                            radius: 20.px,
                                            fit: BoxFit.cover,
                                          )
                                        : GestureDetector(
                                            onTap: () => controller
                                                .clickOnVideo(index: index),
                                            child: FutureBuilder(
                                              future: controller
                                                  .getVideoThumbnail(controller
                                                      .getNextVideoListDiscoverResult[
                                                          index]
                                                      .video
                                                      .toString()),
                                              builder: (context, snapshot) {
                                                return snapshot
                                                            .connectionState ==
                                                        ConnectionState.done
                                                    ? Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Container(
                                                            width: cellWidth,
                                                            height: 220.px,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onSecondary
                                                                  .withOpacity(
                                                                      .4.px),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                20.px,
                                                              ),
                                                            ),
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  20.px,
                                                                ),
                                                                child: snapshot
                                                                    .data),
                                                          ),
                                                          Image.asset(
                                                            IconConstants
                                                                .iconPlayerPlay,
                                                            height: 30.px,
                                                            width: 30.px,
                                                          ),
                                                        ],
                                                      )
                                                    : SizedBox(
                                                        width: cellWidth,
                                                        height: 220.px,
                                                        child:
                                                            Shimmer.fromColors(
                                                          baseColor:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSecondary
                                                                  .withOpacity(
                                                                      .4.px),
                                                          highlightColor:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSecondary,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onSecondary
                                                                  .withOpacity(
                                                                      .4.px),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                20.px,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                              },
                                            ),
                                          ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        )
                  : controller.getNextVideoListDiscoverModel == null
                      ? const SizedBox()
                      : Center(
                          child: CommonWidgets.dataNotFound(),
                        ),
              SizedBox(height: 20.px),
            ],
          ),
        ),
      );
    });
  }

  tabBarText({required int index}) {
    return GestureDetector(
      onTap: () => controller.clickOnCard(index: index),
      child: Padding(
        padding: EdgeInsets.all(4.px),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.px),
            color: controller.selectedTab.value == index
                ? Theme.of(Get.context!).primaryColor
                : Colors.transparent,
            border: Border.all(
                color: Theme.of(Get.context!).colorScheme.onSecondary),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.px, horizontal: 20.px),
            child: Text(
              controller.result[index].smcName.toString(),
              style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                  fontSize: 16.px,
                  color: controller.selectedTab.value == index
                      ? Theme.of(Get.context!).scaffoldBackgroundColor
                      : Theme.of(Get.context!).textTheme.displayMedium?.color),
            ),
          ),
        ),
      ),
    );
  }
}
