import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../controllers/intimacy_management_communication_tips_detail_controller.dart';

class IntimacyManagementCommunicationTipsDetailView
    extends GetView<IntimacyManagementCommunicationTipsDetailController> {
  const IntimacyManagementCommunicationTipsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBarView(),
        body: controller.result != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: ListView(
                  children: [
                    CommonWidgets.imageView(
                      image: controller.result!.imbImage.toString(),
                      height: 300.px,
                      width: double.infinity,
                      radius: 10.px,
                      fit: BoxFit.cover,
                    ),
                    if (controller.result!.imbTitle != null &&
                        controller.result!.imbTitle!.isNotEmpty)
                      SizedBox(height: 10.px),
                    if (controller.result!.imbTitle != null &&
                        controller.result!.imbTitle!.isNotEmpty)
                      Text(
                        controller.result!.imbTitle.toString(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    if (controller.result!.imbDescription != null &&
                        controller.result!.imbDescription!.isNotEmpty)
                      SizedBox(height: 10.px),
                    if (controller.result!.imbDescription != null &&
                        controller.result!.imbDescription!.isNotEmpty)
                      Html(
                        data: controller.result!.imbDescription.toString(),
                      )
                  ],
                ),
              )
            : Center(child: CommonWidgets.dataNotFound()),
      );
    });
  }
}
