import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/viewModels/masjid_location_view_model.dart';
import 'package:noor/views/MasjidLocationPage/Widget/masjid_location_list_container.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_map;

import '../../config.dart';
import 'package:provider/provider.dart';

class MasjidLocationPageWidget extends StatefulWidget {
  const MasjidLocationPageWidget({Key? key}) : super(key: key);

  @override
  _MasjidLocationPageWidgetState createState() =>
      _MasjidLocationPageWidgetState();
}

class _MasjidLocationPageWidgetState extends State<MasjidLocationPageWidget> {
  final Completer<google_map.GoogleMapController> _completer = Completer();

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

  loadMaps() {
    Provider.of<MasjidLocationViewModel>(context, listen: false).fetch();
  }


  @override
  void initState() {
    super.initState();
    loadMaps();
  }

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
                            ? google_map.GoogleMap(
                                mapType: google_map.MapType.normal,
                                myLocationButtonEnabled: true,
                                myLocationEnabled: true,
                                onTap: (values) {
                                  log(values.latitude.toString());
                                },
                                initialCameraPosition:
                                    const google_map.CameraPosition(
                                        target:
                                            google_map.LatLng(40.333, -70.66),
                                        zoom: 12),
                                onMapCreated: (google_map.GoogleMapController
                                    controller) {
                                  _completer.complete(controller);
                                },
                                markers: masjidModel.markers
                                    .map((locations) => locations)
                                    .toSet(),
                              )
                            : const SizedBox();
          },
        ),
      ),
    );
  }
}
