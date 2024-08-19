import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/nutritional_guidance_detail_time_for_meal_controller.dart';

class NutritionalGuidanceDetailTimeForMealView
    extends GetView<NutritionalGuidanceDetailTimeForMealController> {
  const NutritionalGuidanceDetailTimeForMealView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBarView(title: 'Time For Your Meal'),
        body: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: controller.listOfData.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(12.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.listOfData[index]['title'],
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(height: 6.px),
                          Text(
                            controller.listOfData[index]['dis'],
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 14.px,
                                ),
                          ),
                          SizedBox(height: 20.px),
                          Row(
                            children: [
                              Expanded(
                                child: CommonWidgets.commonElevatedButton(
                                  wantContentSizeButton: true,
                                  borderRadius: 8.px,
                                  height: 30.px,
                                  onPressed: () =>
                                      controller.clickOnEditButton(),
                                  child: Text(
                                    StringConstants.edit,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              SizedBox(width: 14.px),
                              Expanded(
                                child: CommonWidgets.commonElevatedButton(
                                  wantContentSizeButton: true,
                                  borderRadius: 8.px,
                                  height: 30.px,
                                  onPressed: () =>
                                      controller.clickOnSetReminderButton(),
                                  child: Text(
                                    StringConstants.setReminder,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonElevatedButton(
                    onPressed: () => controller.clickOnSummaryButton(),
                    child: Text(
                      StringConstants.summary,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 20.px),
                ],
              ),
            ),
          ],
        ));
  }
}
