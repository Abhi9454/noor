import 'package:flutter/material.dart';
import 'package:noor/config.dart';
import 'package:noor/helpers/url_launcher.dart';

class LibraryListItemWidget extends StatelessWidget {
  LibraryListItemWidget({required this.bookLink, required this.bookTitle,required this.bookLanguage,required this.bookPublishDate,Key? key}) : super(key: key);

  final String bookLink;
  final String bookTitle;
  final String bookLanguage;
  final String bookPublishDate;

  final UrlLauncher _urlLauncher = UrlLauncher();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Image(
              image: const AssetImage(
                'images/book.png', //header logo image
              ),
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 6.0,left: 8.0, right: 8.0),
              child: Text(
                bookTitle  ,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppConfig().primaryColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0,left: 8.0, right: 8.0),
            child: Text(
              bookLanguage + bookPublishDate,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0,left: 8.0, right: 8.0),
            child: ElevatedButton(
              onPressed: () {
                _urlLauncher.launchInWebViewWithJavaScript(bookLink);
              },
              child: const Text('Request to Buy'),
              style: ElevatedButton.styleFrom(
                  primary: AppConfig().primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
