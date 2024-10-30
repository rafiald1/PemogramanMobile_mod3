import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:praktikum_mod_1/api/firebase_api.dart';
import 'package:praktikum_mod_1/app/routes/app_pages.dart';
import 'package:praktikum_mod_1/firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();
// Inisialisasi pesan Firebase
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
// Tangani pesan saat aplikasi tidak aktif
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
