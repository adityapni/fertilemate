import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/blood_report_controller.dart';

class BloodReportView extends GetView<BloodReportController> {
  const BloodReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CommonWidgets.commonElevatedButton(
              onPressed: () => controller.clickOnDownloadButton(),
              child: Text(
                StringConstants.download,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10.px),
          ],
        ),
      ),
      appBar: CommonWidgets.appBarView(title: StringConstants.bloodReport),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              children: [
                SizedBox(height: 20.px),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.px),
                  child: Image.asset(
                    ImageConstants.imageBloodReport,
                    height: 380.px,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20.px),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
