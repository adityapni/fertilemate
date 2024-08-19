import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../common/validations.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/ask_question_forum_controller.dart';

class AskQuestionForumView extends GetView<AskQuestionForumController> {
  const AskQuestionForumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(),
          body: ListView(
            children: [
              SizedBox(height: 20.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Text(
                  'Ask a Question',
                  maxLines: 3,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 30.px,
                      ),
                ),
              ),
              SizedBox(height: 10.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.px),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.listOfTextTitle.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.px),
                          child: CommonWidgets.commonTextFieldForLoginSignUP(
                            validator: (value) =>
                                FormValidator.isEmptyValid(value: value),
                            controller: textControllers(index: index),
                            fillColor: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.2.px),
                            hintText: controller.listOfTextTitle[index]['hint'],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  children: [
                    Card(
                      elevation: 0.px,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.px),
                      ),
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
                                    height: 120.px,
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
                                height: 120.px,
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
                                      StringConstants.uploadSupportingImage,
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
                    SizedBox(height: 40.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnPostQuestionButton(),
                      child: Text(
                        StringConstants.postQuestion,
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
              SizedBox(height: 10.px),
            ],
          ),
        ),
      );
    });
  }

  TextEditingController textControllers({required int index}) {
    switch (index) {
      case 0:
        return controller.firstNameController;
      case 1:
        return controller.yourAgeController;
      case 2:
        return controller.yourLocationController;
      case 3:
        return controller.yourEmailController;
      default:
        return controller.yourPhoneNumberCodeController;
    }
  }
}
