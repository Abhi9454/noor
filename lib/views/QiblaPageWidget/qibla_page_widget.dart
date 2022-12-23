import 'package:flutter/material.dart';
import 'package:noor/viewModels/qibla_view_model.dart';
import 'package:noor/views/QiblaPageWidget/widget/qibla_head_container.dart';
import 'package:provider/provider.dart';

import '../../config.dart';
import '../../helpers/enum.dart';
import '../../helpers/url_launcher.dart';
import '../HomePage/Widget/home_page_head_container.dart';
import 'package:smooth_compass/utils/smooth_compass.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';

class QiblaPageWidget extends StatefulWidget {
  const QiblaPageWidget({Key? key}) : super(key: key);

  @override
  State<QiblaPageWidget> createState() => _QiblaPageWidgetState();
}

class _QiblaPageWidgetState extends State<QiblaPageWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<QiblaViewModel>(context, listen: false).init();
    final UrlLauncher _urlLauncher = UrlLauncher();
    Provider.of<QiblaViewModel>(context, listen: false)
        .fetchLocationDetails(context);
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
                        SmoothCompass(
                          //higher the value of rotation speed slower the rotation
                          rotationSpeed: 500,
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.8,
                          compassAsset: Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('images/compass.png'),
                                    fit: BoxFit.cover)),
                          ),
                          compassBuilder: (context,
                              AsyncSnapshot<CompassModel>? compassData,
                              Widget compassAsset) {
                            return compassAsset;
                          },
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
