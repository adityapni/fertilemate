import 'dart:io';

import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/healthcare_provider_controller.dart';

class HealthcareProviderView extends GetView<HealthcareProviderController> {
  const HealthcareProviderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
              title: StringConstants.healthcareProvider),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(16.px),
                child: Card(
                  elevation: 0.px,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.px)),
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(.2.px),
                  child: Column(
                    children: [
                      controller.image.value != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(20.px),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 100.px,
                                    child: Image.file(
                                      controller.image.value ?? File(''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.px),
                                    child: FloatingActionButton(
                                      onPressed: () =>
                                          controller.clickOnDeleteButton(),
                                      child: Icon(
                                        Icons.delete_forever,
                                        color: Theme.of(context).primaryColor,
                                        size: 24.px,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : InkWell(
                              borderRadius: BorderRadius.circular(20.px),
                              onTap: () => controller.clickOnUploadCard(),
                              child: SizedBox(
                                width: double.infinity,
                                height: 100.px,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      IconConstants.icUploadPicture,
                                      height: 30.px,
                                      width: 30.px,
                                    ),
                                    SizedBox(height: 10.px),
                                    Text(
                                      StringConstants.clickToUploadPicture,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              fontSize: 10.px,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonElevatedButton(
                        borderRadius: 20.px,
                        onPressed: () => controller.clickOnUploadButton(),
                        child: Text(
                          StringConstants.upload,
                          style: Theme.of(Get.context!)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 12.px,
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Wrap(
                    children: List.generate(controller.data.length, (index) {
                      final cellWidth = MediaQuery.of(Get.context!).size.width /
                          2.2; // Every cell's `width` will be set to 1/2 of the screen width.
                      return SizedBox(
                        width: cellWidth,
                        height: 120.px,
                        child: GestureDetector(
                          onTap: () => controller.clickOnCard(),
                          child: Padding(
                            padding: EdgeInsets.all(4.px),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.px),
                                    topRight: Radius.circular(10.px),
                                  ),
                                  child: CommonWidgets.imageView(
                                    radius: 0.px,
                                    image: controller.data[index].suImage
                                        .toString(),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: 4.px),
                                        Text(
                                          controller.data[index].suDescription
                                              .toString(),
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  fontSize: 14.px,
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.px),
                                          bottomRight: Radius.circular(10.px),
                                        ),
                                      ),
                                      height: 44.px,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(
                                              IconConstants.icShare,
                                              height: 24.px,
                                              width: 24.px,
                                            ),
                                            Image.asset(
                                              IconConstants.icEyeWhite,
                                              height: 24.px,
                                              width: 24.px,
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ],
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
        ),
      );
    });
  }
}
