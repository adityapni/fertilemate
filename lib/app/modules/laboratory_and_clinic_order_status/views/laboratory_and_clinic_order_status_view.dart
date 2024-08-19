import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../controllers/laboratory_and_clinic_order_status_controller.dart';

class LaboratoryAndClinicOrderStatusView
    extends GetView<LaboratoryAndClinicOrderStatusController> {
  const LaboratoryAndClinicOrderStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Package #2294 details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24.px),
                    ),
                    SizedBox(height: 10.px),
                    AnotherStepper(
                      barThickness: 2,
                      activeBarColor: Theme.of(context).primaryColor,
                      activeIndex: controller.activeIndex,
                      stepperList: controller.stepperData,
                      stepperDirection: Axis.vertical,
                      iconWidth: 34,
                      iconHeight: 34,
                      inActiveBarColor:
                          Theme.of(context).colorScheme.onSecondary,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      // verticalGap: 40,
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnBackToHomepageButton(),
                      child: Text(
                        StringConstants.backToHomepage,
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
          ),
        ),
      );
    });
  }
}
