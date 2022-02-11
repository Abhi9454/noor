import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noor/config.dart';
import 'package:noor/models/masjid_model.dart';

class MasjidLocationListContainer extends StatelessWidget {
  const MasjidLocationListContainer({required this.masjidDetails, Key? key})
      : super(key: key);

  final MasjidModel masjidDetails;



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Icon(
          FontAwesomeIcons.mosque,
          color: AppConfig().primaryColor,
        ),
        title: Text(
          masjidDetails.masjidName,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            masjidDetails.masjidCity + ',' + masjidDetails.masjidState,
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.normal,
                fontSize: 15),
          ),
        ),
        trailing: Icon(
          FontAwesomeIcons.map,
          color: AppConfig().primaryColor,
        ),
      ),
    );
  }
}
