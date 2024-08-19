import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/constants/string_constants.dart';
import '../controllers/book_order_controller.dart';

class BookOrderView extends GetView<BookOrderController> {
  const BookOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: 'Order #2294 details'),
      body: Column(
        children: [
          SizedBox(height: 10.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: AnotherStepper(
              activeIndex: controller.activeIndex,
              stepperList: controller.stepperData,
              stepperDirection: Axis.vertical,
              iconWidth: 40,
              iconHeight: 40,
            ),
          ),
          SizedBox(height: 20.px),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: CommonWidgets.commonElevatedButton(
              onPressed: () => controller.clickOnBackToHomepageButton(),
              child: Text(
                StringConstants.backToHomepage,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(height: 20.px),
        ],
      ),
    );
  }
}
