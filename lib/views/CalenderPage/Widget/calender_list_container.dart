import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../config.dart';

class CalenderListContainer extends StatelessWidget {
  const CalenderListContainer({required this.calenderDate, required this.calenderDetails,Key? key}) : super(key: key);

  final String calenderDate;
  final String calenderDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Icon(
          FontAwesomeIcons.calendar,
          color: AppConfig().primaryColor,
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            calenderDetails,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              calenderDetails,
              maxLines: 5,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
