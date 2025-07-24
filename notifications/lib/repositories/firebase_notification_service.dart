import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class FirebaseNotificationService {
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initNotification() async {
    // Inisialisasi local notifications
    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
        InitializationSettings(android: androidInit);

    await _localNotificationsPlugin.initialize(initSettings);
  }

  static void setupFirebaseMessagingHandlers() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('📥 Message received in foreground');
      print('📬 Title: ${message.notification?.title}');
      print('📬 Body: ${message.notification?.body}');

      final notification = message.notification;
      final android = notification?.android;

      if (notification != null && android != null) {
        _showNotification(notification.title, notification.body);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('🔔 Notifikasi dibuka: ${message.notification?.title}');
      // TODO: Tambahkan navigasi jika perlu
    });
  }

  static Future<void> _showNotification(String? title, String? body) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'Notifikasi dari Firebase',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await _localNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      notificationDetails,
    );
  }

  static Future<void> requestNotificationPermission() async {
    final status = await Permission.notification.status;
    if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) {
      await Permission.notification.request();
    }
  }
}
