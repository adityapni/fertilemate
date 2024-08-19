import 'package:fertility_boost/common/common_methods.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/ecommerce_category_controller.dart';

class EcommerceCategoryView extends GetView<EcommerceCategoryController> {
  const EcommerceCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
              appBar:
                  CommonWidgets.appBarView(title: StringConstants.ecommerce),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.px),
                    if (controller.data.isNotEmpty)
                      Align(
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: Wrap(
                            children:
                                List.generate(controller.data.length, (index) {
                              final cellWidth = MediaQuery.of(Get.context!)
                                      .size
                                      .width /
                                  3.3; // Every cell's `width` will be set to 1/2 of the
                              // screen width.
                              return SizedBox(
                                width: cellWidth,
                                height: 150.px,
                                child: GestureDetector(
                                  onTap: () =>
                                      controller.clickOnCard(index: index),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.px),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4.px),
                                      child: Column(
                                        children: [
                                          CommonWidgets.imageView(
                                              image: controller
                                                  .data[index].categoryImage
                                                  .toString(),
                                              height: 100.px,
                                              width: double.infinity,
                                              radius: 10.px),
                                          SizedBox(height: 8.px),
                                          Text(
                                            controller.data[index].categoryName
                                                .toString(),
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(fontSize: 10.px),
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
                      ),
                    SizedBox(height: 20.px),
                  ],
                ),
              )),
        ),
      );
    });
  }
}
