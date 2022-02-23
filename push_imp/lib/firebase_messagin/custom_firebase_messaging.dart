import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:push_imp/firebase_messagin/custom_local_notification.dart';

class CustomFirebaseMessaging {
  final CustomLocalNotification _customLocalNotification;

  CustomFirebaseMessaging._internal(this._customLocalNotification);
  static final CustomFirebaseMessaging _singleton = CustomFirebaseMessaging._internal(
    CustomLocalNotification(),
  );

  factory CustomFirebaseMessaging() => _singleton;

  Future<void> inicialize() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(badge: true, sound: true);

    FirebaseMessaging.onMessage.listen(
      (message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        AppleNotification? ios = message.notification?.apple;

        if (notification != null && android != null) {
          _customLocalNotification.androidNotification(notification, android);
        } else if (notification != null && ios != null) {
          _customLocalNotification.iosNotification(notification, ios);
        }
      },
    );
  }

  getTokenFirebase() async => debugPrint(await FirebaseMessaging.instance.getToken());
}
