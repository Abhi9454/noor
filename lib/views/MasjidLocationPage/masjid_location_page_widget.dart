import 'package:flutter/material.dart';
import 'package:noor/views/MasjidLocationPage/Widget/masjid_location_list_container.dart';

import '../../config.dart';

class MasjidLocationPageWidget extends StatelessWidget {
  const MasjidLocationPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().masjidLocationPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return const MasjidLocationListContainer(masjidName: 'Masjid E Azam', masjidLocation: 'Palacode, Tamil Nadu',);
            },
          ),
        ),
      ),
    );
  }
}
