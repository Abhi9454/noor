import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import '../../config.dart';

class DailyPrayerPageWidget extends StatelessWidget {
  DailyPrayerPageWidget({Key? key}) : super(key: key);

  final pdfController = PdfController(
    document: PdfDocument.openAsset('images/dailyPrayer.pdf'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().dailyPrayerPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body:  PdfView(
        controller: pdfController,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
