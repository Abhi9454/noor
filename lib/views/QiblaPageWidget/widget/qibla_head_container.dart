import 'package:flutter/material.dart';
import 'package:noor/config.dart';

class QiblaHeadContainer extends StatelessWidget {
  const QiblaHeadContainer(
      {required this.date,
        required this.time,
        required this.timeDetails,
        required this.maghribTime,
        required this.zuhrTime,
        required this.asrTimings,
        required this.sunset,
        required this.sunrise,
        required this.ishaTimings,
        Key? key})
      : super(key: key);

  final String date;
  final String time;
  final String timeDetails;
  final String maghribTime;
  final String zuhrTime;
  final String asrTimings;
  final String sunset;
  final String sunrise;
  final String ishaTimings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Stack(
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(6.0),
            //   child: SizedBox(
            //     height: MediaQuery.of(context).size.height * 0.38,
            //     child: Image(
            //       image: const AssetImage(
            //         'images/head.jpg', //header logo image
            //       ),
            //       fit: BoxFit.cover,
            //       width: MediaQuery.of(context).size.width,
            //       height: MediaQuery.of(context).size.height * 0.38,
            //     ),
            //   ),
            // ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.38,
                decoration: BoxDecoration(
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 30.0),
                  child: Text(
                    date,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              timeDetails,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              time,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Zuhr',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              zuhrTime,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Asr',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              asrTimings,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Sunrise',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              sunrise,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Text(
                              'Maghrib',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              maghribTime,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Isha',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              ishaTimings,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Sunset',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              sunset,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
