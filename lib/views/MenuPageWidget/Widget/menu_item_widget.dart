import 'package:flutter/material.dart';
import 'package:noor/helpers/url_launcher.dart';
import 'package:noor/viewModels/contact_us_view_model.dart';
import 'package:noor/viewModels/library_view_model.dart';
import 'package:noor/views/ContactUsPage/contact_us_page_widget.dart';
import 'package:noor/views/LibraryPageWidget/library_page_widget.dart';
import '../../../viewModels/masjid_location_view_model.dart';
import '../../MasjidLocationPage/masjid_location_page_widget.dart';
import 'package:provider/provider.dart';

import '../../../config.dart';


class MenuItemWidget extends StatelessWidget {

  MenuItemWidget({required this.icon, required this.itemName,required this.pageName,Key? key}) : super(key: key);
  final IconData icon;
  final String itemName;
  final String pageName;
  final UrlLauncher _urlLauncher = UrlLauncher();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(pageName == 'aboutUs'){
          _urlLauncher.launchInWebViewWithJavaScript(AppConfig().aboutUsPageLink);
        }
        else if(pageName == 'dailyPrayer'){
          _urlLauncher.launchInWebViewWithJavaScript(AppConfig().dailyPrayerLink);
        }
        else if(pageName == 'newsPage'){
          _urlLauncher.launchInWebViewWithJavaScript(AppConfig().newsPageLink);
        }
        else if(pageName == 'faraizPage'){
          _urlLauncher.launchInWebViewWithJavaScript(AppConfig().faraizPageLink);
        }
        else if(pageName == 'vilayatPage'){
          _urlLauncher.launchInWebViewWithJavaScript(AppConfig().vilayatPageLink);
        }
        else if(pageName == 'niyatPage'){
          _urlLauncher.launchInWebViewWithJavaScript(AppConfig().niyatsPageLink);
        }
        else if(pageName == 'seeratPage'){
          _urlLauncher.launchInWebViewWithJavaScript(AppConfig().seeratPageLink);
        }
        else if(pageName == 'ritualPage'){
          _urlLauncher.launchInWebViewWithJavaScript(AppConfig().ritualPageLink);
        }
        else if(pageName == 'masjidPage'){
          _urlLauncher.launchInWebViewWithJavaScript(AppConfig().mashjidLocationPage);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => MultiProvider(providers: <
          //             ChangeNotifierProvider<
          //                 MasjidLocationViewModel>>[
          //           ChangeNotifierProvider<MasjidLocationViewModel>(
          //               create: (_) => MasjidLocationViewModel())
          //         ], child: const MasjidLocationPageWidget())));
        }
        else if(pageName == 'contactUs'){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MultiProvider(providers: <
                      ChangeNotifierProvider<
                          ContactUsViewModel>>[
                    ChangeNotifierProvider<ContactUsViewModel>(
                        create: (_) => ContactUsViewModel())
                  ], child: ContactUsPageWidget())));
        }
        else if(pageName == 'library'){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MultiProvider(providers: <
                      ChangeNotifierProvider<
                          LibraryViewModel>>[
                    ChangeNotifierProvider<LibraryViewModel>(
                        create: (_) => LibraryViewModel())
                  ], child: const LibraryPageWidget())));
        }
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
          const EdgeInsets.fromLTRB(25, 10, 25, 0),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 18,
                color: AppConfig().primaryColor,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                children: <Widget>[
                  Text(
                    itemName,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
