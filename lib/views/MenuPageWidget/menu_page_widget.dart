import 'package:flutter/material.dart';
import 'package:noor/viewModels/menu_view_model.dart';
import 'package:noor/views/MenuPageWidget/Widget/menu_login_card_widget.dart';
import '../MenuPageWidget/Widget/menu_divider_widget.dart';
import '../MenuPageWidget/Widget/menu_item_widget.dart';
import '../MenuPageWidget/Widget/menu_profile_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../config.dart';

class MenuPageWidget extends StatelessWidget {
  const MenuPageWidget({Key? key}) : super(key: key);

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
                    child: menuViewModel.isUserExist ? MenuProfileWidget(
                        imageLink:
                        'https://bootspider.com/demo-site/noor/assets/images/user-sm/8.jpg',
                        userName: menuViewModel.userName) :
                    const MenuLoginCardWidget(),
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
                  MenuItemWidget(
                      icon: FontAwesomeIcons.clock,
                      itemName: 'Daily Prayer',
                      pageName: ''),
                  const MenuDividerWidget(),
                  MenuItemWidget(
                    icon: FontAwesomeIcons.quran,
                    itemName: 'About Islam',
                    pageName: 'aboutUs',
                  ),
                  const MenuDividerWidget(),
                  MenuItemWidget(
                      icon: FontAwesomeIcons.newspaper,
                      itemName: 'News and Updates',
                      pageName: 'newsPage'),
                  const MenuDividerWidget(),
                  MenuItemWidget(
                    icon: FontAwesomeIcons.handHoldingHeart,
                    itemName: 'Faraiz e Nabuwat',
                    pageName: 'faraizPage',
                  ),
                  const MenuDividerWidget(),
                  MenuItemWidget(
                    icon: FontAwesomeIcons.fly,
                    itemName: 'Faraiz e Vilayat',
                    pageName: 'vilayatPage',
                  ),
                  const MenuDividerWidget(),
                  MenuItemWidget(
                    icon: FontAwesomeIcons.heart,
                    itemName: 'Niyyats',
                    pageName: 'niyatPage',
                  ),
                  const MenuDividerWidget(),
                  MenuItemWidget(
                    icon: FontAwesomeIcons.handsWash,
                    itemName: 'Seerat',
                    pageName: 'seeratPage',
                  ),
                  const MenuDividerWidget(),
                  MenuItemWidget(
                    icon: FontAwesomeIcons.mosque,
                    itemName: 'Masjid',
                    pageName: 'masjidPage',
                  ),
                  const MenuDividerWidget(),
                  MenuItemWidget(
                    icon: FontAwesomeIcons.fileAudio,
                    itemName: 'Audio/Visual',
                    pageName: '',
                  ),
                  const MenuDividerWidget(),
                  MenuItemWidget(
                    icon: FontAwesomeIcons.prayingHands,
                    itemName: 'Dua\'s',
                    pageName: '',
                  ),
                  const MenuDividerWidget(),
                  MenuItemWidget(
                    icon: FontAwesomeIcons.pray,
                    itemName: 'Ritual',
                    pageName: 'ritualPage',
                  ),
                  const MenuDividerWidget(),
                  MenuItemWidget(
                    icon: FontAwesomeIcons.bookOpen,
                    itemName: 'Quran',
                    pageName: '',
                  ),
                  const MenuDividerWidget(),
                  MenuItemWidget(
                    icon: Icons.contact_support,
                    itemName: 'Contact Us',
                    pageName: 'contactUs',
                  ),
                  const MenuDividerWidget(),
                  MenuItemWidget(
                    icon: Icons.contact_support,
                    itemName: 'Library',
                    pageName: 'library',
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
