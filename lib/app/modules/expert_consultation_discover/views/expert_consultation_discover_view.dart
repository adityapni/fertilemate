import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/expert_consultation_discover_controller.dart';

class ExpertConsultationDiscoverView
    extends GetView<ExpertConsultationDiscoverController> {
  const ExpertConsultationDiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: controller.title),
          body: (controller.result.isNotEmpty)
              ? ListView.builder(
                  itemCount: controller.result.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.px, vertical: 4.px),
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
                              image: controller.result[index].image.toString(),
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
                                  buttonColor: Theme.of(context).primaryColor,
                                  wantContentSizeButton: true,
                                  onPressed: () => controller
                                      .clickOnViewProfileButton(index: index),
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
                )
              : controller.expertConsultationGetExpertConsultationDoctorsByCategoriesModel ==
                      null
                  ? const SizedBox()
                  : Center(child: CommonWidgets.dataNotFound()),
        ),
      );
    });
  }
}
