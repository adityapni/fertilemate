import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../controllers/expert_consultation_get_start_controller.dart';

class ExpertConsultationGetStartView
    extends GetView<ExpertConsultationGetStartController> {
  const ExpertConsultationGetStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
              title: "Find a ${controller.expertConsultation.value}" ?? ''),
          body: ListView(
            children: [
              SizedBox(height: 20.px),
              if (controller.result.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => RadioListTile(
                    activeColor: Theme.of(context).primaryColor,
                    controlAffinity: ListTileControlAffinity.trailing,
                    groupValue: controller.selectedRadio,
                    value: controller.result[index],
                    onChanged: (value) {
                      if (value != null) {
                        controller.selectedRadio = value;
                        controller.increment();
                      }
                    },
                    title: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(4.px),
                          child: Center(
                            child: CommonWidgets.imageView(
                              height: 24.px,
                              width: 24.px,
                              radius: 0.px,
                              image: controller.result[index].image.toString(),
                            ),
                          ),
                        ),
                        SizedBox(width: 6.px),
                        Flexible(
                          child: Text(
                            controller.result[index].name ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 18.px),
                          ),
                        ),
                      ],
                    ),
                  ),
                  itemCount: controller.result.length,
                ),
              if (controller.result.isNotEmpty) SizedBox(height: 40.px),
              if (controller.result.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: CommonWidgets.commonElevatedButton(
                    onPressed: () => controller.clickOnBookButton(),
                    child: Text(
                      StringConstants.book,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              SizedBox(height: 20.px),
            ],
          ),
        ),
      );
    });
  }
}
