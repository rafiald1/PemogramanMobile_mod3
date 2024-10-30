import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    // Meminta izin dari pengguna
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      await _initLocalNotification();
      await _getFCMToken();
      await initPushNotification();
    } else {
      print('User declined or has not accepted permission');
    }
  }

  Future<void> _getFCMToken() async {
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken'); // Token FCM untuk debugging atau testing
  }

  Future<void> _initLocalNotification() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher'); // Sesuaikan icon

    final InitializationSettings initSettings =
        InitializationSettings(android: androidSettings);

    await _localNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        if (response.payload != null) {
          navigatorKey.currentState?.pushNamed(
            '/notification_screen',
            arguments: response.payload,
          );
        }
      },
    );
  }

  Future<void> initPushNotification() async {
    // Menangani pesan saat aplikasi dibuka dari status terminated
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        handleMessage(message);
      }
    });

    // Menangani pesan saat aplikasi berada di background dan dibuka pengguna
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      handleMessage(message);
    });

    // Menampilkan notifikasi pop-up saat aplikasi di-foreground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        showForegroundNotification(message);
      }
    });
  }

  void showForegroundNotification(RemoteMessage message) {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'your_channel_id', // Ganti dengan ID channel Anda
      'your_channel_name', // Ganti dengan nama channel
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    _localNotificationsPlugin.show(
      message.hashCode, // ID notifikasi unik
      message.notification?.title ?? 'No Title',
      message.notification?.body ?? 'No Body',
      platformDetails,
      payload: message.data.toString(), // Data sebagai payload
    );
  }

  void handleMessage(RemoteMessage message) {
    navigatorKey.currentState?.pushNamed(
      '/notification_screen',
      arguments: message.data,
    );
  }
}
