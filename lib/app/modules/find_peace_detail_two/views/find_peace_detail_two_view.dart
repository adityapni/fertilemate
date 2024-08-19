import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/find_peace_detail_two_controller.dart';

class FindPeaceDetailTwoView extends GetView<FindPeaceDetailTwoController> {
  const FindPeaceDetailTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          body: controller.result != null
              ? ListView(
                  children: [
                    Stack(
                      children: [
                        CommonWidgets.imageView(
                            height: MediaQuery.of(context).size.height / 3.px,
                            width: double.infinity,
                            image: controller.result!.image.toString()),
                        Positioned(
                          top: 16.px,
                          left: 16.px,
                          child: InkWell(
                            onTap: () => controller.clickOnBackIcon(),
                            child: Image.asset(IconConstants.icBackbg,
                                fit: BoxFit.cover, height: 32.px, width: 32.px),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.result!.peaceCategoryName ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 14.px,
                                ),
                          ),
                          /* SizedBox(height: 6.px),
                          Text(
                            "Comprehensive fertility scan",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),*/
                          if (controller.result!.fees != null &&
                              controller.result!.fees!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.result!.fees != null &&
                              controller.result!.fees!.isNotEmpty)
                            Text(
                              '${CommonWidgets.cur}${controller.result!.fees}',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                  ),
                            ),
                          /* SizedBox(height: 16.px),
                           Text(
                            StringConstants.availableNow,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 14.px,
                                ),
                          ),
                          SizedBox(height: 16.px),*/
                          if (controller.result!.address != null &&
                              controller.result!.address!.isNotEmpty)
                            SizedBox(height: 16.px),
                          if (controller.result!.address != null &&
                              controller.result!.address!.isNotEmpty)
                            Text(
                              StringConstants.address,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                  ),
                            ),
                          if (controller.result!.address != null &&
                              controller.result!.address!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.result!.address != null &&
                              controller.result!.address!.isNotEmpty)
                            Text(
                              controller.result!.address.toString(),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          SizedBox(height: 16.px),
                          if (controller.result!.description != null &&
                              controller.result!.description!.isNotEmpty)
                            Html(
                              data: controller.result!.description.toString(),
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
                          if (controller.result!.monday != null &&
                              controller.result!.monday!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.result!.monday != null &&
                              controller.result!.monday!.isNotEmpty)
                            Text(
                              "Monday - ${controller.result!.monday.toString()}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          if (controller.result!.tuesday != null &&
                              controller.result!.tuesday!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.result!.tuesday != null &&
                              controller.result!.tuesday!.isNotEmpty)
                            Text(
                              "Tuesday - ${controller.result!.tuesday.toString()}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          if (controller.result!.wednesday != null &&
                              controller.result!.wednesday!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.result!.wednesday != null &&
                              controller.result!.wednesday!.isNotEmpty)
                            Text(
                              "Wednesday - ${controller.result!.wednesday.toString()}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          if (controller.result!.thursday != null &&
                              controller.result!.thursday!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.result!.thursday != null &&
                              controller.result!.thursday!.isNotEmpty)
                            Text(
                              "Thursday - ${controller.result!.thursday.toString()}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          if (controller.result!.friday != null &&
                              controller.result!.friday!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.result!.friday != null &&
                              controller.result!.friday!.isNotEmpty)
                            Text(
                              "Friday - ${controller.result!.friday.toString()}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          if (controller.result!.saturday != null &&
                              controller.result!.saturday!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.result!.saturday != null &&
                              controller.result!.saturday!.isNotEmpty)
                            Text(
                              "Saturday - ${controller.result!.saturday.toString()}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          if (controller.result!.sunday != null &&
                              controller.result!.sunday!.isNotEmpty)
                            SizedBox(height: 6.px),
                          if (controller.result!.sunday != null &&
                              controller.result!.sunday!.isNotEmpty)
                            Text(
                              "Sunday - ${controller.result!.sunday.toString()}",
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
              : controller.getSupportivePeaceByIdModel == null
                  ? const SizedBox()
                  : Center(child: CommonWidgets.dataNotFound()),
        ),
      );
    });
  }
}
