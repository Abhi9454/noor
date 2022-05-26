import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/models/masjid_model.dart';
import 'package:map_launcher/map_launcher.dart' as maps;
import 'package:noor/services/masjid_location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MasjidLocationViewModel extends ChangeNotifier {
  final MasjidLocationService _masjidLocationService = MasjidLocationService();
  Status _status = Status.init;
  List<Marker> markers = [];

  openMaps(double latitude, double longitude, String name,
      String description) async {
    if (await maps.MapLauncher.isMapAvailable(maps.MapType.google) != null) {
      await maps.MapLauncher.showMarker(
        mapType: maps.MapType.google,
        coords: maps.Coords(latitude,longitude),
        title: name,
        description: description,
      );
    }
  }

  Status get status => _status;

  late List<MasjidModel> _masjidDetails;

  List<MasjidModel> get masjidDetails => _masjidDetails;

  Future<void> _setMasjid(List<MasjidModel> masjidDetails) async {
    _masjidDetails = masjidDetails;
    _status = Status.success;
    _setMarkers();
    notifyListeners();
  }

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec =
    await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))?.buffer.asUint8List();
  }

  _setMarkers() async {
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
                 openMaps(double.parse(masjidDetails[i].masjidLatitude), double.parse(masjidDetails[i].masjidLongitude), masjidDetails[i].masjidName, masjidDetails[i].masjidBiography);
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

  fetch() async {
    try {
      _status = Status.loading;
      _setMasjid(await _masjidLocationService.fetchMasjid());
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
