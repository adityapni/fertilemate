import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sperm_test_package_nearby_clinics_detail_controller.dart';

class SpermTestPackageNearbyClinicsDetailView
    extends GetView<SpermTestPackageNearbyClinicsDetailController> {
  const SpermTestPackageNearbyClinicsDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(),
          body: controller.clinicDetail != null
              ? ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: Column(
                        children: [
                          CommonWidgets.imageView(
                            image: controller.clinicDetail!.data!.clinicImage!,
                            height: 100.px,
                            width: 100.px,
                            fit: BoxFit.cover,
                            radius: 10.px,
                          ),
                          SizedBox(height: 20.px),
                          Text(
                            controller.clinicDetail!.data!.clinicName!,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 20.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(height: 4.px),
                          Text(
                            controller.clinicDetail!.data!.clinicName ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 12.px,
                                ),
                          ),
                          SizedBox(height: 20.px),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Image.asset(IconConstants.icStartBlack,
                                      width: 20.px, height: 20.px),
                                  SizedBox(width: 10.px),
                                  Text(
                                    controller.clinicDetail!.data!.rating ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 14.px,
                                        ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${controller.clinicDetail!.data!.clients ?? ''}+',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 16.px,
                                        ),
                                  ),
                                  SizedBox(width: 10.px),
                                  Text(
                                    'satisfied',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 14.px,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.px),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Services Offered',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 20.px,
                                  ),
                            ),
                          ),
                          SizedBox(height: 20.px),
                          Text(
                            controller.clinicDetail!.data!.clinicAddress ?? '',
                            // "Address: 4.3, Jalan Furw, 34500, Kuala Lumpur, MalaysiaSperm ConcentrationSpem CountConsultan",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 16.px,
                                ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
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
                               if (controller.clinicDetail!.data!.clinicMonday != null &&
                                   controller.clinicDetail!.data!.clinicMonday!.isNotEmpty)
                                 SizedBox(height: 6.px),
                               if (controller.clinicDetail!.data!.clinicMonday != null &&
                                   controller.clinicDetail!.data!.clinicMonday!.isNotEmpty)
                                 Text(
                                   "Monday - ${controller.clinicDetail!.data!.clinicMonday.toString()}",
                                   style: Theme.of(context).textTheme.titleSmall,
                                 ),
                               if (controller.clinicDetail!.data!.clinicTuesday != null &&
                                   controller.clinicDetail!.data!.clinicTuesday!.isNotEmpty)
                                 SizedBox(height: 6.px),
                               if (controller.clinicDetail!.data!.clinicTuesday != null &&
                                   controller.clinicDetail!.data!.clinicTuesday!.isNotEmpty)
                                 Text(
                                   "Tuesday - ${controller.clinicDetail!.data!.clinicTuesday.toString()}",
                                   style: Theme.of(context).textTheme.titleSmall,
                                 ),
                               if (controller.clinicDetail!.data!.clinicWednesday != null &&
                                   controller.clinicDetail!.data!.clinicWednesday!.isNotEmpty)
                                 SizedBox(height: 6.px),
                               if (controller.clinicDetail!.data!.clinicWednesday != null &&
                                   controller.clinicDetail!.data!.clinicWednesday!.isNotEmpty)
                                 Text(
                                   "Wednesday - ${controller.clinicDetail!.data!.clinicWednesday.toString()}",
                                   style: Theme.of(context).textTheme.titleSmall,
                                 ),
                               if (controller.clinicDetail!.data!.clinicThursday != null &&
                                   controller.clinicDetail!.data!.clinicThursday!.isNotEmpty)
                                 SizedBox(height: 6.px),
                               if (controller.clinicDetail!.data!.clinicThursday != null &&
                                   controller.clinicDetail!.data!.clinicThursday!.isNotEmpty)
                                 Text(
                                   "Thursday - ${controller.clinicDetail!.data!.clinicThursday.toString()}",
                                   style: Theme.of(context).textTheme.titleSmall,
                                 ),
                               if (controller.clinicDetail!.data!.clinicFriday != null &&
                                   controller.clinicDetail!.data!.clinicFriday!.isNotEmpty)
                                 SizedBox(height: 6.px),
                               if (controller.clinicDetail!.data!.clinicFriday != null &&
                                   controller.clinicDetail!.data!.clinicFriday!.isNotEmpty)
                                 Text(
                                   "Friday - ${controller.clinicDetail!.data!.clinicFriday.toString()}",
                                   style: Theme.of(context).textTheme.titleSmall,
                                 ),
                               if (controller.clinicDetail!.data!.clinicSaturday != null &&
                                   controller.clinicDetail!.data!.clinicSaturday!.isNotEmpty)
                                 SizedBox(height: 6.px),
                               if (controller.clinicDetail!.data!.clinicSaturday != null &&
                                   controller.clinicDetail!.data!.clinicSaturday!.isNotEmpty)
                                 Text(
                                   "Saturday - ${controller.clinicDetail!.data!.clinicSaturday.toString()}",
                                   style: Theme.of(context).textTheme.titleSmall,
                                 ),
                               if (controller.clinicDetail!.data!.clinicSunday != null &&
                                   controller.clinicDetail!.data!.clinicSunday!.isNotEmpty)
                                 SizedBox(height: 6.px),
                               if (controller.clinicDetail!.data!.clinicSunday != null &&
                                   controller.clinicDetail!.data!.clinicSunday!.isNotEmpty)
                                 Text(
                                   "Sunday - ${controller.clinicDetail!.data!.clinicSunday.toString()}",
                                   style: Theme.of(context).textTheme.titleSmall,
                                 ),
                               SizedBox(height: 20.px),
                             ],
                                                     ),
                          ),
                          CommonWidgets.commonElevatedButton(
                            onPressed: () =>
                                controller.clickOnScheduleAppointmentButton(),
                            child: Text(
                              StringConstants.scheduleAppointment,
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
                )
              : Container(),
        ),
      );
    });
  }
}
