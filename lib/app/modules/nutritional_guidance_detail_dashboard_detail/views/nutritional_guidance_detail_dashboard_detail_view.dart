import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../controllers/nutritional_guidance_detail_dashboard_detail_controller.dart';

class NutritionalGuidanceDetailDashboardDetailView
    extends GetView<NutritionalGuidanceDetailDashboardDetailController> {
  const NutritionalGuidanceDetailDashboardDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBarView(),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.result.gmImage != null &&
                      controller.result.gmImage!.isNotEmpty)
                    CommonWidgets.imageView(
                        fit: BoxFit.cover,
                        image: controller.result.gmImage.toString(),
                        radius: 10.px,
                        height: 400.px),
                  if (controller.result.gmImage != null &&
                      controller.result.gmImage!.isNotEmpty)
                    SizedBox(height: 10.px),
                  Text(
                    controller.result.gmTitle ?? '',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 20.px, color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(height: 10.px),
                  Text(
                    controller.result.gmDescription ?? '',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                  SizedBox(height: 10.px),
                ],
              ),
            ),
          ],
        ));
  }
}
