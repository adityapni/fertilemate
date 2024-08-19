import 'dart:io';

import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class IntimacyManagementController extends GetxController {
  final count = 0.obs;

  List listOfCards = [
    {
      'title': StringConstants.intimacyInsight,
      'icon': IconConstants.icIntimacyInsight
    },
    {
      'title': StringConstants.conversationStarters,
      'icon': IconConstants.icConversationStarters
    },
    {
      'title': StringConstants.languageOfLoveQuotes,
      'icon': IconConstants.icLanguageOfLoveQuotes,
    },
    {
      'title': StringConstants.intimacyCalendar,
      'icon': IconConstants.icIntimacyCalendar,
    },
    /*
    {
      'title': StringConstants.intimacyGames,
      'icon': IconConstants.icIntimacyGames,
    },*/
    {
      'title': StringConstants.romanticSpot,
      'icon': IconConstants.icRomanticSpot,
    },
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnCard({required int index}) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.INTIMACY_MANAGEMENT_INSIGHTS);
        break;
      case 1:
        Get.toNamed(Routes.INTIMACY_MANAGEMENT_CONVERSATION_STARTERS);
        break;
      case 2:
        Get.toNamed(Routes.INTIMACY_MANAGEMENT_LANGUAGE_OF_LOVE_QUOTES);
        break;
      case 3:
        openCalendar();
      /* Get.toNamed(Routes
            .INTIMACY_MANAGEMENT_CALENDAR); */
      /*
        break;
      case 4:
        Get.toNamed(Routes.INTIMACY_GAMES);
        break;*/
      case 4:
        Get.toNamed(Routes.INTIMACY_MANAGEMENT_ROMANTIC_SPOT);
        break;
    }
  }

/*  void openCalendar() async {
    const url = 'content://com.android.calendar/time/';
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching calendar: $e');
    }
  }*/

  void openCalendar() async {
    const androidUrl = 'content://com.android.calendar/time/';
    const iosUrl = 'calshow://';
    try {
      if (Platform.isIOS) {
        if (await canLaunch(iosUrl)) {
          await launch(iosUrl);
        } else {
          throw 'Could not launch $iosUrl';
        }
      } else if (Platform.isAndroid) {
        if (await canLaunch(androidUrl)) {
          await launch(androidUrl);
        } else {
          throw 'Could not launch $androidUrl';
        }
      } else {
        throw 'Unsupported platform';
      }
    } catch (e) {
      print('Error launching calendar: $e');
    }
  }
}
