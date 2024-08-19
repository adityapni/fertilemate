import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/modules/cycle_tracking_ultrasoundimage/controllers/cycle_tracking_ultrasoundimage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/apis/api_models/get_ultrasound_history_model.dart';
import '../../../data/constants/image_constants.dart';

class CycleTrackingUltrasoundImageView
    extends GetView<CycleTrackingUltrasoundImageController> {
  const CycleTrackingUltrasoundImageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.inAsyncCall.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: 'Upload Ultrasound Image'),
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.px),
                          child: Image.asset(
                            ImageConstants.imageUtrasound,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    Text(
                      '4/11/2023 Saturday 9:38PM \nDoctors Remarks',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 14.px,
                              ),
                    ),
                    /*   SizedBox(height: 10.px),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.px))),
                      child: Padding(
                        padding: EdgeInsets.all(10.px),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5.px),
                                    Text(
                                      'Track your basal body',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 12.px,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(height: 10.px),
                                    Text(
                                      'Record your',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 16.px,
                                          ),
                                    ),
                                    SizedBox(height: 5.px),
                                  ],
                                )),
                            Expanded(
                                flex: 2,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: CommonWidgets.commonElevatedButton(
                                        onPressed: () {},
                                        wantContentSizeButton: true,
                                        child: Text(
                                          "Add reading",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  fontSize: 10.px,
                                                  color: Colors.white),
                                        )))),
                          ],
                        ),
                      ),
                    ),*/
                    SizedBox(height: 20.px),
                    Text(
                      StringConstants.patientsRemarks,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 16.px),
                    ),
                    SizedBox(height: 15.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: StringConstants.patientsRemarks,
                      controller: controller.patientRemarkController,
                      maxLines: 3,
                      isCard: true,
                      borderRadius: 12,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 14.px, color: Colors.black87),
                    ),
                    SizedBox(height: 20.px),
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(12),
                        //   border: Border.all(color: Colors.grey),
                        //   boxShadow: [
                        //     BoxShadow(
                        //     blurRadius: 20,
                        //     color: Colors.grey.withOpacity(00.4),
                        //   )]
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                              child: Text(
                            StringConstants.patientsRemarks,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 16.px),
                          )),
                        )),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () {
                        controller.openUltraSoundImageEditView();
                      },
                      child: Text(
                        "Save Permarks",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 16.px, color: Colors.white),
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
                    controller.historyPresent.value
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
                                    onTap: () =>
                                        controller.clickOnHistoryCard(index),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(8.px),
                                          decoration: BoxDecoration(
                                            // color: Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(20.px),
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
            ],
          ),
        ),
      );
    });
  }
}
