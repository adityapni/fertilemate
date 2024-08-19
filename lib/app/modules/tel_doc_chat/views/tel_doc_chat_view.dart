import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tel_doc_chat_controller.dart';

class TelDocChatView extends GetView<TelDocChatController> {
  const TelDocChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TelDocChatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TelDocChatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
