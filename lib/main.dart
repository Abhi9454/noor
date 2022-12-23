import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noor/services/notification_service.dart';
import 'package:noor/viewModels/qibla_view_model.dart';
import 'package:noor/views/DailyPrayerPage/daily_prayer_page_widget.dart';
import 'package:noor/views/QiblaPageWidget/qibla_page_widget.dart';
import 'viewModels/store_page_view_model.dart';
import 'views/StorePage/store_page_widget.dart';
import 'viewModels/ask_us_view_model.dart';
import 'views/AskUsPage/ask_us_page_widget.dart';
import 'config.dart';
import 'viewModels/home_page_view_model.dart';
import '../views/HomePage/home_page_head_page_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_background_service/flutter_background_service.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  await initializeService();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConfig().appName,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => HomePageViewModel()),
          ],
          child: const NavigationTab(),
        ));
  }
}

class NavigationTab extends StatefulWidget {
  const NavigationTab({Key? key}) : super(key: key);

  @override
  _NavigationTabState createState() => _NavigationTabState();
}

class _NavigationTabState extends State<NavigationTab> {
  int _currentIndex = 0;
  final List<Widget> _children = <Widget>[
    ChangeNotifierProvider<HomePageViewModel>(
      create: (_) => HomePageViewModel(),
      child: const HomePageHeadWidget(),
    ),
    ChangeNotifierProvider<QiblaViewModel>(
      create: (_) => QiblaViewModel(),
      child: const QiblaPageWidget(),
    ),
    ChangeNotifierProvider<StorePageViewModel>(
      create: (_) => StorePageViewModel(),
      child: const StorePageWidget(),
    ),
    ChangeNotifierProvider<AskUsViewModel>(
      create: (_) => AskUsViewModel(),
      child: AskUsPageWidget(),
    ),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        // new
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppConfig().primaryColor,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: AppConfig().primaryColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.accessibility_rounded),
              label: 'Qibla',
              backgroundColor: AppConfig().primaryColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_bag),
              label: 'E-Store',
              backgroundColor: AppConfig().primaryColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.support_agent),
              label: 'Ask Us',
              backgroundColor: AppConfig().primaryColor),
        ],
      ),
    );
  }
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();


  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will be executed when app is in foreground or background in separated isolate
      onStart: onStart,

      // auto start service
      autoStart: true,
      isForegroundMode: false,
      autoStartOnBoot: true
     // foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: true,

      // this will be executed when app is in foreground in separated isolate
      onForeground: onStart,

      // you have to enable background fetch capability on xcode project
     // onBackground: onIosBackground,
    ),
  );

  service.startService();
}


@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // bring to foreground
  Timer.periodic(const Duration(hours: 24), (timer) async {
    NotificationService().showNotifications();
    // service.invoke(
    //   'update',
    // );
  });
}
