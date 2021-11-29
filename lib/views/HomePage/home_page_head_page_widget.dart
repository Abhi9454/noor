import 'package:flutter/material.dart';
import '../../views/HomePage/Widget/home_page_grid_card.dart';
import '../../views/HomePage/Widget/home_page_head_container.dart';
import '../../config.dart';

class HomePageHeadWidget extends StatelessWidget {
  const HomePageHeadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().appHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const HomePageHeadContainer(
                  date: 'Wednesday, 24 November',
                  time: '10:41 PM',
                  timeDetails: 'Fajr',
                  dateDetails: '15 Muharram 1443 AH'),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.48,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0)),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.27,
                            child: Image(
                              image: const AssetImage(
                                'images/qibla.jpg', //header logo image
                              ),
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.27,
                            ),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 6.0, top: 10.0, right: 6.0),
                          child: Text(
                            'Get Qibla Direction for your Location',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text(
                            'Get Qibla Direction from your location at your fingertips. 1532 people going',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Get Direction'),
                            style: ElevatedButton.styleFrom(
                                primary: AppConfig().primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  padding: const EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 2),
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    HomePageGridCard(
                        imageName: 'images/calender.png',
                        cardName: 'Calender',
                        colorOne: Colors.black.withOpacity(0.5),
                        colorSecond: Colors.green.withOpacity(0.5)),
                    HomePageGridCard(
                        imageName: 'images/organisations.jpg',
                        cardName: 'Mahdavia Organisation',
                        colorOne: Colors.white.withOpacity(0.5),
                        colorSecond: Colors.black.withOpacity(0.8)),
                    HomePageGridCard(
                        imageName: 'images/memorize.jpg',
                        cardName: 'Memorize',
                        colorOne: Colors.yellow.withOpacity(0.25),
                        colorSecond: Colors.yellow.withOpacity(0.1)),
                    HomePageGridCard(
                        imageName: 'images/calender.png',
                        cardName: 'Pillars of Islam',
                        colorOne: Colors.yellow.withOpacity(0.5),
                        colorSecond: Colors.pink.withOpacity(0.5)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
