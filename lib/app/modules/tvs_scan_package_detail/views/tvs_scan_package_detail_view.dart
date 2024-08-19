import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/tvs_scan_package_detail_controller.dart';

class TvsScanPackageDetailView extends GetView<TvsScanPackageDetailController> {
  const TvsScanPackageDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(),
          body: controller.data != null
              ? ListView(
                  children: [
                    Stack(
                      children: [
                        CommonWidgets.imageView(
                            height: MediaQuery.of(context).size.height / 3.px,
                            width: double.infinity,
                            fit: BoxFit.contain,
                            image: controller.data!.clinicImage.toString()),
                        /* Positioned(
                          top: 16.px,
                          left: 16.px,
                          child: InkWell(
                            onTap: () => controller.clickOnBackIcon(),
                            child: Image.asset(IconConstants.icBackbg,
                                fit: BoxFit.cover, height: 32.px, width: 32.px),
                          ),
                        ),*/
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.data!.clinicName ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 14.px,
                                ),
                          ),
                          SizedBox(height: 6.px),
                          Text(
                            "Comprehensive fertility scan",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          if (controller.data!.consultanFees != null &&
                              controller.data!.consultanFees!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.data!.consultanFees != null &&
                              controller.data!.consultanFees!.isNotEmpty)
                            Text(
                              '${CommonWidgets.cur}${controller.data!.consultanFees}',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                  ),
                            ),
                          /*SizedBox(height: 16.px),
                          Text(
                            StringConstants.availableNow,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 14.px,
                                ),
                          ),
                          SizedBox(height: 16.px),
                          SizedBox(
                            height: 120.px,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(right: 8.px),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      controller.listOfCards[index]['icon'],
                                      height: 70.px,
                                      width: 70.px,
                                    ),
                                    SizedBox(height: 8.px),
                                    Text(
                                      controller.listOfCards[index]['title'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 14.px,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              itemCount: controller.listOfCards.length,
                            ),
                          ),*/
                          if (controller.data!.clinicAddress != null &&
                              controller.data!.clinicAddress!.isNotEmpty)
                            SizedBox(height: 16.px),
                          if (controller.data!.clinicAddress != null &&
                              controller.data!.clinicAddress!.isNotEmpty)
                            Text(
                              StringConstants.address,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                  ),
                            ),
                          if (controller.data!.clinicAddress != null &&
                              controller.data!.clinicAddress!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.data!.clinicAddress != null &&
                              controller.data!.clinicAddress!.isNotEmpty)
                            Text(
                              controller.data!.clinicAddress.toString(),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          SizedBox(height: 16.px),
                          Text(
                            StringConstants.openingHours,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 14.px,
                                ),
                          ),
                          if (controller.data!.clinicMonday != null &&
                              controller.data!.clinicMonday!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.data!.clinicMonday != null &&
                              controller.data!.clinicMonday!.isNotEmpty)
                            Text(
                              "Monday - ${controller.data!.clinicMonday.toString()}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          if (controller.data!.clinicTuesday != null &&
                              controller.data!.clinicTuesday!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.data!.clinicTuesday != null &&
                              controller.data!.clinicTuesday!.isNotEmpty)
                            Text(
                              "Tuesday - ${controller.data!.clinicTuesday.toString()}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          if (controller.data!.clinicWednesday != null &&
                              controller.data!.clinicWednesday!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.data!.clinicWednesday != null &&
                              controller.data!.clinicWednesday!.isNotEmpty)
                            Text(
                              "Wednesday - ${controller.data!.clinicWednesday.toString()}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          if (controller.data!.clinicThursday != null &&
                              controller.data!.clinicThursday!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.data!.clinicThursday != null &&
                              controller.data!.clinicThursday!.isNotEmpty)
                            Text(
                              "Thursday - ${controller.data!.clinicThursday.toString()}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          if (controller.data!.clinicFriday != null &&
                              controller.data!.clinicFriday!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.data!.clinicFriday != null &&
                              controller.data!.clinicFriday!.isNotEmpty)
                            Text(
                              "Friday - ${controller.data!.clinicFriday.toString()}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          if (controller.data!.clinicSaturday != null &&
                              controller.data!.clinicSaturday!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.data!.clinicSaturday != null &&
                              controller.data!.clinicSaturday!.isNotEmpty)
                            Text(
                              "Saturday - ${controller.data!.clinicSaturday.toString()}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          if (controller.data!.clinicSunday != null &&
                              controller.data!.clinicSunday!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.data!.clinicSunday != null &&
                              controller.data!.clinicSunday!.isNotEmpty)
                            Text(
                              "Sunday - ${controller.data!.clinicSunday.toString()}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          SizedBox(height: 16.px),
                          CommonWidgets.commonElevatedButton(
                            onPressed: () =>
                                controller.clickOnMakeReservation(),
                            child: Text(
                              "Make Reservation",
                              style: TextStyle(fontSize: 16.px),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : controller.availableClinicsGetClinicDetailByIdModel == null
                  ? const SizedBox()
                  : Center(child: CommonWidgets.dataNotFound()),
        ),
      );
    });
  }
}
