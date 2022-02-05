import 'package:flutter/material.dart';
import 'package:noor/config.dart';
import 'package:url_launcher/url_launcher.dart';


class DailyPrayerPageWidget extends StatefulWidget {
  const DailyPrayerPageWidget({Key? key}) : super(key: key);

  @override
  _DailyPrayerPageWidgetState createState() => _DailyPrayerPageWidgetState();
}

class _DailyPrayerPageWidgetState extends State<DailyPrayerPageWidget> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openUrl();
  }

  openUrl() async{
    if (!await launch(AppConfig().dailyPrayerLink,
      forceSafariVC: true,
      forceWebView: true,
      enableJavaScript: true,
    )) {
      throw 'Could not launch';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
