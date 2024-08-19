import 'package:fertility_boost/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBarView(title: controller.title.value),
        body: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.px),
            child: SingleChildScrollView(
              child: Html(
                data: controller.data?.description ?? '',
              ),
            ),
          ),
        ),
      );
    });
  }
}
