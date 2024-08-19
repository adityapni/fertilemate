import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/expert_consultation_well_come_controller.dart';

class ExpertConsultationWellComeView
    extends GetView<ExpertConsultationWellComeController> {
  const ExpertConsultationWellComeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBarView(
            title: controller.expertConsultation.value),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.px),
                  Text(
                    'Find ${controller.expertConsultation.value}',
                    maxLines: 3,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 24.px,
                        ),
                  ),
                  SizedBox(height: 20.px),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.px),
                        child: AspectRatio(
                          aspectRatio: 1.px / 1.px,
                          child: Image.asset(ImageConstants.imageFindCoaches),
                        ),
                      ),
                      SizedBox(height: 40.px),
                      Text(
                        StringConstants.bookAppointment,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 24.px,
                                color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(height: 20.px),
                      Text(
                        StringConstants
                            .withAVarietyOfCoachesToChooseFromMindCoachProvidesAStressFreeWayToFindThePerfectMentalHealthCoach,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 14.px,
                            ),
                      ),
                      SizedBox(height: 40.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnNextNow(),
                        child: Text(
                          StringConstants.next,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 10.px),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
