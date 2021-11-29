import 'package:flutter/material.dart';
import '../MenuPageWidget/Widget/menu_divider_widget.dart';
import '../MenuPageWidget/Widget/menu_item_widget.dart';
import '../MenuPageWidget/Widget/menu_profile_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config.dart';

class MenuPageWidget extends StatelessWidget {
  const MenuPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().menuPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: MenuProfileWidget(imageLink: 'https://bootspider.com/demo-site/noor/assets/images/user-sm/8.jpg', userName: 'Mohammad Abdul Sheikh'),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Browse Options',
                  style: TextStyle(
                    color: AppConfig().primaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.normal
                  ),
                ),
              ),
              const MenuItemWidget(icon: FontAwesomeIcons.clock, itemName: 'Daily Prayer'),
              const MenuDividerWidget(),
              const MenuItemWidget(icon: FontAwesomeIcons.quran, itemName: 'About Islam'),
              const MenuDividerWidget(),
              const MenuItemWidget(icon: FontAwesomeIcons.newspaper, itemName: 'News and Updates'),
              const MenuDividerWidget(),
              const MenuItemWidget(icon: FontAwesomeIcons.handHoldingHeart, itemName: 'Faraiz e Nabuwat '),
              const MenuDividerWidget(),
              const MenuItemWidget(icon: FontAwesomeIcons.fly, itemName: 'Faraiz e Vilayat'),
              const MenuDividerWidget(),
              const MenuItemWidget(icon: FontAwesomeIcons.heart, itemName: 'Niyyats'),
              const MenuDividerWidget(),
              const MenuItemWidget(icon: FontAwesomeIcons.handsWash, itemName: 'Wudu'),
              const MenuDividerWidget(),
              const MenuItemWidget(icon: FontAwesomeIcons.mosque, itemName: 'Masjid'),
              const MenuDividerWidget(),
              const MenuItemWidget(icon: FontAwesomeIcons.fileAudio, itemName: 'Audio/Visual'),
              const MenuDividerWidget(),
              const MenuItemWidget(icon: FontAwesomeIcons.prayingHands, itemName: 'Dua\'s'),
              const MenuDividerWidget(),
              const MenuItemWidget(icon: FontAwesomeIcons.pray, itemName: 'Ritual'),
              const MenuDividerWidget(),
              const MenuItemWidget(icon: FontAwesomeIcons.bookOpen, itemName: 'Quran'),
              const MenuDividerWidget(),
              const MenuItemWidget(icon: Icons.contact_support, itemName: 'Contact Us'),
              const MenuDividerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
