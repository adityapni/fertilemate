import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/trainer_net_wel_come_controller.dart';

class TrainerNetWelComeView extends GetView<TrainerNetWelComeController> {
  const TrainerNetWelComeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrainerNetWelComeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TrainerNetWelComeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
