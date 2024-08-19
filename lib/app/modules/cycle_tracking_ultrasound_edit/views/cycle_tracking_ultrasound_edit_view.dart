import 'dart:io';

import 'package:fertility_boost/app/modules/cycle_tracking_ultrasound_edit/controllers/cycle_tracking_ultrasound_edit_controller.dart';
import 'package:fertility_boost/common/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../common/validations.dart';
import '../../../data/apis/api_models/get_ultrasound_history_model.dart';
import '../../../data/constants/string_constants.dart';

class CycleTrackingUltraSoundEditView
    extends GetView<CycleTrackingUltraSoundEditController> {
  const CycleTrackingUltraSoundEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: GestureDetector(
          onTap: () => CommonMethods.unFocsKeyBoard(),
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: CommonWidgets.appBarView(),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.px),
                        Container(
                          height: 200.px,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.px),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 1.px,
                            ),
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Obx(() => controller.image.value != null
                                  ? ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(10.px),
                                      child: Image.file(
                                        height: 200.px,
                                        fit: BoxFit.fill,
                                        File(
                                          controller.image.value!.path
                                              .toString(),
                                        ),
                                      ),
                                    )
                                  : const SizedBox()),
                              Center(
                                child: IconButton(
                                  onPressed: () {
                                    controller.showAlertDialog();
                                  },
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 40.px,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20.px),
                        Center(
                          child: Text(
                            "Upload your TVS Scan image",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 16.px),
                          ),
                        ),
                        SizedBox(height: 20.px),
                        /* CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isNameValid(value: value),
                          controller: controller.dateController,
                          isCard: controller.isDate.value,
                          focusNode: controller.focusDate,
                          keyboardType: TextInputType.datetime,
                          hintText: 'dd/mm/yyyy',
                          hintTextColor: controller.isDate.value,
                        ),
                        SizedBox(height: 20.px),*/
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmailValid(value: value),
                          controller: controller.patientsRemarkController,
                          isCard: controller.isPatientsRemark.value,
                          focusNode: controller.focusPatientsRemote,
                          hintText: StringConstants.patientsRemarks,
                          hintTextColor: controller.isPatientsRemark.value,
                          maxLines: 5,
                        ),
                        /*SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmptyValid(value: value),
                          controller: controller.doctorsNoteController,
                          isCard: controller.isDoctorsNote.value,
                          focusNode: controller.focusDoctorsNote,
                          hintText: 'Doctors Note',
                          hintTextColor: controller.isDoctorsNote.value,
                        ),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isNumberValid(value: value),
                          controller: controller.patientIdController,
                          isCard: controller.isPatientId.value,
                          focusNode: controller.focusPatientId,
                          hintText: 'Patient ID',
                          hintTextColor: controller.isPatientId.value,
                        ),*/
                        SizedBox(height: 50.px),
                        CommonWidgets.commonElevatedButton(
                          onPressed: () {
                            controller.clickOnSubmitButton();
                          },
                          child: Text(
                            "Save",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 16.px, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 20.px),
                        Text(
                          StringConstants.history,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 16.px),
                        ),
                        SizedBox(height: 10.px),
                        controller.historyList.isNotEmpty
                            ? SizedBox(
                                height: 150.px,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: ListView.builder(
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      UltrasoundImageHistoryData item =
                                          controller.historyList[index];
                                      return GestureDetector(
                                        onTap: () => controller
                                            .clickOnHistoryCard(index),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(8.px),
                                              decoration: BoxDecoration(
                                                // color: Theme.of(context).primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.px),
                                                border: Border.all(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary
                                                      .withOpacity(.4.px),
                                                ),
                                              ),
                                              child: CommonWidgets.imageView(
                                                  image: item.image ?? '',
                                                  height: 110.px,
                                                  width: 110.px,
                                                  fit: BoxFit.cover,
                                                  radius: 20.px),
                                            ),
                                            Text(
                                              item.dateTime.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                    fontSize: 12.px,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: controller.historyList.length,
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 150.px,
                                child: CommonWidgets.dataNotFound(),
                              ),
                        SizedBox(height: 20.px),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
