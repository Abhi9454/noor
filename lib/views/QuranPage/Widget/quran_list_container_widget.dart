import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noor/config.dart';
import 'package:noor/models/quran_model.dart';

class QuranListContainer extends StatelessWidget {
  const QuranListContainer({required this.quranModel, Key? key})
      : super(key: key);

  final QuranModel quranModel;



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Icon(
          FontAwesomeIcons.bookReader,
          color: AppConfig().primaryColor,
        ),
        title: Text(
          quranModel.quranTitle,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            quranModel.quranDetail,
            maxLines: 15,
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.normal,
                fontSize: 13),
          ),
        ),
      ),
    );
  }
}
