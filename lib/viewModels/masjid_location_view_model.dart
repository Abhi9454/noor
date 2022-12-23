import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/models/masjid_model.dart';
import 'package:map_launcher/map_launcher.dart' as maps;
import 'package:noor/services/masjid_location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../config.dart';

class MasjidLocationViewModel extends ChangeNotifier {
  final MasjidLocationService _masjidLocationService = MasjidLocationService();
  Status _status = Status.init;
  List<Marker> markers = [];

  openMaps(double latitude, double longitude, String name,
      String description, BuildContext context, String city, String state, String biography,
      String darah, String image) async {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.65,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            name,
                            maxLines: 3,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Location : $city, $state',
                          maxLines: 3,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Colors.black87
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Biography',
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          biography,
                          maxLines: 10,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.black87
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Dairah',
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          darah,
                          maxLines: 10,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.black87
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Images',
                          maxLines:1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                              image.isNotEmpty ? image : 'https://nooremahdavia.com/admin-dashboard/uploads/djknsLoxTb.jpg'
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (await maps.MapLauncher.isMapAvailable(maps.MapType.google) != null) {
                                await maps.MapLauncher.showMarker(
                                mapType: maps.MapType.google,
                                coords: maps.Coords(latitude,longitude),
                                title: name,
                                description: description,
                                );
                              }
                            },
                            child: const Text('Get Directions'),
                            style:
                            ElevatedButton.styleFrom(backgroundColor: AppConfig().primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          );
        });
  }

  Status get status => _status;

  late List<MasjidModel> _masjidDetails;

  List<MasjidModel> get masjidDetails => _masjidDetails;

  Future<void> _setMasjid(List<MasjidModel> masjidDetails, BuildContext context) async {
    _masjidDetails = masjidDetails;
    _status = Status.success;
    _setMarkers(context);
    notifyListeners();
  }

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec =
    await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))?.buffer.asUint8List();
  }

  _setMarkers(BuildContext context) async {
    final Uint8List? markerIcon = await getBytesFromAsset('images/map.png', 80);
    if (masjidDetails.isNotEmpty) {
      for (int i = 0; i < masjidDetails.length; i++) {
        log('Lon '+masjidDetails[i].masjidLatitude + masjidDetails[i].masjidLongitude);
        markers.add(
          Marker(
              markerId: MarkerId(masjidDetails[i].masjidId),
              position: LatLng(double.parse(masjidDetails[i].masjidLatitude),
                  double.parse(masjidDetails[i].masjidLongitude)),
              infoWindow: InfoWindow(title: masjidDetails[i].masjidName),
              icon: BitmapDescriptor.fromBytes(markerIcon!),
              onTap:(){
                 openMaps(double.parse(masjidDetails[i].masjidLatitude), double.parse(masjidDetails[i].masjidLongitude), masjidDetails[i].masjidName, masjidDetails[i].masjidBiography,context,
                     masjidDetails[i].masjidCity,masjidDetails[i].masjidState,masjidDetails[i].masjidDarah, masjidDetails[i].shortBiography, masjidDetails[i].masjidImage);
              }
          ),
        );
      }
    }
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  fetch(BuildContext context) async {
    try {
      _status = Status.loading;
      _setMasjid(await _masjidLocationService.fetchMasjid(),context);
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
