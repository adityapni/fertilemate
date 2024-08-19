import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../../splash/controllers/splash_controller.dart';
import '../controllers/lifestyle_optimisation_controller.dart';

class LifestyleOptimisationView
    extends GetView<LifestyleOptimisationController> {
  const LifestyleOptimisationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
              title: StringConstants.lifestyleOptimisation),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  children: [
                    SizedBox(height: 20.px),
                    /*
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.px),
                      child: Stack(
                        children: [
                          Image.asset(
                            ImageConstants.imageBanner,
                            height: 150.px,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          */
                    /*SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.all(10.px),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstants.dailyBodyWeight,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  fontSize: 16.px,
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor),
                                        ),
                                        SizedBox(height: 4.px),
                                        Text(
                                          StringConstants.dailyBodyWeight,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  fontSize: 12.px,
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor),
                                        ),
                                        SizedBox(height: 10.px),
                                        CommonWidgets.commonElevatedButton(
                                          wantContentSizeButton: true,
                                          onPressed: () =>
                                              controller.clickOnEditButton(),
                                          buttonColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          child: Text(
                                            StringConstants.edit,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    fontSize: 16.px,
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                        width: 100.px,
                                        height: 100.px,
                                        child: getRadialGauge()),
                                  ),
                                ],
                              ),
                            ),
                          )*/
                    /*
                        ],
                      ),
                    ),
                    SizedBox(height: 10.px),*/
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.px),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14.px),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                StringConstants.dailyActivity,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        fontSize: 20.px,
                                        color: Theme.of(context).primaryColor),
                              ),
                              SizedBox(height: 8.px),
                              Text(
                                'Date : ${DateTime.now().toString()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontSize: 10.px),
                              ),
                              SizedBox(height: 20.px),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  stepProgressBar(
                                      text: stepCount.value.toString(),
                                      textTitle: StringConstants.steps),
                                  /* stepProgressBar(
                                      text: '760 kCal',
                                      textTitle: StringConstants.calories),*/
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    if (controller.data.isNotEmpty)
                      ListView.builder(
                        itemCount: controller.data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.px)),
                            onTap: () => controller.clickOnCard(index: index),
                            title: Text(
                              controller.data[index].categoryName.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 14.px),
                            ),
                            subtitle: (controller.data[index].type ==
                                    ApiKeyConstants.progressBar)
                                ? LinearProgressIndicator(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).primaryColor,
                                    ),
                                    value: double.parse(
                                        '.${controller.data[index].description!.split(',')[0]}'),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.px)),
                                  )
                                : Text(
                                    controller.data[index].description!
                                        .toString(),
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(fontSize: 12.px),
                                  ),
                            leading: CommonWidgets.imageView(
                                image: controller.data[index].categoryImage
                                    .toString(),
                                height: 40.px,
                                width: 40.px,
                                radius: 4.px),
                            trailing: (controller.data[index].type !=
                                    ApiKeyConstants.progressBar)
                                ? const SizedBox()
                                : Text(
                                    controller.data[index].description!
                                        .split(',')[1]
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(fontSize: 10.px),
                                  ),
                          );
                        },
                      ),
                    SizedBox(height: 20.px),
                  ],
                ),
              ),
              SizedBox(height: 20.px),
            ],
          ),
        ),
      );
    });
  }

  Widget getRadialGauge() {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
        minimum: 0.px,
        maximum: 100.px,
        showLabels: false,
        showTicks: false,
        startAngle: 270.px,
        endAngle: 270.px,
        axisLineStyle: AxisLineStyle(
          thickness: 0.05.px,
          thicknessUnit: GaugeSizeUnit.factor,
        ),
        pointers: <GaugePointer>[
          RangePointer(
            value: 78.5.px,
            width: 0.95.px,
            color: Theme.of(Get.context!).primaryColor,
            pointerOffset: 0.05.px,
            sizeUnit: GaugeSizeUnit.factor,
          )
        ],
      )
    ]);
  }

  stepProgressBar({
    required String text,
    required String textTitle,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 100.px,
          height: 100.px,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100.px,
                height: 100.px,
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(Get.context!)
                      .colorScheme
                      .onSecondary
                      .withOpacity(.4),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(Get.context!).primaryColor,
                  ),
                  value: .6,
                  strokeWidth: 14.px,
                  strokeAlign: .4.px,
                  strokeCap: StrokeCap.round,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.px),
                child: Container(
                  width: 80.px,
                  height: 80.px,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.px),
                      color: Theme.of(Get.context!).primaryColor),
                  child: Padding(
                    padding: EdgeInsets.all(8.px),
                    child: Center(
                      child: Text(
                        'Calories Burned: ${(stepCount.value * 0.05).round().toString()}',
                        textAlign: TextAlign.center,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .titleSmall
                            ?.copyWith(
                              fontSize: 10.px,
                              color: Theme.of(Get.context!)
                                  .scaffoldBackgroundColor,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 24.px),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textTitle,
              style: Theme.of(Get.context!)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 12.px),
            ),
            SizedBox(height: 8.px),
            Text(
              text,
              style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                  fontSize: 10.px, color: Theme.of(Get.context!).primaryColor),
            ),
          ],
        )
      ],
    );
  }
}
