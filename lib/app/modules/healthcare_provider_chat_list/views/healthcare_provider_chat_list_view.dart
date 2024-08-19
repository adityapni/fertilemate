import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/healthcare_provider_chat_list_controller.dart';

class HealthcareProviderChatListView
    extends GetView<HealthcareProviderChatListController> {
  const HealthcareProviderChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CommonWidgets.appBarView(title: StringConstants.healthcareProvider),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.px),
                CommonWidgets.commonTextFieldForLoginSignUP(
                  controller: controller.searchController,
                  borderRadius: 15.px,
                  fillColor:
                      Theme.of(context).colorScheme.onSecondary.withOpacity(.2),
                  hintText: StringConstants.search,
                  prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconConstants.icSearch,
                        height: 24.px,
                        width: 24.px,
                      ),
                    ],
                  ),
                  /* suffixIcon: Image.asset(
                    IconConstants.icFilter,
                    height: 24.px,
                    width: 24.px,
                  ),*/
                ),
                SizedBox(height: 20.px),
              ],
            ),
          ),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => controller.clickOnListTile(index: index),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(20.px),
                  child: Image.asset(
                    ImageConstants.imageDr,
                    height: 40.px,
                    width: 40.px,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  'Jenny Wilson',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 16.px),
                ),
                subtitle: Text(
                  'Have you spoken to the delivery...',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 14.px),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "08:00am",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 14.px),
                    ),
                    Container(
                      height: 20.px,
                      width: 20.px,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.px),
                          color: Theme.of(context).primaryColor),
                      child: Center(
                        child: Text(
                          "2",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  fontSize: 10.px,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 20.px),
        ],
      ),
    );
  }
}
