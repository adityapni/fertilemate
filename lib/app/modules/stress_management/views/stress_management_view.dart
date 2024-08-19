import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/stress_management_controller.dart';

class StressManagementView extends GetView<StressManagementController> {
  const StressManagementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return AbsorbPointer(
        absorbing: controller.inAsyncCall.value,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              SizedBox(height: 20.px),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  animationDuration: const Duration(microseconds: 0),
                  child: Scaffold(
                    appBar: CommonWidgets.appBarView(
                        title: StringConstants.stressManagement),
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.px),
                          child: Container(
                            height: 44.px,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(.1.px),
                              borderRadius: BorderRadius.circular(8.px),
                            ),
                            child: TabBar(
                              splashBorderRadius: BorderRadius.circular(8.px),
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.px),
                                color: Theme.of(context).primaryColor,
                              ),
                              labelColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              unselectedLabelColor: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.color,
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor,
                                  ),
                              indicatorSize: TabBarIndicatorSize
                                  .tab, // Set indicatorSize to tab
                              dividerColor: Colors.transparent,
                              onTap: (value) =>
                                  controller.clickOnTabs(value: value),
                              physics: const NeverScrollableScrollPhysics(),
                              tabs: [
                                tabTexts(text: StringConstants.audio, index: 0),
                                tabTexts(text: StringConstants.video, index: 1),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.px),
                        if (controller.result.isNotEmpty)
                          SizedBox(
                            height: 100.px,
                            width: double.infinity,
                            child: Obx(() {
                              controller.count.value;
                              return Center(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.result.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () =>
                                          controller.clickOnCard(index: index),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.px),
                                        child: controller.cards(
                                          bgImageString: controller
                                              .result[index].image
                                              .toString(),
                                          textString: controller
                                              .result[index].name
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                          ),
                        /*SizedBox(height: 10.px),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.px),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              controller.cards(
                                bgImageString: IconConstants.icBgHappy,
                                iconString: IconConstants.icHappy,
                                textString: StringConstants.happy,
                              ),
                              controller.cards(
                                bgImageString: IconConstants.icBgRelaxation,
                                iconString: IconConstants.icRelax,
                                textString: StringConstants.relaxation,
                              ),
                              controller.cards(
                                bgImageString: IconConstants.icBgStress,
                                iconString: IconConstants.icFocus,
                                textString: StringConstants.stress,
                              ),
                              controller.cards(
                                bgImageString: IconConstants.icBgClam,
                                iconString: IconConstants.icSocial,
                                textString: StringConstants.social,
                              ),
                            ],
                          ),
                        ),*/
                        SizedBox(height: 8.px),
                        Obx(() {
                          controller.count.value;
                          return Expanded(
                            child: ProgressBar(
                              inAsyncCall: controller.inAsyncCall.value,
                              child: const TabBarView(
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    AudioView(),
                                    VideoView(),
                                  ]),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget tabTexts({required String text, required int index}) {
    return Text(
      text,
      style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
          fontSize: 16.px,
          color: controller.selectedTab.value == index
              ? Theme.of(Get.context!).scaffoldBackgroundColor
              : Theme.of(Get.context!).primaryColor),
    );
  }
}

class AudioView extends GetView<StressManagementController> {
  const AudioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.postAudio.isNotEmpty
            ? ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.px),
                    child: Column(
                      children: [
                        ListView.builder(
                          // padding: EdgeInsets.symmetric(horizontal: 20.px),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.px, horizontal: 20.px),
                            onTap: () =>
                                controller.clickOnListTile(index: index),
                            leading: CommonWidgets.imageView(
                                image: controller.postAudio[index].postImage
                                    .toString(),
                                height: 100.px,
                                width: 84.px,
                                radius: 10.px),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(IconConstants.icPlay,
                                    height: 18.px, width: 18.px),
                              ],
                            ),
                            title: Text(
                              controller.postAudio[index].postName.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 16.px),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.postAudio[index].postDescription
                                      .toString(),
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(fontSize: 14.px),
                                ),
                                SizedBox(
                                  height: 4.px,
                                ),
                                Image.asset(ImageConstants.imageAudioTrack,
                                    height: 20.px),
                              ],
                            ),
                          ),
                          itemCount: controller.postAudio.length,
                        ),
                        SizedBox(height: 20.px),
                      ],
                    ),
                  ),
                ],
              )
            : controller.postsModel == null
                ? const SizedBox()
                : Center(child: CommonWidgets.dataNotFound()));
  }
}

class VideoView extends GetView<StressManagementController> {
  const VideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.postVideo.isNotEmpty
          ? ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: controller.postVideo.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.px),
                          ),
                          child: GestureDetector(
                            onTap: () =>
                                controller.clickOnVideoCard(index: index),
                            child: Padding(
                              padding: EdgeInsets.all(12.px),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonWidgets.imageView(
                                      image: controller
                                          .postVideo[index].postImage
                                          .toString(),
                                      height: 180.px,
                                      width: double.infinity,
                                      radius: 10.px),
                                  SizedBox(height: 10.px),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.postVideo[index].postName
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                fontSize: 14.px,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                      ),
                                      Image.asset(IconConstants.icPlay,
                                          height: 18.px, width: 18.px),
                                    ],
                                  ),
                                  SizedBox(height: 6.px),
                                  Text(
                                    controller.postVideo[index].postDescription
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontSize: 12.px,
                                        ),
                                  ),
                                  SizedBox(height: 10.px),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
              ],
            )
          : controller.postsModel == null
              ? const SizedBox()
              : Center(child: CommonWidgets.dataNotFound()),
    );
  }
}
