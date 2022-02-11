import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noor/config.dart';
import 'package:noor/models/news_model.dart';

class NewsListContainer extends StatelessWidget {
  const NewsListContainer({required this.newsModel, Key? key})
      : super(key: key);

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Icon(
          FontAwesomeIcons.newspaper,
          color: AppConfig().primaryColor,
        ),
        title: Text(
          newsModel.newsTitle,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Text(
                newsModel.newsDetail,
                maxLines: 10,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                'Published On: ' + newsModel.newsDate,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                    fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
