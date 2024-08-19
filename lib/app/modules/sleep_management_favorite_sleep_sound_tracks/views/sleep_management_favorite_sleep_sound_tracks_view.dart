import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sleep_management_favorite_sleep_sound_tracks_controller.dart';

class SleepManagementFavoriteSleepSoundTracksView
    extends GetView<SleepManagementFavoriteSleepSoundTracksController> {
  const SleepManagementFavoriteSleepSoundTracksView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          body: controller.result.isNotEmpty
              ? ListView(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 40.px),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.px),
                              child: Text(
                                StringConstants
                                    .selectYourFavoriteSleepSoundtracks,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        fontSize: 24.px,
                                        color: Theme.of(context).primaryColor),
                              ),
                            ),
                            SizedBox(height: 20.px),
                            Wrap(
                              children: List.generate(
                                controller.result.length,
                                (index) => GestureDetector(
                                  onTap: () =>
                                      controller.clickOnCard(index: index),
                                  child: Padding(
                                    padding: EdgeInsets.all(4.px),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.px),
                                        color: controller.selectedList.contains(
                                                controller.result[index])
                                            ? Theme.of(context).primaryColor
                                            : Colors.transparent,
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4.px, horizontal: 8.px),
                                        child: Text(
                                          controller.result[index].smcName
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  fontSize: 12.px,
                                                  color: controller.selectedList
                                                          .contains(controller
                                                              .result[index])
                                                      ? Theme.of(context)
                                                          .scaffoldBackgroundColor
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .displayMedium
                                                          ?.color),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.px),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.px),
                              child: CommonWidgets.commonElevatedButton(
                                onPressed: () => controller.clickOnContinue(),
                                child: Text(
                                  StringConstants.continueText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.px),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              : Center(
                  child: controller
                              .sleepManagementGetSleepManagementCategoriesModel ==
                          null
                      ? const SizedBox()
                      : CommonWidgets.dataNotFound(),
                ),
        ),
      );
    });
  }
}
