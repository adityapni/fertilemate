import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/trainer_net_notification_controller.dart';

class TrainerNetNotificationView
    extends GetView<TrainerNetNotificationController> {
  const TrainerNetNotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrainerNetNotificationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TrainerNetNotificationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
