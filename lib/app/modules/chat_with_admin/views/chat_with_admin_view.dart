import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/chat_with_admin_controller.dart';

class ChatWithAdminView extends GetView<ChatWithAdminController> {
  const ChatWithAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: WillPopScope(
          onWillPop: () => controller.clickOnBackButton(),
          child: Scaffold(
            appBar: CommonWidgets.appBarView(title: 'Administrator'),
            body: Column(
              children: [
                buildListMessage(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.px, vertical: 20.px),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          controller: controller.textController,
                          // onFieldSubmitted: (value) => controller.clickOnSendButton(),
                          borderRadius: 30.px,
                          // onTap: () => controller.jump(),
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2),
                          hintText: StringConstants.typeHere,
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(8.px),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                /* GestureDetector(
                                    onTap: () =>
                                        controller.clickOnAttachmentButton(),
                                    child: Image.asset(
                                      IconConstants.icAttachment,
                                      height: 34.px,
                                      width: 34.px,
                                    ),
                                  ),*/
                                Obx(() {
                                  controller.count.value;
                                  return controller.buttonValue.value
                                      ? Image.asset(
                                          IconConstants.icSend,
                                          height: 34.px,
                                          width: 34.px,
                                        )
                                      : InkWell(
                                          borderRadius:
                                              BorderRadius.circular(18.px),
                                          onTap: () =>
                                              controller.clickOnSendButton(),
                                          child: Image.asset(
                                            IconConstants.icSend,
                                            height: 34.px,
                                            width: 34.px,
                                          ),
                                        );
                                }),
                              ],
                            ),
                          ),
                          prefixIcon: Padding(
                              padding: EdgeInsets.all(8.px),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(18.px),
                                onTap: () =>
                                    controller.clickOnAttachmentButton(),
                                child: Image.asset(
                                  IconConstants.icPhotos,
                                  height: 34.px,
                                  width: 34.px,
                                ),
                              )),
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildListMessage() {
    return Expanded(
      child: (controller.result.isNotEmpty)
          ? ListView.builder(
              // reverse: true,
              controller: controller.scrollController,
              itemCount: controller.result.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
                    if (controller.result[index].date != null &&
                        (!controller.checkDateShowOrNot(
                                index == 0
                                    ? controller.result[0].date
                                    : controller.result[index - 1].date,
                                controller.result[index].date) ||
                            index == 0))
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(4.px),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(8.px),
                            ),
                            child: Center(
                              child: Text(
                                DateFormat('dd-MM-yyyy')
                                    .format(DateTime.parse(
                                        controller.result[index].date ?? ''))
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontSize: 12.px,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 20.px),
                    Align(
                      alignment: controller.result[index].senderId.toString() ==
                              controller.userId
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4.px,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.px),
                          child: Column(
                            crossAxisAlignment:
                                (controller.result[index].senderId.toString() !=
                                        controller.userId)
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.end,
                            children: [
                              if (controller.result[index].chatImage != '')
                                controller.result[index].chatImage
                                        .toString()
                                        .contains('.pdf')
                                    ? GestureDetector(
                                        onTap: () {
                                          controller
                                              .clickOnChatImagesAndDownload(
                                                  controller.result[index]
                                                      .chatImage!);
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(20.px),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.px),
                                                  border: Border.all(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      width: 1.px)),
                                              child: Icon(
                                                Icons.picture_as_pdf_outlined,
                                                size: 50.px,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                            SizedBox(height: 5.px),
                                            Text(
                                              controller.result[index].timeAgo
                                                      .toString() ??
                                                  '',
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                      fontSize: 8.px,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                            ),
                                          ],
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          controller
                                              .clickOnChatImagesAndDownload(
                                                  controller.result[index]
                                                      .chatImage!);
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonWidgets.imageView(
                                              height: 100.px,
                                              width: 100.px,
                                              image: controller
                                                  .result[index].chatImage!,
                                            ),
                                            SizedBox(height: 5.px),
                                            Text(
                                              controller.result[index].timeAgo
                                                      .toString() ??
                                                  '',
                                              textAlign: TextAlign.end,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                      fontSize: 8.px,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                            ),
                                          ],
                                        )),
                              if (controller.result[index].chatMessage !=
                                      null &&
                                  controller.result[index].chatMessage
                                      .toString()
                                      .isNotEmpty)
                                Column(
                                  children: [
                                    SizedBox(height: 4.px),
                                    Container(
                                      padding: EdgeInsets.all(8.px),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10.px),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.result[index].chatMessage
                                                    .toString() ??
                                                '',
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    fontSize: 14.px,
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor),
                                          ),
                                          SizedBox(height: 8.px),
                                          Text(
                                            controller.result[index].timeAgo
                                                    .toString() ??
                                                '',
                                            textAlign: TextAlign.end,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    fontSize: 8.px,
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          : const Center(
              child: Text('No messages...'),
            ),
    );
  }
}
