import 'package:flutter/material.dart';
import 'package:noor/config.dart';

class HomePageHeadContainer extends StatelessWidget {
  const HomePageHeadContainer(
      {required this.date,
      required this.time,
      required this.timeDetails,
        required this.maghribTime,
      Key? key})
      : super(key: key);

  final String date;
  final String time;
  final String timeDetails;
  final String maghribTime;

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
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
                child: Image(
                  image: const AssetImage(
                    'images/head.jpg', //header logo image
                  ),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.27,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.27,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.black.withOpacity(0.15),
                        AppConfig().primaryColor
                      ]),
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
                        color: Colors.white,
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
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Text(
                              timeDetails,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20),
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
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
                            padding: EdgeInsets.only(top: 50.0),
                            child: Text(
                              'Maghrib',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20),
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
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
