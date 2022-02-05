import 'package:flutter/material.dart';
import 'package:noor/viewModels/menu_view_model.dart';
import 'package:noor/views/DailyPrayerPageWidget/daily_prayer_page_widget.dart';
import 'viewModels/store_page_view_model.dart';
import 'views/StorePage/store_page_widget.dart';
import 'views/MenuPageWidget/menu_page_widget.dart';
import 'viewModels/ask_us_view_model.dart';
import 'views/AskUsPage/ask_us_page_widget.dart';
import 'config.dart';
import 'viewModels/home_page_view_model.dart';
import '../views/HomePage/home_page_head_page_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
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
    ChangeNotifierProvider<StorePageViewModel>(
      create: (_) => StorePageViewModel(),
      child: const StorePageWidget(),
    ),
    ChangeNotifierProvider<AskUsViewModel>(
      create: (_) => AskUsViewModel(),
      child: AskUsPageWidget(),
    ),
    const DailyPrayerPageWidget(),
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
              icon: const Icon(Icons.shopping_bag),
              label: 'E-Store',
              backgroundColor: AppConfig().primaryColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.support_agent),
              label: 'Ask Us',
              backgroundColor: AppConfig().primaryColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.drag_handle_sharp),
              label: 'Daily Prayers',
              backgroundColor: AppConfig().primaryColor),
        ],
      ),
    );
  }
}
