import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_cervical_mucus_history_model.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/cycle_tracking_cervical_mucus_egg_controller.dart';

class CycleTrackingCervicalMucusEggView
    extends GetView<CycleTrackingCervicalMucusEggController> {
  const CycleTrackingCervicalMucusEggView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: 'Cervical Mucus'),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.px, right: 20.px, bottom: 10.px),
        child: CommonWidgets.commonElevatedButton(
            onPressed: () {
              controller.clickOnSubmitButton();
              //controller.openSystemAlarm();
            },
            borderRadius: 10.px,
            child: Obx(() => controller.btnLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.white,
                  ))
                : Text(
                    "Save",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 16.px, color: Colors.white),
                  ))),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CommonWidgets.commonTextFieldForLoginSignUP(
                  controller: controller.datePickerController,
                  hintText: 'Date',
                  readOnly: true,
                  isCard: true,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.clickOnDate();
                    },
                    child: Icon(
                      Icons.date_range,
                      color: Colors.teal,
                      size: 20.px,
                    ),
                  )),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Cervical Mucus Condition',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Obx(() {
              controller.count.value;
              return ListView.builder(
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        controller.changeSelectionStatus(index);
                      },
                      leading: Icon(
                        controller.selectedCervicalStatus[index]
                            ? Icons.circle
                            : Icons.circle_outlined,
                        color: Colors.teal,
                        size: 20,
                      ),
                      title: Text(
                        controller.titleList[index],
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                      ),
                    );
                  });
            }),
            Padding(
              padding: EdgeInsets.only(left: 20.px, right: 20.px),
              child: CommonWidgets.commonTextFieldForLoginSignUP(
                hintText: 'Add notes ...',
                controller: controller.notesController,
                maxLines: 5,
                isCard: true,
                keyboardType: TextInputType.text,
                borderRadius: 8,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 14.px, color: Colors.black87),
              ),
            ),
            SizedBox(height: 20.px),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                StringConstants.history,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 16.px),
              ),
            ),
            SizedBox(height: 10.px),
            Obx(() {
              return controller.presentCervicalData.value
                  ? SizedBox(
                      height: 150.px,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.historyList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            GetCervicalMucusHistoryData item =
                                controller.historyList[index];
                            return GestureDetector(
                              onTap: () {
                                controller.showAlertDialog(index);
                              },
                              child: Container(
                                width: 250.px,
                                padding: EdgeInsets.all(5.px),
                                margin: EdgeInsets.all(5.px),
                                decoration: BoxDecoration(
                                  // color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(10.px),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary
                                        .withOpacity(.4.px),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Cervical Mucus Condition',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.teal,
                                      ),
                                    ),
                                    Text(
                                      item.conditionData ?? '',
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              fontSize: 10.px,
                                              fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 5.px),
                                    const Text(
                                      'Remark',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.teal,
                                      ),
                                    ),
                                    Text(
                                      item.remark.toString(),
                                      maxLines: 3,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              fontSize: 10.px,
                                              fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      item.date ?? '',
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 150.px,
                      child: CommonWidgets.dataNotFound(),
                    );
            }),
            SizedBox(height: 20.px),
          ],
        ),
      ),
    );
  }
}
