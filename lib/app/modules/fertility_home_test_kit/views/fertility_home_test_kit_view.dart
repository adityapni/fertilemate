import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/fertility_home_test_kit_controller.dart';

class FertilityHomeTestKitView extends GetView<FertilityHomeTestKitController> {
  const FertilityHomeTestKitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
              title: StringConstants.fertilityHomeTestKit),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: controller.data.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => Obx(() {
                          controller.count.value;
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.px),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(10.px),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.px)),
                              tileColor: controller.selectedCard.value == index
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).scaffoldBackgroundColor,
                              onTap: () => controller.clickOnCard(index: index),
                              leading: CommonWidgets.imageView(
                                height: 48.px,
                                width: 48.px,
                                radius: 24.px,
                                fit: BoxFit.contain,
                                image:
                                    controller.data[index].fecImage.toString(),
                              ),
                              title: Text(
                                controller.data[index].name.toString(),
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 16.px,
                                      color:
                                          controller.selectedCard.value != index
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                    ),
                              ),
                            ),
                          );
                        }),
                    itemCount: controller.data.length)
                : controller.fertilityEducationsGetFertilityTestKitModel == null
                    ? const SizedBox()
                    : Center(child: CommonWidgets.dataNotFound()),
          ),
        ),
      );
    });
  }
}
