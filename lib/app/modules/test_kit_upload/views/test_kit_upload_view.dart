import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/test_kit_upload_controller.dart';

class TestKitUploadView extends GetView<TestKitUploadController> {
  const TestKitUploadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: controller.title),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  children: [
                    Card(
                      elevation: 0.px,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.px)),
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(.2.px),
                      child: controller.image.value != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(20.px),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 200.px,
                                    child: Image.file(
                                      controller.image.value ?? File(''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.px),
                                    child: FloatingActionButton(
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
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
                                height: 200.px,
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
                                      StringConstants.uploadPicture,
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
                    ),
                    SizedBox(height: 20.px),
                    (controller.fertilityKitId == '2')
                        ? Column(
                            children: [
                              CommonWidgets.commonTextFieldForLoginSignUP(
                                controller: controller.fshController,
                                borderRadius: 15.px,
                                fillColor: Theme.of(context)
                                    .colorScheme
                                    .onSecondary
                                    .withOpacity(.2),
                                hintText: StringConstants.fsh,
                              ),
                              SizedBox(height: 20.px),
                              CommonWidgets.commonTextFieldForLoginSignUP(
                                controller: controller.thyroidController,
                                borderRadius: 15.px,
                                fillColor: Theme.of(context)
                                    .colorScheme
                                    .onSecondary
                                    .withOpacity(.2),
                                hintText: StringConstants.thyroid,
                              ),
                            ],
                          )
                        : CommonWidgets.commonTextFieldForLoginSignUP(
                            controller: controller.spermConcentrationController,
                            borderRadius: 15.px,
                            fillColor: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.2),
                            hintText: StringConstants.spermConcentration,
                          ),
                    SizedBox(height: 40.px),
                    if (controller.image.value != null)
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnUploadCard(),
                        child: Text(
                          StringConstants.edit,
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
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnUploadButton(),
                      child: Text(
                        StringConstants.upload,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                              fontSize: 12.px,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                      ),
                    ),
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
