import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/test_kit_result_controller.dart';

class TestKitResultView extends GetView<TestKitResultController> {
  const TestKitResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: StringConstants.result),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.px),
                      child: Image.asset(
                        ImageConstants.imageResultKit,
                        height: 380.px,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 20.px),
                    if (controller.data != null)
                      Card(
                        elevation: 0.px,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.px)),
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(.2.px),
                        child: Padding(
                          padding: EdgeInsets.all(20.px),
                          child: Column(
                            children: [
                              if (controller.data!.thyroid != null &&
                                  controller.data!.thyroid!.isNotEmpty)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Thyroid',
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 16.px,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                    Text(
                                      '-',
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 16.px,
                                          ),
                                    ),
                                    Text(
                                      controller.data!.thyroid.toString(),
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 16.px,
                                          ),
                                    ),
                                  ],
                                ),
                              if (controller.data!.thyroid != null &&
                                  controller.data!.thyroid!.isNotEmpty)
                                SizedBox(height: 20.px),
                              if (controller.data!.fsh != null &&
                                  controller.data!.fsh!.isNotEmpty)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'FSH',
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 16.px,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                    Text(
                                      '-',
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 16.px,
                                          ),
                                    ),
                                    Text(
                                      controller.data!.fsh.toString(),
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 16.px,
                                          ),
                                    ),
                                  ],
                                ),
                              if (controller.data!.thyroid != null &&
                                  controller.data!.thyroid!.isNotEmpty)
                                SizedBox(height: 20.px),
                              if (controller.data!.spermConcentration != null &&
                                  controller
                                      .data!.spermConcentration!.isNotEmpty)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Sperm Concentration!',
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 16.px,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                    Text(
                                      '-',
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 16.px,
                                          ),
                                    ),
                                    Text(
                                      controller.data!.spermConcentration
                                          .toString(),
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 16.px,
                                          ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 20.px),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
