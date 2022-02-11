import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noor/config.dart';
import 'package:noor/models/dua_model.dart';

class DuaListContainer extends StatelessWidget {
  const DuaListContainer({required this.duaModel, Key? key})
      : super(key: key);

  final DuaModel duaModel;



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Icon(
          FontAwesomeIcons.prayingHands,
          color: AppConfig().primaryColor,
        ),
        title: Text(
          duaModel.duaTitle,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            duaModel.duaDetail,
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
