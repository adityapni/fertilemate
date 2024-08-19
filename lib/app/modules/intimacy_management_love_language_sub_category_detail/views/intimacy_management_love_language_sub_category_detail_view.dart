import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../controllers/intimacy_management_love_language_sub_category_detail_controller.dart';

class IntimacyManagementLoveLanguageSubCategoryDetailView
    extends GetView<IntimacyManagementLoveLanguageSubCategoryDetailController> {
  const IntimacyManagementLoveLanguageSubCategoryDetailView({super.key});
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
                      image: controller.result!.image.toString(),
                      height: 300.px,
                      width: double.infinity,
                      radius: 10.px,
                      fit: BoxFit.cover,
                    ),
                    if (controller.result!.name != null &&
                        controller.result!.name!.isNotEmpty)
                      SizedBox(height: 10.px),
                    if (controller.result!.name != null &&
                        controller.result!.name!.isNotEmpty)
                      Text(
                        controller.result!.name.toString(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    if (controller.result!.description != null &&
                        controller.result!.description!.isNotEmpty)
                      SizedBox(height: 10.px),
                    if (controller.result!.description != null &&
                        controller.result!.description!.isNotEmpty)
                      Html(
                        data: controller.result!.description.toString(),
                      )
                  ],
                ),
              )
            : Center(child: CommonWidgets.dataNotFound()),
      );
    });
  }
}
