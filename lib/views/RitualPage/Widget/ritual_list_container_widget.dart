import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noor/config.dart';
import 'package:noor/models/rituals_model.dart';

class RitualListContainer extends StatelessWidget {
  const RitualListContainer({required this.ritualModel, Key? key})
      : super(key: key);

  final RitualModel ritualModel;



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
          ritualModel.ritualTitle,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            ritualModel.ritualDetail,
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
