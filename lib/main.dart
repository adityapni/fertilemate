import 'dart:async';

import 'package:fertility_boost/common/theme_data.dart';
import 'package:fertility_boost/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'app/app_controller/ac.dart';
import 'app/routes/app_pages.dart';
import 'common/notification.dart';

///TODO PROJECT DEVELOPMENT USE GETX STRUCTURE

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    showNotification(
        body: message.notification?.body ?? '',
        data: message.data['data'] ?? '',
        title: message.notification?.title ?? 'Fertilemate');
  }
}

Future<void> showNotification(
    {required String body, required String data, required String title}) async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();
  try {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '1',
      'Fertilemate',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      visibility: NotificationVisibility.public,
      icon: '@mipmap/ic_launcher',
      color: Theme.of(Get.context!).primaryColor,
      enableVibration: true,
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title, // Notification title
      body, // Notification body
      platformChannelSpecifics,
      payload: body,
    );
  } catch (e) {
    print('e:::::::::::::::::::::::::$e');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationService().initNotification();
  tz.initializeTimeZones();
  //FOR INTERNET CONNECTIVITY
  late StreamSubscription streamSubscription;
  AC().getNetworkConnectionType();
  streamSubscription = AC().checkNetworkConnection();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: FBThemeData.themeData(fontFamily: 'BeVietnamPro'),
    ),
  );
}
