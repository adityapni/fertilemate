import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sperm_test_package_your_appointments_controller.dart';

class SpermTestPackageYourAppointmentsView
    extends GetView<SpermTestPackageYourAppointmentsController> {
  const SpermTestPackageYourAppointmentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBarView(),
        body: ListView(
          children: [
            SizedBox(height: 20.px),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.yourAppointments,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 24.px),
                  ),
                  SizedBox(height: 20.px),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: 8.px),
                      child: Container(
                        padding: EdgeInsets.all(8.px),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.4.px),
                          ),
                          // color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20.px),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.px),
                              child: Image.asset(
                                height: 60.px,
                                width: 60.px,
                                'assets/faltu/Rectangle 41925.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 14.px),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fertility consultation',
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 12.px),
                                  ),
                                  SizedBox(height: 4.px),
                                  Text(
                                    'Dr. Smith',
                                    maxLines: 1,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(height: 4.px),
                                  Text(
                                    'Video consultation',
                                    maxLines: 1,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ),
                            CommonWidgets.commonElevatedButton(
                              wantContentSizeButton: true,
                              onPressed: () {},
                              child: Text(
                                'Aug 12',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemCount: 3,
                  ),
                  SizedBox(height: 20.px),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
