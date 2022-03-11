import 'package:flutter/material.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/helpers/url_launcher.dart';
import 'package:noor/viewModels/audio_view_model.dart';
import 'package:noor/viewModels/dua_view_model.dart';
import 'package:noor/viewModels/library_view_model.dart';
import 'package:noor/viewModels/masjid_location_view_model.dart';
import 'package:noor/viewModels/news_view_model.dart';
import 'package:noor/viewModels/quran_view_model.dart';
import 'package:noor/viewModels/ritual_view_model.dart';
import 'package:noor/viewModels/video_view_model.dart';
import 'package:noor/views/AboutPage/about_page_widget.dart';
import 'package:noor/views/AudioPage/audio_page_widget.dart';
import 'package:noor/views/ContactUsPage/contact_us_page_widget.dart';
import 'package:noor/views/DailyPrayerPage/daily_prayer_page_widget.dart';
import 'package:noor/views/DuaModel/dua_page_widget.dart';
import 'package:noor/views/LibraryPageWidget/library_page_widget.dart';
import 'package:noor/views/LoginPage/login_page_widget.dart';
import 'package:noor/views/MasjidLocationPage/masjid_location_page_widget.dart';
import 'package:noor/views/NewsPage/news_page_widget.dart';
import 'package:noor/views/NibuwatPage/nibuwat_page_widget.dart';
import 'package:noor/views/NiyyatPage/niyyat_page_widget.dart';
import 'package:noor/views/QuranPage/quran_page_widget.dart';
import 'package:noor/views/RegistrationPage/register_page_widget.dart';
import 'package:noor/views/RitualPage/ritual_page_widget.dart';
import 'package:noor/views/SeeratPageWidget/seerat_page_widget.dart';
import 'package:noor/views/VideoPage/video_page_widget.dart';
import 'package:noor/views/VilayyatPage/vilayyat_page_widget.dart';
import 'package:provider/provider.dart';

