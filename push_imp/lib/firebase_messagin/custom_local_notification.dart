import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CustomLocalNotification {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late AndroidNotificationChannel channel;

  CustomLocalNotification() {
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications',
      importance: Importance.max,
    );

    _configuraAndroid().then((value) {
      flutterLocalNotificationsPlugin = value;
      inicializeNotifications();
    });
  }

  Future<FlutterLocalNotificationsPlugin> _configuraAndroid() async {
    var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    return flutterLocalNotificationsPlugin;
  }

  androidNotification(
    RemoteNotification notification,
    AndroidNotification android,
  ) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: android.smallIcon,
          priority: Priority.high,
          styleInformation: BigTextStyleInformation(notification.body as String),
        ),
      ),
    );
  }

  iosNotification(
    RemoteNotification notification,
    AppleNotification ios,
  ) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      const NotificationDetails(
        iOS: IOSNotificationDetails(),
      ),
    );
  }

  inicializeNotifications() {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = IOSInitializationSettings();

    flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: android,
        iOS: ios,
      ),
    );
  }
}
