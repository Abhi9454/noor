import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  Future<void> launchInWebViewWithJavaScript(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      enableJavaScript: true,
    )) {
      throw 'Could not launch $url';
    }
  }
}
