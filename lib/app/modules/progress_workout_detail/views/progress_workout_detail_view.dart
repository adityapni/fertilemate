/*
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../controllers/progress_workout_detail_controller.dart';

class ProgressWorkoutDetailView
    extends GetView<ProgressWorkoutDetailController> {
  const ProgressWorkoutDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.count.value;
        return Scaffold(
          appBar: CommonWidgets.appBarView(),
          body: Column(
            children: [
              SizedBox(
                height: 10.px,
              ),
              Obx(() {
                controller.count.value;
                controller.chewieController = ChewieController(
                  videoPlayerController: controller.videoPlayerController,
                );
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 16.px / 9.px,
                    child: (controller.chewieController != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(14.px),
                            child: Chewie(
                              controller: controller.chewieController,
                            ),
                          )
                        : CommonWidgets.progressBarView(),
                  ),
                );
              }),
              Expanded(
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.px),
                              Text(
                                controller.result?.pwbTitle ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        fontSize: 22.px,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary),
                              ),
                              SizedBox(height: 20.px),
                              Html(
                                data: controller.result?.pwbDescription ?? '',
                              ),
                              SizedBox(height: 20.px),
                              */
/* CommonWidgets.commonElevatedButton(
                                onPressed: () => controller.clickOnPlayButton(),
                                child: Text(
                                  StringConstants.play,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(height: 20.px),*/ /*

                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';

import '../../../../common/common_widgets.dart';
import '../controllers/progress_workout_detail_controller.dart';

class ProgressWorkoutDetailView
    extends GetView<ProgressWorkoutDetailController> {
  const ProgressWorkoutDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.count.value;
        return Scaffold(
          appBar: CommonWidgets.appBarView(),
          body: Column(
            children: [
              SizedBox(
                height: 10.px,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 16.px / 9.px,
                  child: (controller.longVideo.isNotEmpty)
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(14.px),
                          child: VimeoPlayer(
                            videoId: controller.longVideo,
                          ),
                        )
                      : CommonWidgets.progressBarView(),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.px),
                              Text(
                                controller.result?.pwbTitle ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        fontSize: 22.px,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary),
                              ),
                              SizedBox(height: 20.px),
                              Html(
                                data: controller.result?.pwbDescription ?? '',
                              ),
                              SizedBox(height: 20.px),
/* CommonWidgets.commonElevatedButton(
                                onPressed: () => controller.clickOnPlayButton(),
                                child: Text(
                                  StringConstants.play,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(height: 20.px),*/
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
