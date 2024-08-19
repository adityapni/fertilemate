import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/nutritional_guidance_detail_menu_upload_controller.dart';

class NutritionalGuidanceDetailMenuUploadView
    extends GetView<NutritionalGuidanceDetailMenuUploadController> {
  const NutritionalGuidanceDetailMenuUploadView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: StringConstants.uploadMenu),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                        onPressed: () =>
                                            controller.clickOnDeleteButton(),
                                        child: Icon(
                                          Icons.delete_forever,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
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
                      CommonWidgets.commonTextFieldForLoginSignUP(
                          /* validator: (value) =>
                          FormValidator.isEmptyValid(value: value),*/
                          controller: controller.titleController,
                          hintText: StringConstants.enterTheTitle,
                          borderRadius: 10.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px)),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        /* validator: (value) =>
                          FormValidator.isEmptyValid(value: value),*/
                        controller: controller.descriptionController,
                        hintText: StringConstants.enterTheDescription,
                        borderRadius: 10.px,
                        fillColor: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(.2.px),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnUploadButton(),
                        child: Text(
                          StringConstants.upload,
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
              ),
            ],
          ),
        ),
      );
    });
  }
}
