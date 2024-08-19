import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../controllers/cycle_tracking_add_symtopm_tracker_controller.dart';

class CycleTrackingAddSymtopmTrackerView
    extends GetView<CycleTrackingAddSymtopmTrackerController> {
  const CycleTrackingAddSymtopmTrackerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: 'Add Symptoms Tracker'),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.px, right: 20.px, bottom: 10.px),
        child: CommonWidgets.commonElevatedButton(
            onPressed: () {
              controller.clickOnSubmitButton();
            },
            borderRadius: 10.px,
            child: Text(
              "Save",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 16.px, color: Colors.white),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonWidgets.commonTextFieldForLoginSignUP(
                controller: controller.datePickerController,
                hintText: 'Date',
                isCard: true,
                readOnly: true,
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
            SizedBox(
              height: 10.px,
            ),
            const Text(
              'Symptoms Tracker',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            Obx(() {
              controller.count.value;
              return ListView.builder(
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        controller.changeSelectionStatus(index);
                      },
                      trailing: Icon(
                        controller.selectedCervicalStatus[index]
                            ? Icons.check_box
                            : Icons.square_outlined,
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
            SizedBox(
              height: 20.px,
            ),
            const Text(
              'Mood Tracker',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            SizedBox(
              height: 20.px,
            ),
            Obx(() {
              controller.selectedIndex.value;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.selectedIndex.value = 1;
                    },
                    child: Container(
                      width: 100.px,
                      height: 100.px,
                      padding: EdgeInsets.all(20.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.px),
                          border: Border.all(
                              color: controller.selectedIndex.value == 1
                                  ? Colors.teal
                                  : Colors.grey.withOpacity(0.5),
                              width: 1.px)),
                      child:
                          Center(child: Image.asset(IconConstants.icFaceFrown)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.selectedIndex.value = 2;
                    },
                    child: Container(
                      width: 100.px,
                      height: 100.px,
                      padding: EdgeInsets.all(20.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.px),
                          border: Border.all(
                              color: controller.selectedIndex.value == 2
                                  ? Colors.teal
                                  : Colors.grey.withOpacity(0.5),
                              width: 1.px)),
                      child:
                          Center(child: Image.asset(IconConstants.icFaceMeh)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.selectedIndex.value = 3;
                    },
                    child: Container(
                      width: 100.px,
                      height: 100.px,
                      padding: EdgeInsets.all(20.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.px),
                          border: Border.all(
                              color: controller.selectedIndex.value == 3
                                  ? Colors.teal
                                  : Colors.grey.withOpacity(0.5),
                              width: 1.px)),
                      child:
                          Center(child: Image.asset(IconConstants.icFaceSmile)),
                    ),
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
