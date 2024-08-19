import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../controllers/tvs_scan_package_controller.dart';

class TvsScanPackageView extends GetView<TvsScanPackageController> {
  const TvsScanPackageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: CommonWidgets.commonElevatedButton(onPressed: (){},
          //
          //       child: Text("Add Appointment",style: TextStyle(fontSize: 14.px),)),
          // ),
          appBar: CommonWidgets.appBarView(title: "My Appointments"),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                if (controller.appointmentList.length > 0)
                  for (int i = 0; i < controller.appointmentList.length; i++)
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(0.4))),
                      child: ListTile(
                        leading: CommonWidgets.imageView(
                            image:
                                controller.appointmentList[i].doctorImage ?? '',
                            width: 80.px),
                        title: Text(
                          "Premium Package",
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.appointmentList[i].doctorName}",
                              style: TextStyle(
                                  color: Color(0xffb2acac),
                                  fontSize: 14.px,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              controller.appointmentList[i].clinicName!,
                              style: TextStyle(
                                  color: Color(0xffb2acac),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.px),
                            ),
                            Text(
                              "${controller.appointmentList[i].time}",
                              style: TextStyle(
                                  color: Color(0xffb2acac),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.px),
                            ),
                          ],
                        ),
                        trailing: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.px),
                              color: Theme.of(context).primaryColor),
                          child: Text(
                            "${DateFormat('MMM dd').format(DateTime.parse(controller.appointmentList[i].date.toString()))}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.px),
                          ),
                        ),
                      ),
                    ),
                if (controller.appointmentList.length == 0)
                  Center(
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Center(child: Text("No data found"))),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
