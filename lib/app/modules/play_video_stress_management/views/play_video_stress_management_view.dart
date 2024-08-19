import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/play_video_stress_management_controller.dart';

class PlayVideoStressManagementView
    extends GetView<PlayVideoStressManagementController> {
  const PlayVideoStressManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return WillPopScope(
        onWillPop: () => controller.clickOnBackIcon(),
        child: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            appBar: CommonWidgets.appBarView(
                title: StringConstants.stressManagement,
                onTap: () => controller.clickOnBackIcon()),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    children: [
                      SizedBox(height: 40.px),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.px),
                            child: AspectRatio(
                              aspectRatio: 1.px / 1.px,
                              child: (controller.videoPlayerController.value
                                      .isInitialized)
                                  ? CustomVideoPlayer(
                                      customVideoPlayerController: controller
                                          .customVideoPlayerController,
                                    )
                                  : CommonWidgets.progressBarView(),
                            ),
                          ),
                          SizedBox(height: 40.px),
                          Text(
                            controller.title,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 24.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(height: 20.px),
                          Text(
                            controller.subTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 16.px,
                                ),
                          ),
                          SizedBox(height: 20.px),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
