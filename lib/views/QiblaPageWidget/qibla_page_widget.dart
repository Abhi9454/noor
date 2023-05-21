import 'dart:math';

import 'package:flutter/material.dart';
import 'package:noor/viewModels/qibla_view_model.dart';
import 'package:noor/views/QiblaPageWidget/widget/qibla_compass.dart';
import 'package:noor/views/QiblaPageWidget/widget/qibla_head_container.dart';
import 'package:provider/provider.dart';

import '../../config.dart';
import '../../helpers/enum.dart';
import '../../helpers/url_launcher.dart';
import 'dart:math' as math;
import '../HomePage/Widget/home_page_head_container.dart';
import 'package:smooth_compass/utils/smooth_compass.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vector_math/vector_math.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';


class QiblaPageWidget extends StatefulWidget {
  const QiblaPageWidget({Key? key}) : super(key: key);

  @override
  State<QiblaPageWidget> createState() => _QiblaPageWidgetState();
}

class _QiblaPageWidgetState extends State<QiblaPageWidget> {
  bool _hasPermissions = false;
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchPermissionStatus();
    Provider.of<QiblaViewModel>(context, listen: false).init();
    final UrlLauncher _urlLauncher = UrlLauncher();
    Provider.of<QiblaViewModel>(context, listen: false)
        .fetchLocationDetails(context);
  }

  double getOffsetFromNorth(double currentLatitude, double currentLongitude,
      double targetLatitude, double targetLongitude) {
    var la_rad = radians(currentLatitude);
    var lo_rad = radians(currentLongitude);

    var de_la = radians(targetLatitude);
    var de_lo = radians(targetLongitude);

    var toDegrees = degrees(atan(sin(de_lo - lo_rad) /
        ((cos(la_rad) * tan(de_la)) - (sin(la_rad) * cos(de_lo - lo_rad)))));
    if (la_rad > de_la) {
      if ((lo_rad > de_lo || lo_rad < radians(-180.0) + de_lo) &&
          toDegrees > 0.0 &&
          toDegrees <= 90.0) {
        toDegrees += 180.0;
      } else if (lo_rad <= de_lo &&
          lo_rad >= radians(-180.0) + de_lo &&
          toDegrees > -90.0 &&
          toDegrees < 0.0) {
        toDegrees += 180.0;
      }
    }
    if (la_rad < de_la) {
      if ((lo_rad > de_lo || lo_rad < radians(-180.0) + de_lo) &&
          toDegrees > 0.0 &&
          toDegrees < 90.0) {
        toDegrees += 180.0;
      }
      if (lo_rad <= de_lo &&
          lo_rad >= radians(-180.0) + de_lo &&
          toDegrees > -90.0 &&
          toDegrees <= 0.0) {
        toDegrees += 180.0;
      }
    }
    return toDegrees;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QiblaViewModel>(
      builder: (con, qibla, _) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: AppBar(
              title: Text(AppConfig().qiblaHeading),
              centerTitle: true,
              backgroundColor: AppConfig().primaryColor,
            ),
          ),
          body: qibla.status == Status.loading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        QiblaHeadContainer(
                          date: qibla.readableDate,
                          time: qibla.fajrTimings,
                          timeDetails: 'Fajr',
                          maghribTime: qibla.maghribTimings,
                          zuhrTime: qibla.zuhrTimings,
                          asrTimings: qibla.ashTimings,
                          sunrise: qibla.sunriseTimings,
                          sunset: qibla.sunsetTimings,
                          ishaTimings: qibla.ishaTimings,
                        ),
                        _hasPermissions
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  FutureBuilder(
                                    future: _deviceSupport,
                                    builder: (_, AsyncSnapshot<bool?> snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                      }
                                      if (snapshot.hasError) {
                                        return Center(
                                          child: Text("Error: ${snapshot.error.toString()}"),
                                        );
                                      }
                                      else{
                                        return SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          height: MediaQuery.of(context).size.height * 0.35,
                                            child: const QiblahCompass());
                                      }
                                    },
                                  )
                                ],
                              )
                            : _buildPermissionSheet()
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget _buildCompass(double currentLat, double currentLon) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Transform.rotate(
        angle: getOffsetFromNorth(currentLat, currentLon, 24.470901, 39.612236),
        child: Image.asset('images/compass.png'),
      ),
    );
  }

  Widget _buildPermissionSheet() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Location Permission Required'),
          ElevatedButton(
            child: const Text('Request Permissions'),
            onPressed: () {
              Permission.locationWhenInUse.request().then((ignored) {
                _fetchPermissionStatus();
              });
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            child: const Text('Open App Settings'),
            onPressed: () {
              openAppSettings().then((opened) {
                //
              });
            },
          )
        ],
      ),
    );
  }

  void _fetchPermissionStatus() {
    Permission.locationWhenInUse.status.then((status) {
      if (mounted) {
        setState(() => _hasPermissions = status == PermissionStatus.granted);
      }
    });
  }
}
