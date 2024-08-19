import 'package:another_stepper/dto/stepper_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookOrderController extends GetxController {
  final count = 0.obs;
  int activeIndex = 0;

  List<StepperData> stepperData = [
    StepperData(
      title: StepperText("Order confirmed"),
      subtitle: StepperText(
          "Your order #2294 has been confirmed. Please wait for further updates."),
    ),
    StepperData(
      title: StepperText("Order processing"),
      subtitle: StepperText(
          "Your order is currently being processed. We will notify you once it is ready for delivery."),
    ),
    StepperData(
      title: StepperText("Order out for delivery"),
      subtitle: StepperText(
          "Your order is now out for delivery. Please ensure someone is available to receive it."),
    ),
    StepperData(
      title: StepperText("Order delivered"),
      subtitle: StepperText(
          "Your order is now out for delivery. Please ensure someone is available to receive it."),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnBackToHomepageButton() {

  }
}
