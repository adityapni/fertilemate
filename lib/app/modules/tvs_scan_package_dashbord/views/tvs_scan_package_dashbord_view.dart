import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/tvs_scan_package_dashbord_controller.dart';

class TvsScanPackageDashbordView
    extends GetView<TvsScanPackageDashbordController> {
  const TvsScanPackageDashbordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
              title: StringConstants.tvsScanPackage,
              actions: [
                GestureDetector(
                  onTap: () => controller.clickOnAppointment(),
                  child: Image.asset(IconConstants.icappointment,
                      width: 28.px, height: 28.px),
                ),
                SizedBox(width: 16.px)
              ]),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Container(
                  height: 160.px,
                  padding: EdgeInsets.all(14.px),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.px),
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/faltu/Rectangle 41933.png',
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4.px),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(.6.px),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.px),
                          ),
                        ),
                        child: Text(
                          StringConstants.spermAssessment,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 18.px),
                        ),
                      ),
                      CommonWidgets.commonElevatedButton(
                        wantContentSizeButton: true,
                        onPressed: () => controller.clickOnUpgrade(),
                        child: Text(
                          StringConstants.upgrade,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 12.px),
                        ),
                      )
                    ],
                  ),
                ),
                if (controller.doctorList.isNotEmpty) SizedBox(height: 20.px),
                if (controller.doctorList.isNotEmpty)
                  Text(
                    StringConstants.servicesAvailable,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                if (controller.doctorList.isNotEmpty) SizedBox(height: 20.px),
                if (controller.doctorList.isNotEmpty)
                  SingleChildScrollView(
                    child: Wrap(
                      children:
                          List.generate(controller.doctorList.length, (index) {
                        final cellWidth =
                            MediaQuery.of(Get.context!).size.width / 2.2;
                        return SizedBox(
                          width: cellWidth,
                          height: 160.px,
                          child: GestureDetector(
                            onTap: () => controller.clickOnCard(
                                id: controller.doctorList[index].id!,
                                title:
                                    controller.doctorList[index].clinicName!),
                            child: Padding(
                              padding: EdgeInsets.all(4.px),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.px),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary
                                        .withOpacity(.4.px),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    CommonWidgets.imageView(
                                        height: 90.px,
                                        image: controller
                                            .doctorList[index].clinicImage
                                            .toString(),
                                        fit: BoxFit.contain,
                                        radius: 20.px),
                                    Padding(
                                      padding: EdgeInsets.all(12.px),
                                      child: Text(
                                        controller.doctorList[index].clinicName
                                            .toString(),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                fontSize: 14.px,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
