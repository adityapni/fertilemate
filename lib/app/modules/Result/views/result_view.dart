import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: StringConstants.result),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.px),
                  child: Image.asset(
                    ImageConstants.imageResult,
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
