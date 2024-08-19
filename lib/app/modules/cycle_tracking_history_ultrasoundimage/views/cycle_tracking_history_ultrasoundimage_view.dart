import 'dart:io';

import 'package:fertility_boost/app/modules/cycle_tracking_history_ultrasoundimage/controller/cycle_tracking_history_ultrasoundimage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';

class CycleTrackingHistoryUltrasoundImageView
    extends GetView<CycleTrackingHistoryUltrasoundImageController> {
  const CycleTrackingHistoryUltrasoundImageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.inAsyncCall.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: 'History Ultrasound Image'),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
                    /* ListTile(
                      leading: SizedBox(
                        height: 60.px,width: 60.px,
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(30.px),
                          child: Image.asset(
                            ImageConstants.imageGirl,
                            height: 60.px,
                            width: 60.px,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title:  Text('Welcome to MyCycle!',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                            fontSize: 16.px,
                            color:
                            Theme.of(context).primaryColor),
                      ),
                      subtitle: Text('Hey There',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                          fontSize: 12.px,
                        ),
                      ),
                    ),*/
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.px))),
                      child: SizedBox(
                        height: 200.px,
                        width: double.infinity,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Obx(() => controller.image.value == null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10.px),
                                    child: CommonWidgets.imageView(
                                        image: controller
                                                .historyUltrasound?.image ??
                                            '',
                                        fit: BoxFit.fill,
                                        radius: 15.px),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10.px),
                                    child: Image.file(
                                      height: 200.px,
                                      fit: BoxFit.fill,
                                      File(
                                        controller.image.value!.path.toString(),
                                      ),
                                    ),
                                  )),
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
                    ),
                    SizedBox(height: 20.px),
                    Text(
                      '${controller.historyUltrasound?.dateTime} \nDoctors Remarks',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 14.px,
                              ),
                    ),
                    SizedBox(height: 20.px),
                    Text(
                      'Remarks',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 16.px,
                              ),
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: 'Enter Remark',
                      controller: controller.remarkController,
                      keyboardType: TextInputType.text,
                      maxLines: 5,
                      isCard: true,
                      borderRadius: 12,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 14.px, color: Colors.black87),
                    ),
                    /*  Text(
                      StringConstants
                          .withAVarietyOfCoachesToChooseFromMindCoachProvidesAStressFreeWayToFindThePerfectMentalHealthCoach,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 14.px),
                    ),*/
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                        onPressed: () {
                          controller.clickOnEditButton();
                        },
                        child: Text(
                          "Edit",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 16.px, color: Colors.white),
                        )),
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
