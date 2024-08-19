import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/expert_consultation_success_controller.dart';

class ExpertConsultationSuccessView
    extends GetView<ExpertConsultationSuccessController> {
  const ExpertConsultationSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Column(
                children: [
                  SizedBox(height: 40.px),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.px),
                        child: AspectRatio(
                          aspectRatio: 8.px / 10.px,
                          child: Image.asset(
                            ImageConstants.imageOrderSuccess,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.px),
                      Text(
                        'Congratulations!',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 28.px,
                                ),
                      ),
                      SizedBox(height: 40.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnContinueButton(),
                        child: Text(
                          textAlign: TextAlign.center,
                          StringConstants.continueText,
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
