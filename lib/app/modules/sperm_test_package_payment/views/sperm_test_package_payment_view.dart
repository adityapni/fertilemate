import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sperm_test_package_payment_controller.dart';

class SpermTestPackagePaymentView
    extends GetView<SpermTestPackagePaymentController> {
  const SpermTestPackagePaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBarView(),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20.px),
                  Text(
                    'Confirm and submit your order',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14.px),
                  ),
                  SizedBox(height: 4.px),
                  Text(
                    'By submitting the order, you agree to our Terms of Use and Privacy Policy.',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 12.px,
                        ),
                  ),
                  SizedBox(height: 20.px),
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
                  paymentTypeDis(
                      title: StringConstants.subtotal, price: '25.98'),
                  SizedBox(height: 20.px),
                  paymentTypeDis(title: StringConstants.taxes, price: '1.00'),
                  SizedBox(height: 20.px),
                  paymentTypeDis(title: StringConstants.total, price: '26.98'),
                  SizedBox(height: 4.px),
                  Text(
                    StringConstants.creditAndDebitCards,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 16.px),
                  ),
                  SizedBox(height: 10.px),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.px),
                    ),
                    child: Column(
                      children: [
                        RadioListTile<String>(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.px),
                          ),
                          visualDensity: VisualDensity.compact,
                          secondary: Image.asset(IconConstants.icMastercard,
                              height: 24.px, width: 24.px),
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: Text(
                            'Axis Bank **** **** **** 8395',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 10.px,
                                ),
                          ),
                          value: "Hey",
                          groupValue: "newGroup",
                          onChanged: (value) {},
                        ),
                        RadioListTile<String>(
                          visualDensity: VisualDensity.compact,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.px),
                          ),
                          secondary: Image.asset(IconConstants.icVisa,
                              height: 24.px, width: 24.px),
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: Text(
                            'HDFC Bank **** **** **** 6246',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 10.px,
                                ),
                          ),
                          value: "Hey",
                          groupValue: "newGroup",
                          onChanged: (value) {},
                        ),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(15.px),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.px, horizontal: 14.px),
                            child: Row(
                              children: [
                                Image.asset(IconConstants.icAdd,
                                    height: 24.px, width: 24.px),
                                SizedBox(width: 10.px),
                                Text(
                                  StringConstants.addNewCard,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontSize: 10.px,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.px),
                  Text(
                    StringConstants.cardNumber,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 16.px),
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.enterDigitCardNumber,
                      borderRadius: 15.px,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(.2)),
                  SizedBox(height: 20.px),
                  Text(
                    StringConstants.cardHoldersName,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 16.px),
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    hintText: StringConstants.nameOnCard,
                    borderRadius: 15.px,
                    fillColor: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(.2),
                  ),
                  SizedBox(height: 20.px),
                  Text(
                    StringConstants.validThru,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 16.px),
                  ),
                  SizedBox(height: 20.px),
                  Row(
                    children: [
                      Expanded(
                        child: CommonWidgets.commonTextFieldForLoginSignUP(
                          hintText: StringConstants.month,
                          borderRadius: 15.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Expanded(
                        child: CommonWidgets.commonTextFieldForLoginSignUP(
                          hintText: StringConstants.year,
                          borderRadius: 15.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.px),
                  Text(
                    StringConstants.cvv,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 16.px),
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    obscureText: controller.hideCvv.value,
                    hintText: StringConstants.cvv,
                    borderRadius: 15.px,
                    fillColor: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(.2),
                    suffixIcon: GestureDetector(
                      onTap: () => controller.clickOnEyeButton(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            controller.hideCvv.value
                                ? IconConstants.icView
                                : IconConstants.icHide,
                            color: Theme.of(context).colorScheme.onSecondary,
                            height: 18.px,
                            width: 18.px,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40.px),
                  CommonWidgets.commonElevatedButton(
                    onPressed: () => controller.clickOnPayNowButton(),
                    child: Text(
                      StringConstants.payNow,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 10.px),
                ],
              ),
            ),
          ],
        ),
      );
    });
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
