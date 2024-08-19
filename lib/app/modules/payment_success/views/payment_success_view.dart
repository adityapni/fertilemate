import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/payment_success_controller.dart';

class PaymentSuccessView extends GetView<PaymentSuccessController> {
  const PaymentSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.px),
                child: AspectRatio(
                  aspectRatio: 12.px / 10.px,
                  child: Center(
                    child: Image.asset(
                      ImageConstants.imageDone,
                      fit: BoxFit.cover,
                      width: 100.px,
                      height: 100.px,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.px),
              Text(
                StringConstants.paymentSuccess,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 20.px),
              ),
              SizedBox(height: 4.px),
              Text(
                StringConstants.yourPaymentHasBeenSuccessful,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 12.px,
                    ),
              ),
              SizedBox(height: 40.px),
              CommonWidgets.commonElevatedButton(
                wantContentSizeButton: true,
                onPressed: () => controller.clickOnBackToHomeButton(),
                child: Text(
                  StringConstants.backToHome,
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
      );
    });
  }
}
