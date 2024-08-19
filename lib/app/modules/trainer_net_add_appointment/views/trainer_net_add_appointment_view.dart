import 'package:fertility_boost/app/data/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../common/validations.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/trainer_net_add_appointment_controller.dart';

class TrainerNetAddAppointmentView
    extends GetView<TrainerNetAddAppointmentController> {
  const TrainerNetAddAppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          body: Column(
            children: [
              Image.asset(
                ImageConstants.imageAddAppointment,
                height: MediaQuery.of(context).size.height / 4.px,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: ListView.builder(
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
                    ),
                    SizedBox(height: 8.px),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmptyValid(value: value),
                          controller: controller.doctorsBookingTimeController,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          hintText: 'Time',
                          onTap: () => controller.clickOnTime(),
                          readOnly: true),
                    ),
                    SizedBox(height: 8.px),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmptyValid(value: value),
                          controller: controller.doctorsBookingDateController,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          hintText: 'Date',
                          onTap: () => controller.clickOnDate(),
                          readOnly: true),
                    ),
                    /* SizedBox(height: 8.px),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmptyValid(value: value),
                          controller:
                              controller.doctorsBookingDoctorsIdController,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          hintText: 'Trainers',
                          readOnly: true,
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(14.px),
                                    topLeft: Radius.circular(14.px),
                                  ),
                                ),
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          RadioListTile(
                                        activeColor:
                                            Theme.of(context).primaryColor,
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        selected: true,
                                        groupValue: controller.selectedRadio,
                                        value: index,
                                        onChanged: (value) async {
                                          if (value != null) {
                                            controller.selectedRadio = value;
                                            setState(() {});
                                          }
                                        },
                                        title: Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                controller.data[index]
                                                    .personalTrainerName
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(fontSize: 14.px),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      itemCount: controller.data.length,
                                    );
                                  });
                                });
                          }),
                    ),*/
                    SizedBox(height: 8.px),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmptyValid(value: value),
                          controller: controller.personalTrainerCatIdController,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          hintText: 'Trainers Category',
                          readOnly: true,
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(14.px),
                                    topLeft: Radius.circular(14.px),
                                  ),
                                ),
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          RadioListTile(
                                        activeColor:
                                            Theme.of(context).primaryColor,
                                        controlAffinity:
                                            ListTileControlAffinity.trailing,
                                        selected: true,
                                        groupValue: controller
                                            .selectedRadioTrainersCategory,
                                        value: index,
                                        onChanged: (value) async {
                                          if (value != null) {
                                            controller
                                                    .selectedRadioTrainersCategory =
                                                value;
                                            setState(() {});
                                          }
                                        },
                                        title: Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                controller.data[index].ptcName
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(fontSize: 14.px),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      itemCount: controller.data.length,
                                    );
                                  });
                                });
                          }),
                    ),
                    SizedBox(height: 20.px),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: CommonWidgets.commonElevatedButton(
                        onPressed: () =>
                            controller.clickOnAddAppointmentButton(),
                        child: Text(
                          StringConstants.addAppointment,
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

  TextEditingController textControllers({required int index}) {
    switch (index) {
      case 0:
        return controller.emailController;
      case 1:
        return controller.firstNameController;
      case 2:
        return controller.clientsSurNameController;
      case 3:
        return controller.descriptionController;
      case 4:
        return controller.amountController;
      default:
        return controller.clientsPhoneNumberController;
    }
  }
}
