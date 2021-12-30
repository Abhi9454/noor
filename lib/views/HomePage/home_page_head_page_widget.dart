import 'package:flutter/material.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/helpers/url_launcher.dart';
import 'package:provider/provider.dart';

import '../../config.dart';
import '../../viewModels/home_page_view_model.dart';
import '../../views/HomePage/Widget/home_page_grid_card.dart';
import '../../views/HomePage/Widget/home_page_head_container.dart';

class HomePageHeadWidget extends StatelessWidget {
  const HomePageHeadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<HomePageViewModel>(context, listen: false).init();
    Provider.of<HomePageViewModel>(context, listen: false).fetchDailyQuizUrl();
    final UrlLauncher _urlLauncher = UrlLauncher();
    Provider.of<HomePageViewModel>(context, listen: false)
        .fetchLocationDetails();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            title: Text(AppConfig().appHeading),
            centerTitle: true,
            backgroundColor: AppConfig().primaryColor,
          ),
        ),
        body: Consumer<HomePageViewModel>(
          builder: (con, homePageModel, _) {
            return homePageModel.status == Status.loading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          HomePageHeadContainer(
                            date: homePageModel.readableDate,
                            time: homePageModel.fajrTimings,
                            timeDetails: 'Fajr',
                            maghribTime: homePageModel.maghribTimings,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                _urlLauncher.launchInWebViewWithJavaScript(
                                    homePageModel.dailyQuiz[0].quizLink);
                              },
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.27,
                                        child: Image(
                                          image: const AssetImage(
                                            'images/quiz.jpg', //header logo image
                                          ),
                                          fit: BoxFit.cover,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.27,
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.27,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Center(
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 50.0),
                                            child: Text(
                                              'Daily Quiz',
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
                                            padding: const EdgeInsets.only(
                                                top: 50.0, left: 10, right: 10),
                                            child: Text(
                                              homePageModel.dailyQuiz.isNotEmpty
                                                  ? homePageModel
                                                      .dailyQuiz[0].quizName
                                                  : '',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ],
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
                              childAspectRatio:
                                  MediaQuery.of(context).size.width /
                                      (MediaQuery.of(context).size.height / 2),
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                HomePageGridCard(
                                    homePageModel: homePageModel,
                                    cardLink: 'Calender',
                                    imageName: 'images/calender.png',
                                    cardName: 'Calender',
                                    colorOne: Colors.black.withOpacity(0.5),
                                    colorSecond: Colors.green.withOpacity(0.5)),
                                HomePageGridCard(
                                    homePageModel: homePageModel,
                                    cardLink: 'Organisations',
                                    imageName: 'images/organisations.jpg',
                                    cardName: 'Mahdavia Organisation',
                                    colorOne: Colors.white.withOpacity(0.5),
                                    colorSecond: Colors.black.withOpacity(0.8)),
                                HomePageGridCard(
                                    homePageModel: homePageModel,
                                    cardLink: '',
                                    imageName: 'images/memorize.jpg',
                                    cardName: 'Memorize',
                                    colorOne: Colors.yellow.withOpacity(0.25),
                                    colorSecond:
                                        Colors.yellow.withOpacity(0.1)),
                                HomePageGridCard(
                                    homePageModel: homePageModel,
                                    cardLink: 'PillarIslam',
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
                  );
          },
        ));
  }
}
