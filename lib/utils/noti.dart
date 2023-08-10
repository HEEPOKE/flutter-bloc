import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> initializeNoti(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  const androidInitialize = AndroidInitializationSettings('mipmap-hdpi/ic_launcher');
  const iosInitialize = DarwinInitializationSettings();
  const initializationSettings = InitializationSettings(
    android: androidInitialize,
    iOS: iosInitialize,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}