import '../../config.dart';
import '../../viewModels/home_page_view_model.dart';
import '../../views/HomePage/Widget/home_page_grid_card.dart';
import '../../views/HomePage/Widget/home_page_head_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageHeadWidget extends StatelessWidget {
  const HomePageHeadWidget({Key? key}) : super(key: key);

  openInWebView(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      enableJavaScript: true,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<HomePageViewModel>(context, listen: false).init();
    Provider.of<HomePageViewModel>(context, listen: false).fetchDailyQuizUrl();
    final UrlLauncher _urlLauncher = UrlLauncher();
    Provider.of<HomePageViewModel>(context, listen: false)
        .fetchLocationDetails();
    return Consumer<HomePageViewModel>(
      builder: (con, homePageModel, _) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: AppBar(
              title: Text(AppConfig().appHeading),
              centerTitle: true,
              backgroundColor: AppConfig().primaryColor,
              actions: [
                homePageModel.userStatus == HomePageUserStatus.userNotVerified
                    ? IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPageWidget()));
                        },
                        icon: const Icon(Icons.login),
                      )
                    : const SizedBox(),
                homePageModel.userStatus == HomePageUserStatus.userNotVerified
                    ? IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPageWidget()));
                        },
                        icon: const Icon(Icons.phone_android),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          body: homePageModel.status == Status.loading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        HomePageHeadContainer(
                          date: homePageModel.readableDate,
                          time: homePageModel.fajrTimings,
                          timeDetails: 'Fajr',
                          maghribTime: homePageModel.maghribTimings,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(
                            scrollDirection: Axis.vertical,
                            crossAxisCount: 4,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            padding: const EdgeInsets.all(0.0),
                            shrinkWrap: true,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.5),
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AboutPageWidget()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.user,
                                      size: 30,
                                      color: AppConfig().primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'About Us',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MultiProvider(
                                                  providers: <
                                                      ChangeNotifierProvider<
                                                          NewsViewModel>>[
                                                    ChangeNotifierProvider<
                                                            NewsViewModel>(
                                                        create: (_) =>
                                                            NewsViewModel())
                                                  ],
                                                  child:
                                                      const NewsPageWidget())));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.newspaper,
                                      size: 30,
                                      color: AppConfig().primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'News and Updates',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const NabuwatPageWidget()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.golfBall,
                                      size: 30,
                                      color: AppConfig().primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Faraiz e Nabuwat',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const VilayyatPageWidget()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.fly,
                                      size: 30,
                                      color: AppConfig().primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Faraiz e Vilayat',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const NiyyatPageWidget()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.heart,
                                      size: 30,
                                      color: AppConfig().primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Niyyats',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const SeeratPageWidget()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.handsWash,
                                      size: 30,
                                      color: AppConfig().primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Seerat',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MultiProvider(providers: <
                                                  ChangeNotifierProvider<
                                                      MasjidLocationViewModel>>[
                                                ChangeNotifierProvider<
                                                        MasjidLocationViewModel>(
                                                    create: (_) =>
                                                        MasjidLocationViewModel())
                                              ], child: const MasjidLocationPageWidget())));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.mosque,
                                      size: 30,
                                      color: AppConfig().primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      ' Masjid',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MultiProvider(
                                                  providers: <
                                                      ChangeNotifierProvider<
                                                          AudioViewModel>>[
                                                    ChangeNotifierProvider<
                                                            AudioViewModel>(
                                                        create: (_) =>
                                                            AudioViewModel())
                                                  ],
                                                  child:
                                                      const AudioPageWidget())));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.fileAudio,
                                      size: 30,
                                      color: AppConfig().primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Audio',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MultiProvider(
                                                  providers: <
                                                      ChangeNotifierProvider<
                                                          VideoViewModel>>[
                                                    ChangeNotifierProvider<
                                                            VideoViewModel>(
                                                        create: (_) =>
                                                            VideoViewModel())
                                                  ],
                                                  child:
                                                      const VideoPageWidget())));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.fileVideo,
                                      size: 30,
                                      color: AppConfig().primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Video',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MultiProvider(
                                                  providers: <
                                                      ChangeNotifierProvider<
                                                          DuaViewModel>>[
                                                    ChangeNotifierProvider<
                                                            DuaViewModel>(
                                                        create: (_) =>
                                                            DuaViewModel())
                                                  ],
                                                  child:
                                                      const DuaPageWidget())));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.prayingHands,
                                      size: 30,
                                      color: AppConfig().primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      ' Dua\'s',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MultiProvider(
                                                  providers: <
                                                      ChangeNotifierProvider<
                                                          RitualViewModel>>[
                                                    ChangeNotifierProvider<
                                                            RitualViewModel>(
                                                        create: (_) =>
                                                            RitualViewModel())
                                                  ],
                                                  child:
                                                      const RitualPageWidget())));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.pray,
                                      size: 30,
                                      color: AppConfig().primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Ritual',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MultiProvider(
                                                  providers: <
                                                      ChangeNotifierProvider<
                                                          QuranViewModel>>[
                                                    ChangeNotifierProvider<
                                                            QuranViewModel>(
                                                        create: (_) =>
                                                            QuranViewModel())
                                                  ],
                                                  child:
                                                      const QuranPageWidget())));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.bookReader,
                                      size: 30,
                                      color: AppConfig().primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Quran',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MultiProvider(
                                                  providers: <
                                                      ChangeNotifierProvider<
                                                          LibraryViewModel>>[
                                                    ChangeNotifierProvider<
                                                            LibraryViewModel>(
                                                        create: (_) =>
                                                            LibraryViewModel())
                                                  ],
                                                  child:
                                                      const LibraryPageWidget())));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.bookOpen,
                                      size: 30,
                                      color: AppConfig().primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Library',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ContactUsPageWidget()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.help,
                                      size: 30,
                                      color: AppConfig().primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Contact Us',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DailyPrayerPageWidget()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.clock,
                                      size: 30,
                                      color: AppConfig().primaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Daily Prayer',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                                              0.1,
                                      child: Image(
                                        image: const AssetImage(
                                          'images/quiz.jpg', //header logo image
                                        ),
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
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
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Daily Quiz',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          homePageModel.dailyQuiz.isNotEmpty
                                              ? homePageModel
                                                  .dailyQuiz[0].quizName
                                              : '',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
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
                            crossAxisCount: 3,
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
                                  cardLink: 'Memorize',
                                  imageName: 'images/memorize.jpg',
                                  cardName: 'Memorize',
                                  colorOne: Colors.yellow.withOpacity(0.25),
                                  colorSecond: Colors.yellow.withOpacity(0.1)),
                              HomePageGridCard(
                                  homePageModel: homePageModel,
                                  cardLink: 'PillarIslam',
                                  imageName: 'images/calender.png',
                                  cardName: 'Pillars of Islam',
                                  colorOne: Colors.yellow.withOpacity(0.5),
                                  colorSecond: Colors.pink.withOpacity(0.5)),
                              HomePageGridCard(
                                  homePageModel: homePageModel,
                                  cardLink: 'bestToRead',
                                  imageName: 'images/logo.png',
                                  cardName: 'Best to Read',
                                  colorOne: Colors.lightGreen.withOpacity(0.5),
                                  colorSecond: Colors.pink.withOpacity(0.5)),
                            ],
                          ),
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
