import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notifications/blocs/auth/auth_bloc.dart';
import 'package:notifications/repositories/auth_repository.dart';
import 'package:notifications/screens/home_screen.dart';
import 'package:notifications/screens/login_screen.dart';
import 'package:notifications/utils/session_manager.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('📩 [Background] Message: ${message.messageId}');
  print('📩 [Background] Message: ${message.data}');

  // Pastikan notifikasi dan judulnya tidak null
  if (message.notification != null && message.notification!.title != null) {
    // Ambil detail dari pesan FCM
    final notification = message.notification!;
    final android = message.notification!.android;

    // Siapkan detail notifikasi untuk Android menggunakan channel yang sudah dibuat
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'high_importance_channel', // ID Channel yang Anda buat di main()
      'High Importance Notifications',
      channelDescription: 'Used for important notifications',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher', // Pastikan ikon ini ada
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // Tampilkan notifikasi
    await flutterLocalNotificationsPlugin.show(
      notification.hashCode, // ID unik untuk notifikasi
      notification.title,
      notification.body,
      platformChannelSpecifics,
    );
  }
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // ⬇️ Tambahkan di sini
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'Used for important notifications',
    importance: Importance.high,
  );
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  final token = await SessionManager.getToken();
  final initialRoute = token != null ? '/home' : '/';
  runApp(MyApp(
    initialRoute: initialRoute,
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(AuthRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login App',
        initialRoute: initialRoute,
        routes: {
          '/': (_) => const LoginScreen(),
          '/home': (_) => const HomeScreen(),
        },
      ),
    );
  }
}
