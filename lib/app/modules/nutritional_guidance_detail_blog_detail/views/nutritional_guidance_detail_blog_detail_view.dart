import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../controllers/nutritional_guidance_detail_blog_detail_controller.dart';

class NutritionalGuidanceDetailBlogDetailView
    extends GetView<NutritionalGuidanceDetailBlogDetailController> {
  const NutritionalGuidanceDetailBlogDetailView({Key? key}) : super(key: key);

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
                if (controller.result.ngbImage != null &&
                    controller.result.ngbImage!.isNotEmpty)
                  CommonWidgets.imageView(
                      image: controller.result.ngbImage.toString(),
                      radius: 8.px,
                      height: 400.px),
                if (controller.result.ngbImage != null &&
                    controller.result.ngbImage!.isNotEmpty)
                  SizedBox(height: 20.px),
                if (controller.result.ngbTitle != null &&
                    controller.result.ngbTitle!.isNotEmpty)
                  Text(
                    controller.result.ngbTitle.toString(),
                    maxLines: 3,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 24.px, color: Theme.of(context).primaryColor),
                  ),
                if (controller.result.ngbTitle != null &&
                    controller.result.ngbTitle!.isNotEmpty)
                  SizedBox(height: 6.px),
                Html(
                  data: controller.result.ngbDescription.toString(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
