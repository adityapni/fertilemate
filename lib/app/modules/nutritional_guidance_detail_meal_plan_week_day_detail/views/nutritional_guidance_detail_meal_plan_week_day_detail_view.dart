import 'package:fertility_boost/app/data/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../controllers/nutritional_guidance_detail_meal_plan_week_day_detail_controller.dart';

class NutritionalGuidanceDetailMealPlanWeekDayDetailView
    extends GetView<NutritionalGuidanceDetailMealPlanWeekDayDetailController> {
  const NutritionalGuidanceDetailMealPlanWeekDayDetailView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: 'Meal 1 Suggestion'),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.px),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 16.px / 9.px,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.px),
                      child: Image.asset(
                        ImageConstants.imageEmailCheck,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.px),
                  Text(
                    '175g grass-feed beef fillter steak\n30g cashew nuts\n100g spinash',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14.px),
                  ),
                  SizedBox(height: 10.px),
                  Text(
                    'Macro Split:\nC:10:45fF:27',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14.px),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
