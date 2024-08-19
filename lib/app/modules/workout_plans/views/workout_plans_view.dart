import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/workout_plans_controller.dart';

class WorkoutPlansView extends GetView<WorkoutPlansController> {
  const WorkoutPlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.count.value;
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            appBar: CommonWidgets.appBarView(title: StringConstants.workoutPlans),
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
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.px),
                              ),
                              color: Theme.of(context).primaryColor,
                              child: Padding(
                                padding: EdgeInsets.all(18.px),
                                child: Text(
                                  'Muscle Building & Strength ${controller.result.length}-week Workout Plan',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 20.px,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.px),
                            ListView.builder(
                              itemCount: controller.result.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.px),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10.px),
                                  onTap: () =>
                                      controller.clickOnCard(index: index),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.px, vertical: 16.px),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.result[index].week
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                fontSize: 12.px,
                                              ),
                                        ),
                                        Image.asset(
                                          IconConstants.icRightArrow,
                                          height: 24.px,
                                          width: 24.px,
                                          fit: BoxFit.cover,
                                        ),
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
                : controller.getWorkoutWeekModel == null
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
