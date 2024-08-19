import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../controllers/nutritional_guidance_detail_meal_plan_weeks_controller.dart';

class NutritionalGuidanceDetailMealPlanWeeksView
    extends GetView<NutritionalGuidanceDetailMealPlanWeeksController> {
  const NutritionalGuidanceDetailMealPlanWeeksView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: 'Week'),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Week A (Week 1-4)',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 20.px, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10.px,
                ),
                Text(
                  'Training days: 4 days a week',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 14.px),
                ),
                Text(
                  'Rest days: 3 days a week',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 14.px),
                ),
                SizedBox(height: 10.px),
                Text(
                  'Meal Plan',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 20.px, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10.px),
                ListView.builder(
                  itemCount: controller.listOfData.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(12.px),
                    child: CommonWidgets.commonElevatedButton(
                      wantContentSizeButton: true,
                      height: 34.px,
                      onPressed: () => controller.clickOnButton(),
                      child: Text(
                        controller.listOfData[index],
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
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
    );
  }
}
