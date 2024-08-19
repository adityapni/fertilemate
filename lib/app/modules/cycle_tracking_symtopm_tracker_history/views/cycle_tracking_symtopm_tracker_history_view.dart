import 'package:fertility_boost/app/data/apis/api_models/get_period_symtoms_history_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/cycle_tracking_symtopm_tracker_history_controller.dart';

class CycleTrackingSymtopmTrackerHistoryView
    extends GetView<CycleTrackingSymtopmTrackerHistoryController> {
  const CycleTrackingSymtopmTrackerHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: 'Period Symptoms History'),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.px, right: 20.px, bottom: 10.px),
        child: CommonWidgets.commonElevatedButton(
            onPressed: () {
              controller.clickOnAddSymptomsRecord();
            },
            borderRadius: 10.px,
            child: Text(
              "Add Your Symtopms Record",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 16.px, color: Colors.white),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '  Period Symptoms History',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10.px,
            ),
            Obx(() => controller.inAsyncCall.value
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.teal,
                  ))
                : Obx(() => controller.historyPresent.value
                    ? Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.periodSymptomsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                PeriodSymtomsHistoryDoctor item =
                                    controller.periodSymptomsList[index];
                                return GestureDetector(
                                  onTap: () {
                                    controller.showAlertDialog(index);
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.px),
                                    ),
                                    elevation: 2.px,
                                    margin: EdgeInsets.all(8.px),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0.px),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    'Date & Time :',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black87),
                                                  )),
                                              Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    item.date ?? '',
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black54),
                                                    textAlign: TextAlign.end,
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.px,
                                          ),
                                          Row(
                                            children: [
                                              const Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    'Symptoms :',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black87),
                                                  )),
                                              Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    item.tracker ?? '',
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black54),
                                                    textAlign: TextAlign.end,
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8.px,
                                          ),
                                          Row(
                                            children: [
                                              const Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    'Mood :',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black87),
                                                  )),
                                              Expanded(
                                                  flex: 3,
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Image.asset(
                                                      getIcon(item.mood ?? '1'),
                                                      height: 50.px,
                                                      width: 50.px,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
                    : CommonWidgets.dataNotFound())),
          ],
        ),
      ),
    );
  }

  String getIcon(String type) {
    switch (type) {
      case '1':
        return IconConstants.icFaceFrown;
      case '2':
        return IconConstants.icFaceMeh;
      case '3':
        return IconConstants.icFaceSmile;
    }
    return IconConstants.icFaceSmile;
  }
}
