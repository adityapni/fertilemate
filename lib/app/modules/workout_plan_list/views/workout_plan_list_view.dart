import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/workout_plan_list_controller.dart';

class WorkoutPlanListView extends GetView<WorkoutPlanListController> {
  const WorkoutPlanListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.count.value;
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            appBar: CommonWidgets.appBarView(
                title: StringConstants.progressWorkout),
            body: controller.result.isNotEmpty
                ? ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.px),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.px),
                            ListView.builder(
                              itemCount: controller.result.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.px),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(6.px),
                                  onTap: () =>
                                      controller.clickOnCard(index: index),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: CommonWidgets.imageView(
                                          image: controller
                                              .result[index].pwbImage
                                              .toString(),
                                          radius: 6.px,
                                          height: 78.px,
                                          width: 100.px,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.px),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller
                                                    .result[index].pwbTitle
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(
                                                      fontSize: 12.px,
                                                    ),
                                              ),
                                              /* SizedBox(height: 14.px),
                                               Text(
                                                controller
                                                    .result[index].pwbDescription
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                      fontSize: 10.px,
                                                    ),
                                              ),
                                              SizedBox(height: 6.px),
                                              LinearProgressIndicator(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .onSecondary,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                value: .6,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4.px)),
                                              ),*/
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Image.asset(
                                            IconConstants.icRightArrow,
                                            height: 24.px,
                                            width: 24.px,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
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
                : controller.getWorkoutBlogByWorkoutWeekIdModel == null
                    ? const SizedBox()
                    : Center(
                        child: CommonWidgets.dataNotFound(),
                      ),
          ),
        );
      },
    );
  }
}
