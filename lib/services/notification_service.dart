import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:location/location.dart';
import 'package:intl/intl.dart';

import '../models/location_model.dart';
import 'location_service.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService {
  static final NotificationService _notificationService =
  NotificationService._internal();
  final localNotifications = FlutterLocalNotificationsPlugin();
  late Welcome _welcome;
  late SharedPreferences preferences;

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  Future<void> init() async {


    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('notify');


    const InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: null,
        macOS: null);

    await localNotifications.initialize(initializationSettings);
  }



  tz.TZDateTime _convertTime(int hour, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minutes,
    );
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }

  Future<void> showNotifications() async {
    final LocationService _locationService = LocationService();
    preferences = await SharedPreferences.getInstance();
    _welcome = await _locationService.fetchLocationDetails(preferences.getString('date') ?? '', preferences.getString('lat') ?? '', preferences.getString('lon') ?? '');
    print('this is welcome notification${_welcome.data.date.toString()}');
    AndroidNotificationDetails _androidNotificationDetails =
    const AndroidNotificationDetails(
      'channel ID',
      'channel name',
      playSound: true,
      priority: Priority.high,
      importance: Importance.high,
    );

    NotificationDetails platformChannelSpecifics =
    NotificationDetails(
        android: _androidNotificationDetails,
        iOS: null);

    // await localNotifications.show(
    //   Random().nextInt(1023019230),
    //   'Fajr Time',
    //   'The Fajr Timing will be ${_welcome.data.timings.fajr.toString()}',
    //   platformChannelSpecifics,
    //   payload: 'Notification Payload',
    // );

    await localNotifications.zonedSchedule(
      Random().nextInt(1023019230),
      'Noor-e-Mahdavia',
      'The Fajr Timing will be ${_welcome.data.timings.fajr}',
      _convertTime(DateTime.parse(_welcome.data.timings.fajr).hour, DateTime.parse(_welcome.data.timings.fajr).minute).subtract(const Duration(minutes: 30)),
      platformChannelSpecifics,
      payload: 'Notification Payload',
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime, androidAllowWhileIdle: true,
    );

    await localNotifications.zonedSchedule(
      Random().nextInt(1023019230),
      'Noor-e-Mahdavia',
      'The Maghrib Timing will be ${_welcome.data.timings.maghrib}',
      _convertTime(DateTime.parse(_welcome.data.timings.maghrib).hour, DateTime.parse(_welcome.data.timings.maghrib).minute).subtract(const Duration(minutes: 30)),
      platformChannelSpecifics,
      payload: 'Notification Payload',
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime, androidAllowWhileIdle: true,
    );

    await localNotifications.zonedSchedule(
      Random().nextInt(1023019230),
      'Noor-e-Mahdavia',
      'The Sunset Timing will be ${_welcome.data.timings.sunset}',
      _convertTime(DateTime.parse(_welcome.data.timings.sunset).hour, DateTime.parse(_welcome.data.timings.sunset).minute).subtract(const Duration(minutes: 30)),
      platformChannelSpecifics,
      payload: 'Notification Payload',
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime, androidAllowWhileIdle: true,
    );

    await localNotifications.zonedSchedule(
      Random().nextInt(1023019230),
      'Noor-e-Mahdavia',
      'The Sunrise Timing will be ${_welcome.data.timings.sunrise}',
      _convertTime(DateTime.parse(_welcome.data.timings.sunrise).hour, DateTime.parse(_welcome.data.timings.sunrise).minute).subtract(const Duration(minutes: 30)),
      platformChannelSpecifics,
      payload: 'Notification Payload',
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime, androidAllowWhileIdle: true,
    );

    await localNotifications.zonedSchedule(
      Random().nextInt(1023019230),
      'Noor-e-Mahdavia',
      'The Zuhr Timing will be ${_welcome.data.timings.dhuhr}',
      _convertTime(DateTime.parse(_welcome.data.timings.dhuhr).hour, DateTime.parse(_welcome.data.timings.dhuhr).minute).subtract(const Duration(minutes: 30)),
      platformChannelSpecifics,
      payload: 'Notification Payload',
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime, androidAllowWhileIdle: true,
    );

    await localNotifications.zonedSchedule(
      Random().nextInt(1023019230),
      'Noor-e-Mahdavia',
      'The Asr Timing will be ${_welcome.data.timings.asr}',
      _convertTime(DateTime.parse(_welcome.data.timings.asr).hour, DateTime.parse(_welcome.data.timings.asr).minute).subtract(const Duration(minutes: 30)),
      platformChannelSpecifics,
      payload: 'Notification Payload',
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime, androidAllowWhileIdle: true,
    );

    await localNotifications.zonedSchedule(
      Random().nextInt(1023019230),
      'Noor-e-Mahdavia',
      'The Isha Timing will be ${_welcome.data.timings.isha}',
      _convertTime(DateTime.parse(_welcome.data.timings.isha).hour, DateTime.parse(_welcome.data.timings.isha).minute).subtract(const Duration(minutes: 30)),
      platformChannelSpecifics,
      payload: 'Notification Payload',
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime, androidAllowWhileIdle: true,
    );

   }

}