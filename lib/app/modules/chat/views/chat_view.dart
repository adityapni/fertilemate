import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: WillPopScope(
          onWillPop: () => controller.clickOnBackButton(),
          child: Scaffold(
              /*floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                    */
              /* prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconConstants.icSmileyEmoji,
                        height: 24.px,
                        width: 24.px,
                      ),
                    ],
                  ),*/
              /*
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(8.px),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          */
              /* Image.asset(
                          IconConstants.icAttachment,
                          height: 34.px,
                          width: 34.px,
                        ),*/
              /*
                          Obx(() {
                            controller.count.value;
                            return controller.buttonValue.value
                                ? SizedBox(
                                    height: 24.px,
                                    width: 24.px,
                                    child: const CircularProgressIndicator())
                                : InkWell(
                                    borderRadius: BorderRadius.circular(18.px),
                                    onTap: () => controller.clickOnSendButton(),
                                    child: Image.asset(
                                      IconConstants.icSend,
                                      height: 34.px,
                                      width: 34.px,
                                    ),
                                  );
                          })
                        ],
                      ),
                    ),
                  ),
                ]),
              ),*/
              appBar: CommonWidgets.appBarView(title: controller.userName),
              body: Column(
                children: [
                  buildListMessage(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.px, vertical: 20.px),
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
                            /* prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconConstants.icSmileyEmoji,
                        height: 24.px,
                        width: 24.px,
                      ),
                    ],
                  ),*/
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.px),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () =>
                                        controller.clickOnAttachmentButton(),
                                    child: Image.asset(
                                      IconConstants.icAttachment,
                                      height: 34.px,
                                      width: 34.px,
                                    ),
                                  ),
                                  Obx(() {
                                    controller.count.value;
                                    return controller.buttonValue.value
                                        ? SizedBox(
                                            height: 24.px,
                                            width: 24.px,
                                            child:
                                                const CircularProgressIndicator())
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
                                  })
                                ],
                              ),
                            ),
                          ),
                        ]),
                  )
                  /*Flexible(
                        child: ListView.builder(
                          reverse: true,
                          itemCount: controller.chat.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20.px),
                                if (controller.chat[index].chatCreatedAt !=
                                        null &&
                                    controller
                                        .chat[index].chatCreatedAt!.isNotEmpty)
                                  Center(
                                    child: Text(
                                      controller.chat[index].chatCreatedAt
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
                                SizedBox(height: 20.px),
                                if (controller.chat[index].chatMessage != null &&
                                    controller
                                        .chat[index].chatMessage!.isNotEmpty)
                                  Align(
                                    alignment:
                                        controller.chat[index].sentBy == 'ME'
                                            ? Alignment.centerRight
                                            : Alignment.centerLeft,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.4.px,
                                      child: Row(
                                        mainAxisAlignment:
                                            (controller.chat[index].sentBy !=
                                                    'ME')
                                                ? MainAxisAlignment.start
                                                : MainAxisAlignment.end,
                                        children: [
                                          controller.chat[index].sentBy == 'ME'
                                              ? const SizedBox()
                                              : CommonWidgets.imageView(
                                                  image: controller
                                                              .chatsChatBetweenUserModel !=
                                                          null
                                                      ? controller
                                                          .chatsChatBetweenUserModel!
                                                          .otherUserImage
                                                          .toString()
                                                      : ImageConstants
                                                          .defaultNetworkImage,
                                                  height: 40.px,
                                                  width: 40.px,
                                                  radius: 20.px),
                                          if (controller.chat[index].sentBy !=
                                              'ME')
                                            SizedBox(width: 10.px),
                                          Container(
                                            padding: EdgeInsets.all(8.px),
                                            decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.px),
                                            ),
                                            child: Text(
                                              controller.chat[index].chatMessage
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                      fontSize: 14.px,
                                                      color: Theme.of(context)
                                                          .scaffoldBackgroundColor),
                                            ),
                                          ),
                                          if (controller.chat[index].sentBy ==
                                              'ME')
                                            SizedBox(width: 10.px),
                                          controller.chat[index].sentBy != 'ME'
                                              ? const SizedBox()
                                              : CommonWidgets.imageView(
                                                  image: controller
                                                              .chatsChatBetweenUserModel !=
                                                          null
                                                      ? controller
                                                          .chatsChatBetweenUserModel!
                                                          .userImage
                                                          .toString()
                                                      : ImageConstants
                                                          .defaultNetworkImage,
                                                  height: 40.px,
                                                  width: 40.px,
                                                  radius: 20.px),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),*/
                ],
              )),
        ),
      );
    });
  }

  Widget buildListMessage() {
    return Expanded(
      child: controller.otherUserId.isNotEmpty
          ? StreamBuilder<QuerySnapshot>(
              stream: controller.firebaseFireStore
                  .collection(StringConstants.chatRoom)
                  .doc(controller.getChatId(
                      controller.userId, controller.otherUserId))
                  .collection(StringConstants.chats)
                  .orderBy(StringConstants.chatCreatedAt, descending: false)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  controller.listMessages = snapshot.data!.docs;
                  if (controller.listMessages.isNotEmpty) {
                    controller.jump();
                    return ListView.builder(
                      // reverse: true,
                      controller: controller.scrollController,
                      itemCount: controller.listMessages.length,
                      itemBuilder: (context, index) {
                        if (controller.listMessages[index] != null &&
                            controller.listMessages[index]![
                                    StringConstants.chatMessage] !=
                                null) {
                          controller.lastMessage = controller
                              .listMessages[index]![StringConstants.chatMessage]
                              .toString();
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.px),
                            if (controller.listMessages[index]
                                        [StringConstants.chatCreatedAt] !=
                                    null &&
                                DateFormat('yyyy-MM-dd')
                                    .format(controller.listMessages[index]
                                            [StringConstants.chatCreatedAt]
                                        .toDate())
                                    .toString()
                                    .isNotEmpty)
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
                                            .format(controller
                                                .listMessages[index][
                                                    StringConstants
                                                        .chatCreatedAt]
                                                .toDate())
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              fontSize: 12.px,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            SizedBox(height: 20.px),
                            Align(
                              alignment: controller.listMessages[index]
                                          ?[StringConstants.sentBy] ==
                                      controller.userId
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 1.4.px,
                                child: Row(
                                  mainAxisAlignment:
                                      (controller.listMessages[index]
                                                  ?[StringConstants.sentBy] !=
                                              controller.userId)
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.end,
                                  children: [
                                    if (controller.listMessages[index]
                                            ?[StringConstants.sentBy] !=
                                        controller.userId)
                                      SizedBox(width: 10.px),
                                    Column(
                                      crossAxisAlignment: (controller
                                                      .listMessages[index]
                                                  ?[StringConstants.sentBy] !=
                                              controller.userId)
                                          ? CrossAxisAlignment.start
                                          : CrossAxisAlignment.end,
                                      children: [
                                        if (controller.listMessages[index]?[
                                                        StringConstants
                                                            .chatImage]
                                                    .toString() !=
                                                null &&
                                            controller.listMessages[index]![
                                                    StringConstants.chatImage]
                                                .toString()
                                                .isNotEmpty)
                                          CommonWidgets.imageView(
                                            height: 100.px,
                                            width: 100.px,
                                            image: controller
                                                .listMessages[index]![
                                                    StringConstants.chatImage]
                                                .toString(),
                                          ),
                                        if (controller.listMessages[index]?[
                                                        StringConstants
                                                            .chatMessage]
                                                    .toString() !=
                                                null &&
                                            controller.listMessages[index]![
                                                    StringConstants.chatMessage]
                                                .toString()
                                                .isNotEmpty)
                                          Column(
                                            children: [
                                              SizedBox(height: 4.px),
                                              Container(
                                                padding: EdgeInsets.all(8.px),
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.px),
                                                ),
                                                child: Text(
                                                  controller.listMessages[index]
                                                              ?[StringConstants
                                                                  .chatMessage]
                                                          .toString() ??
                                                      '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                          fontSize: 14.px,
                                                          color: Theme.of(
                                                                  context)
                                                              .scaffoldBackgroundColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                    if (controller.listMessages[index]
                                            ?[StringConstants.sentBy] ==
                                        controller.userId)
                                      SizedBox(width: 10.px),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('No messages...'),
                    );
                  }
                } else {
                  if (snapshot.hasData) {
                    return CommonWidgets.progressBarView();
                  } else {
                    return CommonWidgets.dataNotFound();
                  }
                }
              })
          : CommonWidgets.dataNotFound(),
    );
  }
}
