import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/image_constants.dart';
import '../controllers/sleep_management_notification_controller.dart';

class SleepManagementNotificationView
    extends GetView<SleepManagementNotificationController> {
  const SleepManagementNotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      inAsyncCall: controller.inAsyncCall.value,
      child: Scaffold(
        appBar: CommonWidgets.appBarView(title: StringConstants.notification),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.px),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.px),
                            child: Obx(() {
                              controller.count.value;
                              return ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.px),
                                ),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(30.px),
                                  child: Image.asset(
                                    ImageConstants.imageGirl,
                                    height: 60.px,
                                    width: 60.px,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  'Listen to the calming sounds of a forest',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                                subtitle: Text(
                                  'description',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(fontSize: 10.px),
                                ),
                              );
                            }),
                          ),
                      itemCount: 4),
                  SizedBox(height: 20.px),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
