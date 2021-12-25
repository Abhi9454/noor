import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noor/helpers/url_launcher.dart';
import 'package:noor/viewModels/library_view_model.dart';
import 'package:noor/viewModels/menu_view_model.dart';
import 'package:noor/views/LibraryPageWidget/library_page_widget.dart';
import 'package:noor/views/MenuPageWidget/Widget/menu_login_card_widget.dart';
import 'package:provider/provider.dart';

import '../../config.dart';
import '../MenuPageWidget/Widget/menu_divider_widget.dart';
import '../MenuPageWidget/Widget/menu_profile_widget.dart';

class MenuPageWidget extends StatelessWidget {
  MenuPageWidget({Key? key}) : super(key: key);

  final UrlLauncher _urlLauncher = UrlLauncher();

  @override
  Widget build(BuildContext context) {
    Provider.of<MenuViewModel>(context, listen: false).fetchUserName();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().menuPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: Consumer<MenuViewModel>(
        builder: (con, menuViewModel, _) {
          return SizedBox(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: menuViewModel.isUserExist
                        ? MenuProfileWidget(
                            imageLink:
                                'https://bootspider.com/demo-site/noor/assets/images/user-sm/8.jpg',
                            userName: menuViewModel.userName)
                        : const MenuLoginCardWidget(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Browse Options',
                      style: TextStyle(
                          color: AppConfig().primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.clock,
                      size: 18,
                      color: AppConfig().primaryColor,
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    title: const Text(
                      'Daily Prayer',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: (){
                      _urlLauncher.launchInWebViewWithJavaScript(AppConfig().dailyPrayerLink);
                    },
                  ),
                  const MenuDividerWidget(),
                  ListTile(
                   leading: Icon(
                     FontAwesomeIcons.user,
                     size: 18,
                     color: AppConfig().primaryColor,
                   ),
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    title: const Text(
                      'About Us',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: (){
                      _urlLauncher.launchInWebViewWithJavaScript(AppConfig().aboutUsPageLink);
                    },
                  ),
                  const MenuDividerWidget(),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.newspaper,
                      size: 18,
                      color: AppConfig().primaryColor,
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    title: const Text(
                      'News and Updates',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: (){
                      _urlLauncher.launchInWebViewWithJavaScript(AppConfig().newsPageLink);
                    },
                  ),
                  const MenuDividerWidget(),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.fly,
                      size: 18,
                      color: AppConfig().primaryColor,
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    title: const Text(
                      'Faraiz e Vilayat',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: (){
                      _urlLauncher.launchInWebViewWithJavaScript(AppConfig().vilayatPageLink);
                    },
                  ),
                  const MenuDividerWidget(),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.heart,
                      size: 18,
                      color: AppConfig().primaryColor,
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    title: const Text(
                      'Niyyats',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: (){
                      _urlLauncher.launchInWebViewWithJavaScript(AppConfig().niyatsPageLink);
                    },
                  ),
                  const MenuDividerWidget(),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.handsWash,
                      size: 18,
                      color: AppConfig().primaryColor,
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    title: const Text(
                      'Seerat',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: (){
                      _urlLauncher.launchInWebViewWithJavaScript(AppConfig().seeratPageLink);
                    },
                  ),
                  const MenuDividerWidget(),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.mosque,
                      size: 18,
                      color: AppConfig().primaryColor,
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    title: const Text(
                      'Masjid',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: (){
                      _urlLauncher.launchInWebViewWithJavaScript(AppConfig().mashjidLocationPage);
                    },
                  ),
                  const MenuDividerWidget(),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.fileAudio,
                      size: 18,
                      color: AppConfig().primaryColor,
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    title: const Text(
                      'Audio',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: (){
                      _urlLauncher.launchInWebViewWithJavaScript('https://nooremahdavia.com/audio.php');
                    },
                  ),
                  const MenuDividerWidget(),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.fileVideo,
                      size: 18,
                      color: AppConfig().primaryColor,
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    title: const Text(
                      'Video',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: (){
                      _urlLauncher.launchInWebViewWithJavaScript('https://nooremahdavia.com/visual.php');
                    },
                  ),
                  const MenuDividerWidget(),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.prayingHands,
                      size: 18,
                      color: AppConfig().primaryColor,
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    title: const Text(
                      'Dua\'s',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: (){
                      _urlLauncher.launchInWebViewWithJavaScript('https://nooremahdavia.com/dua.php');
                    },
                  ),
                  const MenuDividerWidget(),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.pray,
                      size: 18,
                      color: AppConfig().primaryColor,
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    title: const Text(
                      'Ritual',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: (){
                      _urlLauncher.launchInWebViewWithJavaScript(AppConfig().ritualPageLink);
                    },
                  ),
                  const MenuDividerWidget(),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.bookReader,
                      size: 18,
                      color: AppConfig().primaryColor,
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    title: const Text(
                      'Quran',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: (){
                      _urlLauncher.launchInWebViewWithJavaScript('https://nooremahdavia.com/quran.php');
                    },
                  ),
                  const MenuDividerWidget(),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.bookOpen,
                      size: 18,
                      color: AppConfig().primaryColor,
                    ),
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                    title: const Text(
                      'Library',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MultiProvider(providers: <
                                  ChangeNotifierProvider<LibraryViewModel>>[
                                ChangeNotifierProvider<LibraryViewModel>(
                                    create: (_) => LibraryViewModel())
                              ], child: const LibraryPageWidget())));
                    },
                  ),
                  const MenuDividerWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
