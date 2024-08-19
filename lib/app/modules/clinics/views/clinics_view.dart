import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/clinics_controller.dart';

class ClinicsView extends GetView<ClinicsController> {
  const ClinicsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: StringConstants.clinics),
          body: controller.availableTest.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.px),
                    child: Card(
                      elevation: .4.px,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.px)),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.px),
                        onTap: () => controller.clickOnCard(index: index),
                        child: Padding(
                          padding: EdgeInsets.all(4.px),
                          child: Row(
                            children: [
                              if (controller.availableTest[index].clinicImage !=
                                      null &&
                                  controller.availableTest[index].clinicImage!
                                      .isNotEmpty)
                                Expanded(
                                  flex: 2,
                                  child: CommonWidgets.imageView(
                                    image: controller
                                        .availableTest[index].clinicImage
                                        .toString(),
                                    height: 84.px,
                                    width: 84.px,
                                  ),
                                ),
                              if (controller.availableTest[index].clinicImage !=
                                      null &&
                                  controller.availableTest[index].clinicImage!
                                      .isNotEmpty)
                                SizedBox(width: 10.px),
                              Expanded(
                                flex: 6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (controller.availableTest[index]
                                                .clinicName !=
                                            null &&
                                        controller.availableTest[index]
                                            .clinicName!.isNotEmpty)
                                      Text(
                                        controller
                                            .availableTest[index].clinicName
                                            .toString(),
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                fontSize: 20.px,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                      ),
                                    SizedBox(height: 4.px),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (controller.availableTest[index]
                                                    .clinicAddress !=
                                                null &&
                                            controller.availableTest[index]
                                                .clinicAddress!.isNotEmpty)
                                          Image.asset(
                                            IconConstants.icRouteLocation,
                                            height: 20.px,
                                            width: 20.px,
                                            fit: BoxFit.cover,
                                          ),
                                        SizedBox(width: 10.px),
                                        if (controller.availableTest[index]
                                                    .clinicAddress !=
                                                null &&
                                            controller.availableTest[index]
                                                .clinicAddress!.isNotEmpty)
                                          Flexible(
                                            child: Text(
                                              maxLines: 2,
                                              textAlign: TextAlign.justify,
                                              controller.availableTest[index]
                                                  .clinicAddress
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                    fontSize: 12.px,
                                                  ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    SizedBox(height: 4.px),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (controller.availableTest[index]
                                                    .clinicMonday !=
                                                null &&
                                            controller.availableTest[index]
                                                .clinicMonday!.isNotEmpty)
                                          Image.asset(
                                            IconConstants.icClock,
                                            height: 20.px,
                                            width: 20.px,
                                            fit: BoxFit.cover,
                                          ),
                                        SizedBox(width: 10.px),
                                        if (controller.availableTest[index]
                                                    .clinicMonday !=
                                                null &&
                                            controller.availableTest[index]
                                                .clinicMonday!.isNotEmpty)
                                          Flexible(
                                            child: Text(
                                              controller.availableTest[index]
                                                  .clinicMonday
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                    fontSize: 12.px,
                                                  ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  itemCount: controller.availableTest.length,
                )
              : controller.availableClinicsModel == null
                  ? const SizedBox()
                  : Center(child: CommonWidgets.dataNotFound()),
        ),
      );
    });
  }
}
