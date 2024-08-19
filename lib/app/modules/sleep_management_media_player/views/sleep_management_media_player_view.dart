import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sleep_management_media_player_controller.dart';

class SleepManagementMediaPlayerView
    extends GetView<SleepManagementMediaPlayerController> {
  const SleepManagementMediaPlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: StringConstants.mediaPlayer),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
                    if (controller.data != null &&
                        controller.data!.name != null &&
                        controller.data!.name!.isNotEmpty)
                      Text(
                        controller.data!.name!,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 24.px,
                                ),
                      ),
                    if (controller.data != null &&
                        controller.data!.video != null &&
                        controller.data!.video!.isNotEmpty &&
                        controller.videoController != null)
                      SizedBox(height: 20.px),
                    if (controller.data != null &&
                        controller.data!.video != null &&
                        controller.data!.video!.isNotEmpty &&
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
                                    controller: controller.chewieController,
                                  ),
                                )
                              : CommonWidgets.progressBarView(),
                        );
                      }),
                    /*if (controller.result.isNotEmpty) SizedBox(height: 20.px),
                    if (controller.result.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.px),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CommonWidgets.imageView(
                                  image:
                                      controller.result[index].image.toString(),
                                  height: 110.px,
                                  fit: BoxFit.cover,
                                  radius: 20.px,
                                ),
                              ),
                              SizedBox(width: 8.px),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.result[index].name ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(fontSize: 18.px),
                                    ),
                                    Text(
                                      controller.result[index].name.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 14.px,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 24.px,
                              )
                            ],
                          ),
                        ),
                        itemCount: controller.result.length,
                      ),*/
                    SizedBox(height: 20.px),
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
