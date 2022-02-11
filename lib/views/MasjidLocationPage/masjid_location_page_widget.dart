import 'package:flutter/material.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/viewModels/masjid_location_view_model.dart';
import 'package:noor/views/MasjidLocationPage/Widget/masjid_location_list_container.dart';
import 'package:map_launcher/map_launcher.dart';

import '../../config.dart';
import 'package:provider/provider.dart';

class MasjidLocationPageWidget extends StatelessWidget {
  const MasjidLocationPageWidget({Key? key}) : super(key: key);

  openMaps(String latitude, String longitude, String name,
      String description) async {
    if (await MapLauncher.isMapAvailable(MapType.google) != null) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: Coords(double.parse(latitude), double.parse(longitude)),
        title: name,
        description: description,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<MasjidLocationViewModel>(context, listen: false).fetch();
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
        child: Consumer<MasjidLocationViewModel>(
          builder: (con, masjidModel, _) {
            return masjidModel.status == Status.loading
                ? const SizedBox(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : masjidModel.status == Status.error
                    ? SizedBox(
                        child: Center(
                          child: Text(
                            masjidModel.error.message,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      )
                    : masjidModel.status == Status.success &&
                            masjidModel.masjidDetails.isEmpty
                        ? const SizedBox(
                            child: Center(
                              child: Text(
                                'No Masjid Found.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          )
                        : masjidModel.status == Status.success
                            ? SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: ListView.builder(
                                  itemCount: masjidModel.masjidDetails.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        openMaps(
                                            masjidModel.masjidDetails[index]
                                                .masjidLatitude,
                                            masjidModel.masjidDetails[index]
                                                .masjidLongitude,
                                            masjidModel.masjidDetails[index]
                                                .masjidName,
                                            masjidModel.masjidDetails[index]
                                                .masjidBiography);
                                      },
                                      child: MasjidLocationListContainer(
                                        masjidDetails:
                                            masjidModel.masjidDetails[index],
                                      ),
                                    );
                                  },
                                ),
                              )
                            : const SizedBox();
          },
        ),
      ),
    );
  }
}
