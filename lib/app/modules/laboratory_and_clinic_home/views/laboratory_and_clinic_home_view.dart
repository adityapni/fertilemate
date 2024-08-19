import 'package:fertility_boost/app/data/constants/image_constants.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../controllers/laboratory_and_clinic_home_controller.dart';

class LaboratoryAndClinicHomeView
    extends GetView<LaboratoryAndClinicHomeController> {
  const LaboratoryAndClinicHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return WillPopScope(
        onWillPop: () => controller.onWillPop(),
        child: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            appBar: CommonWidgets.appBarView(
              title: StringConstants.newBooking,
              actions: [
                Center(
                  child: CommonWidgets.imageView(
                    image: controller.userImage,
                    width: 40.px,
                    height: 40.px,
                    radius: 20.px,
                  ),
                ),
                SizedBox(width: 20.px),
              ],
              wantBackButton: false,
              leading: IconButton(
                onPressed: () => controller.clickOnProfile(),
                icon: Icon(
                  Icons.dehaze_rounded,
                  size: 24.px,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Column(
                children: [
                  if (controller.result.isNotEmpty) SizedBox(height: 40.px),
                  (controller.result.isNotEmpty)
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: controller.result.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    tileColor: Theme.of(context)
                                        .colorScheme
                                        .onSecondary
                                        .withOpacity(.4.px),
                                    visualDensity:
                                        VisualDensity(vertical: 4.px),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.px),
                                    ),
                                    onTap: () =>
                                        controller.clickOnCard(index: index),
                                    leading: CommonWidgets.imageView(
                                      image: controller.result[index].userImage
                                          .toString(),
                                      radius: 25.px,
                                      height: 50.px,
                                      width: 50.px,
                                    ),
                                    title: Text(
                                      controller.result[index].userName ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(fontSize: 16.px),
                                    ),
                                    trailing: InkWell(
                                      onTap: () =>
                                          controller.clickOnMap(index: index),
                                      child: Image.asset(
                                        ImageConstants.imagemapIcon,
                                        height: 24.px,
                                        width: 24.px,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.px)
                                ],
                              );
                            },
                          ),
                        )
                      : controller.getClinicNotificationModel == null
                          ? const SizedBox()
                          : Center(child: CommonWidgets.dataNotFound())
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
