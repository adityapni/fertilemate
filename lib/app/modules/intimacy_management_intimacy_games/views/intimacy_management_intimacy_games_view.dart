import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/intimacy_management_intimacy_games_controller.dart';

class IntimacyManagementIntimacyGamesView
    extends GetView<IntimacyManagementIntimacyGamesController> {
  const IntimacyManagementIntimacyGamesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IntimacyManagementIntimacyGamesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'IntimacyManagementIntimacyGamesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
