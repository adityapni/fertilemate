import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart' as pr;
import '../../../data/constants/string_constants.dart';
import '../controllers/fertility_education_now_playing_controller.dart';

class FertilityEducationNowPlayingView
    extends GetView<FertilityEducationNowPlayingController> {
  const FertilityEducationNowPlayingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return pr.ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
            title: StringConstants.nowPlaying,
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.result != null &&
                        controller.result!.video != null &&
                        controller.result!.video!.isNotEmpty &&
                        controller.videoController != null)
                      SizedBox(height: 20.px),
                    if (controller.result != null &&
                        controller.result!.video != null &&
                        controller.result!.video!.isNotEmpty &&
                        controller.videoController != null)
                      Obx(() {
                        controller.count.value;
                        controller.chewieController = ChewieController(
                          videoPlayerController: controller.videoController!,
                        );
                        return AspectRatio(
                          aspectRatio: 8.px / 9.px,
                          child: (controller.chewieController != null)
                              ? ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.px),
                                  ),
                                  child: Chewie(
                                    controller: controller.chewieController!,
                                  ),
                                )
                              : CommonWidgets.progressBarView(),
                        );
                      }),
                    if (controller.result != null &&
                        controller.result!.video != null &&
                        controller.result!.video!.isNotEmpty &&
                        controller.videoController != null)
                      SizedBox(height: 8.px),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (controller.result != null &&
                            controller.result!.duration != null &&
                            controller.result!.duration!.isNotEmpty)
                          Text(
                            controller.result!.duration.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 16.px,
                                ),
                          ),
                        if (controller.result != null &&
                            controller.result!.saveStatus != null)
                          GestureDetector(
                            onTap: () => controller.clickOnBookmarkIcon(),
                            child: Container(
                              width: 50.px,
                              height: 50.px,
                              // margin: EdgeInsets.all(20.px),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(25.px),
                              ),
                              child: Icon(
                                  controller.result?.saveStatus == true
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                            ),
                          )
                      ],
                    ),
                    if (controller.result != null &&
                        controller.result!.title != null &&
                        controller.result!.title!.isNotEmpty)
                      SizedBox(height: 20.px),
                    if (controller.result != null &&
                        controller.result!.title != null &&
                        controller.result!.title!.isNotEmpty)
                      Text(
                        controller.result!.title.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 24.px,
                                color: Theme.of(context).primaryColor),
                      ),
                    /*if (controller.result != null) SizedBox(height: 20.px),
                    if (controller.result != null)
                      Row(
                        children: [
                          Expanded(
                            child: CommonWidgets.commonElevatedButton(
                              onPressed: () => controller.clickOnSaveButton(),
                              child: Text(
                                StringConstants.save,
                                style: Theme.of(Get.context!)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 12.px,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.clickOnBookmarkIcon(),
                            child: Container(
                              width: 50.px,
                              height: 50.px,
                              margin: EdgeInsets.all(20.px),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(25.px),
                              ),
                              child: Icon(
                                  controller.result?.saveStatus == true
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                            ),
                          )
                        ],
                      ),*/
                  ],
                ),
              ),
            ],
          ),

          /*
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  children: [
                    SizedBox(height: 40.px),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (controller.result != null &&
                            controller.result!.video != null &&
                            controller.result!.video!.isNotEmpty &&
                            controller.videoController != null)
                          Obx(() {
                            controller.count.value;
                            controller.chewieController = ChewieController(
                              videoPlayerController:
                                  controller.videoController!,
                            );
                            return AspectRatio(
                              aspectRatio: 8.px / 9.px,
                              child: (controller.chewieController != null)
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.px),
                                      ),
                                      child: Chewie(
                                        controller: controller.chewieController,
                                      ),
                                    )
                                  : CommonWidgets.progressBarView(),
                            );
                          }),
                        if (controller.result != null &&
                            controller.result!.video != null &&
                            controller.result!.video!.isNotEmpty &&
                            controller.videoController != null)
                          SizedBox(height: 8.px),
                        if (controller.result != null &&
                            controller.result!.title != null &&
                            controller.result!.title!.isNotEmpty)
                          Text(
                            controller.result!.title.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 16.px,
                                ),
                          ),
                        if (controller.result != null &&
                            controller.result!.title != null &&
                            controller.result!.title!.isNotEmpty)
                          SizedBox(height: 20.px),
                        */
          /* if (controller.result != null &&
                            controller.result!.title != null &&
                            controller.result!.title!.isNotEmpty )
                        Text(
                          controller.result!.title,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 24.px,
                                  color: Theme.of(context).primaryColor),
                        ),*/ /*

                        SizedBox(height: 20.px),
                        */
          /* StreamBuilder(
                            stream: controller.player.positionStream,
                            builder: (context, snapshot1) {
                              final Duration duration = controller.loaded.value
                                  ? snapshot1.data as Duration
                                  : const Duration(seconds: 0);
                              return StreamBuilder(
                                  stream:
                                      controller.player.bufferedPositionStream,
                                  builder: (context, snapshot2) {
                                    final Duration bufferedDuration =
                                        controller.loaded.value
                                            ? snapshot2.data as Duration
                                            : const Duration(seconds: 0);
                                    return SizedBox(
                                      height: 30.px,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.px),
                                        child: ProgressBar(
                                          progress: duration,
                                          total: controller.player.duration ??
                                              const Duration(seconds: 0),
                                          buffered: bufferedDuration,
                                          timeLabelPadding: -1,
                                          timeLabelTextStyle: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                fontSize: 12.px,
                                              ),
                                          progressBarColor:
                                              Theme.of(context).primaryColor,
                                          baseBarColor: Theme.of(context)
                                              .colorScheme
                                              .onSecondary
                                              .withOpacity(.4.px),
                                          bufferedBarColor: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                          thumbColor:
                                              Theme.of(context).primaryColor,
                                          onSeek: controller.loaded.value
                                              ? (duration) async {
                                                  await controller.player
                                                      .seek(duration);
                                                }
                                              : null,
                                        ),
                                      ),
                                    );
                                  });
                            }),
                        SizedBox(height: 8.px),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: 10.px),
                            IconButton(
                                onPressed: controller.loaded.value
                                    ? () async {
                                        if (controller
                                                .player.position.inSeconds >=
                                            10) {
                                          await controller.player.seek(Duration(
                                              seconds: controller.player
                                                      .position.inSeconds -
                                                  10));
                                        } else {
                                          await controller.player
                                              .seek(const Duration(seconds: 0));
                                        }
                                      }
                                    : null,
                                icon: Icon(Icons.fast_rewind_rounded,
                                    size: 24.px,
                                    color: Theme.of(context).primaryColor)),
                            Container(
                              height: 50.px,
                              width: 50.px,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.4),
                              ),
                              child: IconButton(
                                onPressed: controller.loaded.value
                                    ? () {
                                        if (controller.playing.value) {
                                          controller.pauseMusic();
                                        } else {
                                          controller.playMusic();
                                        }
                                      }
                                    : null,
                                icon: Icon(
                                  controller.playing.value
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: controller.loaded.value
                                    ? () async {
                                        if (controller
                                                    .player.position.inSeconds +
                                                10 <=
                                            controller
                                                .player.duration!.inSeconds) {
                                          await controller.player.seek(Duration(
                                              seconds: controller.player
                                                      .position.inSeconds +
                                                  10));
                                        } else {
                                          await controller.player
                                              .seek(const Duration(seconds: 0));
                                        }
                                      }
                                    : null,
                                icon: Icon(
                                  Icons.fast_forward_rounded,
                                  size: 24.px,
                                  color: Theme.of(context).primaryColor,
                                )),
                            SizedBox(width: 10.px),
                          ],
                        ),
                        StreamBuilder(
                            stream: controller.player.positionStream,
                            builder: (context, snapshot1) {
                              final Duration duration =
                                  controller.loaded.value
                                      ? snapshot1.data as Duration
                                      : const Duration(seconds: 0);
                              return StreamBuilder(
                                  stream: controller
                                      .player.bufferedPositionStream,
                                  builder: (context, snapshot2) {
                                    final Duration bufferedDuration =
                                        controller.loaded.value
                                            ? snapshot2.data as Duration
                                            : const Duration(seconds: 0);
                                    return SizedBox(
                                      height: 30.px,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.px),
                                        child: ProgressBar(
                                          progress: duration,
                                          total: controller.player.duration ??
                                              const Duration(seconds: 0),
                                          buffered: bufferedDuration,
                                          timeLabelPadding: -1,
                                          timeLabelTextStyle:
                                              Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                    fontSize: 12.px,
                                                  ),
                                          progressBarColor:
                                              Theme.of(context).primaryColor,
                                          baseBarColor: Theme.of(context)
                                              .colorScheme
                                              .onSecondary
                                              .withOpacity(.4.px),
                                          bufferedBarColor: Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                          thumbColor:
                                              Theme.of(context).primaryColor,
                                          onSeek: controller.loaded.value
                                              ? (duration) async {
                                                  await controller.player
                                                      .seek(duration);
                                                }
                                              : null,
                                        ),
                                      ),
                                    );
                                  });
                            }),
                             SizedBox(height: 8.px),
                        ListTile(
                          onTap: () => controller.clickOnCard(),
                          trailing: Icon(Icons.play_circle_fill_outlined,
                              size: 24.px),
                          title: Text(
                            'Chapter 2',
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 16.px,
                                ),
                          ),
                          subtitle: Text('Male Fertility Factors',
                              style: Theme.of(context).textTheme.titleSmall),
                        ),*/ /*

                        SizedBox(height: 10.px),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
      */
        ),
      );
    });
  }
}
