import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/play_audio_stress_management_controller.dart';

class PlayAudioStressManagementView
    extends GetView<PlayAudioStressManagementController> {
  const PlayAudioStressManagementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return WillPopScope(
        onWillPop: () => controller.clickOnBackIcon(),
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
                            child: CommonWidgets.imageView(
                                image: controller.thumbnailImgUrl),
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
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 16.px,
                                  ),
                        ),
                        SizedBox(height: 20.px),
                        // Image.asset(ImageConstants.imagePlayAudio),
                        StreamBuilder(
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
                        SizedBox(height: 10.px),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
