import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/waiting_for_approval_controller.dart';

class WaitingForApprovalView extends GetView<WaitingForApprovalController> {
  const WaitingForApprovalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  children: [
                    SizedBox(height: 40.px),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.px),
                          child: AspectRatio(
                            aspectRatio: 1.px / 1.px,
                            child: Image.asset(
                                ImageConstants.imageWaitingForApproval),
                          ),
                        ),
                        SizedBox(height: 40.px),
                        Text(
                          StringConstants.thankYouForSubmitting,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 24.px,
                                  color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(height: 20.px),
                        Text(
                          StringConstants.yourProfileWillBeVerifiedWaiting,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 16.px,
                                  ),
                        ),
                        SizedBox(height: 40.px),
                        CommonWidgets.commonElevatedButton(
                          onPressed: () => controller.clickOnRefresh(),
                          child: Text(
                            StringConstants.refresh,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(height: 10.px),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
