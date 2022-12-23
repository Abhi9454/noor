import 'package:flutter/material.dart';
import 'dart:io';
import '../../config.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NabuwatPageWidget extends StatefulWidget {
  const NabuwatPageWidget({Key? key}) : super(key: key);

  @override
  State<NabuwatPageWidget> createState() => _NabuwatPageWidgetState();
}

class _NabuwatPageWidgetState extends State<NabuwatPageWidget> {

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().nabuwatPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      // body: SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: const [
      //         Text(
      //           'Content Loading..',
      //           maxLines: 2,
      //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: WebView(
        initialUrl: 'https://nooremahdavia.com/nabuwat.php',
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
        onProgress: (int progress) {
          print('Loading (progress : $progress%)');
          Center(child: Text('$progress%', style: const TextStyle(color: Colors.black),),);
        },
      ),
    );
  }
}
