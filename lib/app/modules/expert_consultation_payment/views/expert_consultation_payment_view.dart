import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/expert_consultation_payment_controller.dart';

class ExpertConsultationPaymentView
    extends GetView<ExpertConsultationPaymentController> {
  const ExpertConsultationPaymentView({Key? key}) : super(key: key);

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
                headingText(title: StringConstants.paymentDetail),
                SizedBox(height: 20.px),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Selected Coach',
                      style: Theme.of(Get.context!)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 14.px),
                    ),
                    Text(
                      "Price per Session",
                      style: Theme.of(Get.context!)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 14.px),
                    ),
                  ],
                ),
                SizedBox(height: 20.px),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity",
                      style: Theme.of(Get.context!)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 14.px),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => controller.clickOnRemoveIcon(),
                          child: Image.asset(IconConstants.icRemove,
                              height: 24.px, width: 24.px),
                        ),
                        SizedBox(width: 8.px),
                        Text(
                          '01',
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 14.px),
                        ),
                        SizedBox(width: 8.px),
                        GestureDetector(
                          onTap: () => controller.clickOnAddIcon(),
                          child: Image.asset(IconConstants.icAddButton,
                              height: 24.px, width: 24.px),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.px),
                paymentTypeDis(title: StringConstants.subtotal, price: '25.98'),
                SizedBox(height: 20.px),
                paymentTypeDis(title: StringConstants.taxes, price: '1.00'),
                SizedBox(height: 20.px),
                paymentTypeDis(title: StringConstants.total, price: '26.98'),
                SizedBox(height: 40.px),
                CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnProceedToPaymentButton(),
                  child: Text(
                    StringConstants.proceedToPayment,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 20.px),
              ],
            ),
          ),
        ],
      ),
    );
  }

  headingText({String title = '', double? fontSize}) {
    return Text(
      title,
      style: Theme.of(Get.context!)
          .textTheme
          .displayMedium
          ?.copyWith(fontSize: fontSize ?? 16.px),
    );
  }

  paymentTypeDis({String title = '', String price = ''}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(Get.context!)
              .textTheme
              .titleSmall
              ?.copyWith(fontSize: 14.px),
        ),
        Text(
          CommonWidgets.cur + price,
          style: Theme.of(Get.context!)
              .textTheme
              .titleSmall
              ?.copyWith(fontSize: 14.px),
        ),
      ],
    );
  }
}
