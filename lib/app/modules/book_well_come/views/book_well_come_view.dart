import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/book_well_come_controller.dart';

class BookWellComeView extends GetView<BookWellComeController> {
  const BookWellComeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(),
          body: ListView(
            children: [
              SizedBox(height: 40.px),
              if (controller.result.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Welcome',
                          style: Theme.of(context).textTheme.displayMedium),
                      SizedBox(height: 10.px),
                      Text('Discover our classes & packages',
                          style: Theme.of(context).textTheme.titleMedium),
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
              if (controller.result.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.result.length,
                  itemBuilder: (context, index) => ListTile(
                    tileColor: controller.selectedValue.value == index
                        ? Theme.of(context).primaryColor.withOpacity(.8.px)
                        : Theme.of(context).scaffoldBackgroundColor,
                    onTap: () => controller.clickOnCard(index: index),
                    trailing: Padding(
                      padding: const EdgeInsets.only(bottom: 8, right: 8),
                      child: CommonWidgets.imageView(
                        radius: 0.px,
                        image: controller.result[index].zmzbpImage.toString(),
                        width: 24.px,
                        height: 24.px,
                      ),
                    ),
                    title: Text(
                      controller.result[index].zmzbpName.toString() ?? '',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 18.px,
                              ),
                    ),
                    subtitle: Text(
                        controller.result[index].zmzbpDescription.toString() ??
                            '',
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                ),
              SizedBox(height: 20.px),
              if (controller.result.isNotEmpty &&
                  controller.selectedValue.value != 1000)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: CommonWidgets.commonElevatedButton(
                    onPressed: () => controller.clickOnGetStartButton(),
                    child: Text(
                      StringConstants.getStarted,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
