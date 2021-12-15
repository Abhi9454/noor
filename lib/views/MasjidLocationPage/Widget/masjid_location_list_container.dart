import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noor/config.dart';

class MasjidLocationListContainer extends StatelessWidget {
  const MasjidLocationListContainer(
      {required this.masjidName, required this.masjidLocation, Key? key})
      : super(key: key);

  final String masjidName;
  final String masjidLocation;

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
          masjidName,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            masjidLocation,
            style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.normal, fontSize: 18),
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
