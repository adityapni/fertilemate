import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/healthcare_provider_chat_controller.dart';

class HealthcareProviderChatView
    extends GetView<HealthcareProviderChatController> {
  const HealthcareProviderChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.px),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          CommonWidgets.commonTextFieldForLoginSignUP(
            controller: controller.textController,
            borderRadius: 30.px,
            fillColor:
                Theme.of(context).colorScheme.onSecondary.withOpacity(.2),
            hintText: StringConstants.typeHere,
            prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  IconConstants.icSmileyEmoji,
                  height: 24.px,
                  width: 24.px,
                ),
              ],
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.all(8.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    IconConstants.icAttachment,
                    height: 34.px,
                    width: 34.px,
                  ),
                  Image.asset(
                    IconConstants.icSend,
                    height: 34.px,
                    width: 34.px,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
      appBar: CommonWidgets.appBarView(
          actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(IconConstants.icCallIcon,height: 30.px,width: 30.px,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(IconConstants.icVideoCallIcov,height: 30.px,width: 30.px,),
        ),
            SizedBox(width: 5.px,)

         ]
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.px),
                Center(
                  child: Text(
                    'Today 01:25 PM',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 12.px,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                SizedBox(height: 20.px),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.px),
                        child: Image.asset(
                          ImageConstants.imageDr,
                          height: 40.px,
                          width: 40.px,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10.px),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.px),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10.px),
                          ),
                          child: Text(
                            'Not data',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.px),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8.px),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(.2),
                              borderRadius: BorderRadius.circular(10.px),
                            ),
                            child: InkWell(
                              onTap: (){
                                controller.ClickOnStartCall();
                              },
                              child: Text(
                                'Not data',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 14.px),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.px),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.px),
                          child: Image.asset(
                            ImageConstants.imageDr,
                            height: 40.px,
                            width: 40.px,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
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
