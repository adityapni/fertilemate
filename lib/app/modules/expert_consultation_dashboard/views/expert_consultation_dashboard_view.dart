import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/expert_consultation_dashboard_controller.dart';

class ExpertConsultationDashboardView
    extends GetView<ExpertConsultationDashboardController> {
  const ExpertConsultationDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
              title: controller.expertConsultation.value),
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.px),
                    child: Text(
                      "Find your ${controller.expertConsultation.value}",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 18.px),
                    ),
                  ),
                  SizedBox(height: 10.px),
                  if (controller.appointmentResult.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.px, vertical: 4.px),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.px),
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(.4.px),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.px),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        StringConstants.upcomingAppointment,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(fontSize: 14.px),
                                      ),
                                    ),
                                    CommonWidgets.commonElevatedButton(
                                      borderRadius: 20.px,
                                      buttonColor:
                                          Theme.of(context).primaryColor,
                                      wantContentSizeButton: true,
                                      onPressed: () => controller
                                          .clickOnChatButton(index: index),
                                      child: Text(
                                        StringConstants.chatNow,
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
                                  ],
                                ),
                                ListTile(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.px),
                                  leading: CommonWidgets.imageView(
                                    image: controller
                                        .appointmentResult[index].doctorImage
                                        .toString(),
                                    height: 60.px,
                                    width: 60.px,
                                    fit: BoxFit.cover,
                                    radius: 8.px,
                                  ),
                                  title: Text(
                                    'Coach: ${controller.appointmentResult[index].doctorName ?? ''}',
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 14.px,
                                        ),
                                  ),
                                  subtitle: Text(
                                    'Date Time: ${controller.appointmentResult[index].datetime ?? ''}',
                                    maxLines: 1,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      itemCount: controller.appointmentResult.length,
                    ),
                  SizedBox(height: 10.px),
                  if (controller.getFindCoachCategoryResult.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: Text(
                        StringConstants.exploreByCategory,
                        maxLines: 1,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                    ),
                  if (controller.getFindCoachCategoryResult.isNotEmpty)
                    SizedBox(height: 20.px),
                  if (controller.getFindCoachCategoryResult.isNotEmpty)
                    SizedBox(
                      height: 100.px,
                      width: double.infinity,
                      child: Obx(() {
                        controller.count.value;
                        return Center(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                controller.getFindCoachCategoryResult.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () =>
                                    controller.clickOnCard(index: index),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.px),
                                  child: controller.cards(
                                    index: index,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  if (controller.result.isNotEmpty) SizedBox(height: 20.px),
                  if (controller.result.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Book Your ${controller.expertConsultation.value}',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 14.px),
                            ),
                          ),
                          /* GestureDetector(
                            onTap: () => controller.clickOnSeeAll(),
                            child: Text(
                              StringConstants.seeAll,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                  ),
                            ),
                          ),*/
                        ],
                      ),
                    ),
                  if (controller.result.isNotEmpty) SizedBox(height: 20.px),
                  if (controller.result.isNotEmpty)
                    ListView.builder(
                      itemCount: controller.result.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.px, vertical: 4.px),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.px),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.4.px),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.px),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CommonWidgets.imageView(
                                  radius: 8.px,
                                  height: 110.px,
                                  fit: BoxFit.contain,
                                  image:
                                      controller.result[index].image.toString(),
                                ),
                              ),
                              SizedBox(width: 20.px),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 8.px),
                                    Text(
                                      'Coach: ${controller.result[index].name.toString()}',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(fontSize: 14.px),
                                    ),
                                    SizedBox(height: 8.px),
                                    Text(
                                      'Expertise: ${controller.result[index].education.toString()}',
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(fontSize: 12.px),
                                    ),
                                    SizedBox(height: 8.px),
                                    Text(
                                      'Rate: ${CommonWidgets.cur} ${controller.result[index].consultFee.toString()}',
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(fontSize: 12.px),
                                    ),
                                    SizedBox(height: 8.px),
                                    CommonWidgets.commonElevatedButton(
                                      borderRadius: 20.px,
                                      buttonColor:
                                          Theme.of(context).primaryColor,
                                      wantContentSizeButton: true,
                                      onPressed: () =>
                                          controller.clickOnViewProfileButton(
                                              index: index),
                                      child: Text(
                                        StringConstants.viewProfile,
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
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (controller.result.isNotEmpty) SizedBox(height: 20.px),
                  SizedBox(height: 40.px),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
