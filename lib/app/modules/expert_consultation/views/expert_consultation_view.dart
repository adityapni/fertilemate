import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/expert_consultation_controller.dart';

class ExpertConsultationView extends GetView<ExpertConsultationController> {
  const ExpertConsultationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
              title: StringConstants.expertConsultation),
          body: ListView(
            children: [
              if (controller.result.isNotEmpty)
                Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Wrap(
                      children:
                          List.generate(controller.result.length, (index) {
                        final cellWidth =
                            MediaQuery.of(Get.context!).size.width / 2.2.px;
                        return SizedBox(
                          width: cellWidth,
                          height: 140.px,
                          child: Obx(
                            () => GestureDetector(
                              onTap: () => controller.clickOnCard(index: index),
                              child: Padding(
                                padding: EdgeInsets.all(4.px),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.px),
                                  ),
                                  elevation: .4.px,
                                  color:
                                      (index != controller.selectedCard.value)
                                          ? Theme.of(context)
                                              .scaffoldBackgroundColor
                                          : Theme.of(context).primaryColor,
                                  child: Padding(
                                    padding: EdgeInsets.all(12.px),
                                    child: Center(
                                      child: Text(
                                        controller.result[index]
                                            .expertConsultationCategoriesName
                                            .toString(),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                fontSize: 14.px,
                                                color: (index !=
                                                        controller
                                                            .selectedCard.value)
                                                    ? Theme.of(context)
                                                        .primaryColor
                                                    : Theme.of(context)
                                                        .scaffoldBackgroundColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              if (controller.result.isNotEmpty) SizedBox(height: 20.px),
              if (controller.result.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: CommonWidgets.commonElevatedButton(
                    onPressed: () => controller.clickOnNextButton(),
                    child: Text(
                      StringConstants.next,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
