import 'dart:convert';
import 'dart:io' as io;
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:open_filex/open_filex.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:key_space_app/data/models/notifications/payload.dart';

class FirebaseNotificationHandler {
  static onMessage(RemoteMessage message) async {
    createNotification(message: message);
    if (kDebugMode) {}
  }

  static Future<FlutterLocalNotificationsPlugin>
  initNotificationChannel() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestSoundPermission: true,
          requestBadgePermission: true,
        );

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
        );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: localNotificationTap,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    return flutterLocalNotificationsPlugin;
  }

  // local notification tap handle
  @pragma('vm:entry-point')
  static localNotificationTap(NotificationResponse notificationResponse) async {
    if (notificationResponse.payload?.isNotEmpty ?? false) {
      final payloadData = PayLoad.fromJson(
        jsonDecode(notificationResponse.payload!),
      );
      if (payloadData.type == "propertyDocumentDownload") {
        final String filePath = payloadData.payloadData ?? "";
        final Uri uri = Uri.parse(filePath);

        if (!await io.File(uri.toFilePath()).exists()) {
          throw '$uri does not exist!';
        } else {
          await OpenFilex.open(uri.toString());
        }
      }
    }
  }

  // background message handler
  @pragma('vm:entry-point')
  static Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    if (kDebugMode) {}
  }

  //killed state message handler
  @pragma('vm:entry-point')
  static Future<void> killedStateMessageHandle() async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance
        .getInitialMessage();
    if (initialMessage != null) {}
  }

  //notification tap handel(in background)
  static void handleMessage(RemoteMessage message) {}

  //create notification
  static Future<void> createNotification({
    required RemoteMessage message,
  }) async {
    math.Random random = math.Random();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          channelDescription:
              'This channel is used for important notifications.',
          importance: Importance.max,
          priority: Priority.high,
        );
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      random.nextInt(100),
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
      payload: "",
    );
  }

  void createProgressNotification({required int count, required int i}) {
    math.Random random = math.Random();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          channelDescription:
              'This channel is used for progress notifications.',
          channelShowBadge: false,
          importance: Importance.max,
          priority: Priority.high,
          maxProgress: count,
          progress: i,
        );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    flutterLocalNotificationsPlugin.show(
      random.nextInt(100),
      'progress notification title',
      'progress notification body',
      notificationDetails,
      payload: 'item x',
    );
  }

  Future<void> createDownloadNotification({required String filePath}) async {
    math.Random random = math.Random();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          channelDescription:
              'This channel is used for downloaded file notifications.',
          importance: Importance.max,
          priority: Priority.high,
        );
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    final payload = PayLoad(
      type: "propertyDocumentDownload",
      payloadData: filePath,
    );

    await flutterLocalNotificationsPlugin.show(
      random.nextInt(100),
      'Downloaded',
      filePath.substring(filePath.lastIndexOf('/') + 1, filePath.length),
      notificationDetails,
      payload: jsonEncode(payload.toJson()).toString(),
    );
  }
}
