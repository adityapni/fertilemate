import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/fertility_specialist_controller.dart';

class FertilitySpecialistView extends GetView<FertilitySpecialistController> {
  const FertilitySpecialistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
              title: StringConstants.fertilitySpecialist),
          body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              if (controller.doctor.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: controller.searchController,
                        borderRadius: 15.px,
                        fillColor: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(.2),
                        hintText: StringConstants.search,
                        prefixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              IconConstants.icSearch,
                              height: 24.px,
                              width: 24.px,
                            ),
                          ],
                        ),
                        /*suffixIcon: Image.asset(
                        IconConstants.icFilter,
                        height: 24.px,
                        width: 24.px,
                      ),*/
                      ),
                      SizedBox(height: 20.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringConstants.viewAllExperts,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 18.px),
                          ),
                          /* Text(
                          StringConstants.explore,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 12.px,
                                  ),
                        ),*/
                        ],
                      ),
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
              (controller.doctor.isNotEmpty)
                  ? Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        child: Wrap(
                          children:
                              List.generate(controller.doctor.length, (index) {
                            final cellWidth = MediaQuery.of(Get.context!)
                                    .size
                                    .width /
                                2.2; // Every cell's `width` will be set to 1/2 of the screen width.
                            return SizedBox(
                              width: cellWidth,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.px),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4.px),
                                  child: Column(
                                    children: [
                                      if (controller.doctor[index].image !=
                                              null &&
                                          controller
                                              .doctor[index].image!.isNotEmpty)
                                        CommonWidgets.imageView(
                                            image: controller
                                                .doctor[index].image
                                                .toString(),
                                            height: 60.px,
                                            width: 60.px,
                                            radius: 30.px),
                                      if (controller.doctor[index].image !=
                                              null &&
                                          controller
                                              .doctor[index].image!.isNotEmpty)
                                        SizedBox(height: 14.px),
                                      if (controller.doctor[index].doctorName !=
                                              null &&
                                          controller.doctor[index].doctorName!
                                              .isNotEmpty)
                                        Text(
                                          controller.doctor[index].doctorName
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(fontSize: 15.px),
                                        ),
                                      if (controller.doctor[index].doctorName !=
                                              null &&
                                          controller.doctor[index].doctorName!
                                              .isNotEmpty)
                                        SizedBox(height: 14.px),
                                      if (controller.doctor[index].doctorPost !=
                                              null &&
                                          controller.doctor[index].doctorPost!
                                              .isNotEmpty)
                                        Text(
                                          controller.doctor[index].doctorPost
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(fontSize: 12.px),
                                        ),
                                      if (controller.doctor[index].doctorPost !=
                                              null &&
                                          controller.doctor[index].doctorPost!
                                              .isNotEmpty)
                                        SizedBox(height: 20.px),
                                      CommonWidgets.commonElevatedButton(
                                        borderRadius: 6.px,
                                        wantContentSizeButton: true,
                                        onPressed: () => controller
                                            .clickOnBookNowButton(index: index),
                                        child: Text(
                                          StringConstants.bookNow,
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
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    )
                  : controller.doctorsModel == null
                      ? const SizedBox()
                      : Center(child: CommonWidgets.dataNotFound()),
              SizedBox(height: 20.px),
            ],
          ),
        ),
      );
    });
  }
}
