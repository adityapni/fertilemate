import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/progress_workout_controller.dart';

class ProgressWorkoutView extends GetView<ProgressWorkoutController> {
  const ProgressWorkoutView({Key? key}) : super(key: key);

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
            body: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.px),
                      if (controller.data.isNotEmpty)
                        Text(
                          'Workout Type',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 14.px),
                        ),
                      if (controller.data.isNotEmpty) SizedBox(height: 20.px),
                      if (controller.data.isNotEmpty)
                        SizedBox(
                          height: 100.px,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.data.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(4.px),
                              child: InkWell(
                                onTap: () =>
                                    controller.clickOnTypeCard(index: index),
                                borderRadius: BorderRadius.circular(8.px),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.px),
                                    border: Border.all(
                                      color:
                                          controller.selectedTypeCard.value ==
                                                  index
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                    ),
                                  ),
                                  child: SizedBox(
                                    height: 80.px,
                                    width: 80.px,
                                    child: Column(
                                      children: [
                                        if (controller.data[index].wtImage !=
                                                null &&
                                            controller.data[index].wtImage!
                                                .isNotEmpty)
                                          CommonWidgets.imageView(
                                            height: 64.px,
                                            image: controller
                                                .data[index].wtImage
                                                .toString(),
                                          ),
                                        if (controller.data[index].wtImage !=
                                                null &&
                                            controller.data[index].wtImage!
                                                .isNotEmpty)
                                          SizedBox(height: 6.px),
                                        if (controller.data[index].wtName !=
                                                null &&
                                            controller
                                                .data[index].wtName!.isNotEmpty)
                                          Text(
                                            controller.data[index].wtName
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(fontSize: 12.px),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (controller.getBodyPartsData.isNotEmpty)
                        SizedBox(height: 20.px),
                      if (controller.getBodyPartsData.isNotEmpty)
                        Text(
                          'Body Part',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 14.px),
                        ),
                      if (controller.getBodyPartsData.isNotEmpty)
                        SizedBox(height: 20.px),
                      if (controller.getBodyPartsData.isNotEmpty)
                        SizedBox(
                          height: 100.px,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.getBodyPartsData.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(4.px),
                              child: InkWell(
                                onTap: () =>
                                    controller.clickOnPartCard(index: index),
                                borderRadius: BorderRadius.circular(8.px),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.px),
                                    border: Border.all(
                                      color:
                                          controller.selectedPartCard.value ==
                                                  index
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                    ),
                                  ),
                                  child: SizedBox(
                                    height: 80.px,
                                    width: 80.px,
                                    child: Column(
                                      children: [
                                        if (controller.getBodyPartsData[index]
                                                    .bpImage !=
                                                null &&
                                            controller.getBodyPartsData[index]
                                                .bpImage!.isNotEmpty)
                                          CommonWidgets.imageView(
                                            height: 64.px,
                                            image: controller
                                                .getBodyPartsData[index].bpImage
                                                .toString(),
                                          ),
                                        if (controller.getBodyPartsData[index]
                                                    .bpImage !=
                                                null &&
                                            controller.getBodyPartsData[index]
                                                .bpImage!.isNotEmpty)
                                          SizedBox(height: 6.px),
                                        if (controller.getBodyPartsData[index]
                                                    .bpName !=
                                                null &&
                                            controller.getBodyPartsData[index]
                                                .bpName!.isNotEmpty)
                                          Text(
                                            controller
                                                .getBodyPartsData[index].bpName
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(fontSize: 12.px),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (controller.result.isNotEmpty) SizedBox(height: 20.px),
                      if (controller.result.isNotEmpty)
                        Text(
                          'Progress workout',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 14.px),
                        ),
                      if (controller.result.isNotEmpty) SizedBox(height: 20.px),
                      if (controller.result.isNotEmpty)
                        ListView.builder(
                          itemCount: controller.result.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.px)),
                            child: Padding(
                              padding: EdgeInsets.all(12.px),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: CommonWidgets.imageView(
                                        image: controller.result[index].image
                                            .toString(),
                                        height: 120.px,
                                        width: 134.px,
                                        fit: BoxFit.cover,
                                        radius: 20.px),
                                  ),
                                  SizedBox(width: 14.px),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.result[index].description
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(fontSize: 14.px),
                                        ),
                                        SizedBox(height: 10.px),
                                        CommonWidgets.commonElevatedButton(
                                          onPressed: () => controller
                                              .clickOnStartButton(index: index),
                                          child: Text(
                                            StringConstants.start,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                        ),
                                      ],
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
            ),
          ),
        );
      },
    );
  }
}
