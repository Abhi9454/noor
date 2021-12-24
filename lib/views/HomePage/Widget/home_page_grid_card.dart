import 'package:flutter/material.dart';
import 'package:noor/viewModels/calender_view_model.dart';
import 'package:noor/views/CalenderPage/calender_page_widget.dart';
import '../../../config.dart';
import '../../../helpers/enum.dart';
import '../../../helpers/url_launcher.dart';
import '../../../viewModels/home_page_view_model.dart';
import '../../../views/LoginPage/login_page_widget.dart';
import 'package:provider/provider.dart';

class HomePageGridCard extends StatelessWidget {
  HomePageGridCard(
      {required this.homePageModel,
        required this.cardLink,
      required this.imageName,
      required this.cardName,
      required this.colorOne,
      required this.colorSecond,
      Key? key})
      : super(key: key);

  final HomePageViewModel homePageModel;
  final String cardLink;
  final String imageName;
  final String cardName;
  final Color colorOne;
  final Color colorSecond;
  final UrlLauncher _urlLauncher = UrlLauncher();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (cardLink == 'PillarIslam') {
          _urlLauncher
              .launchInWebViewWithJavaScript(AppConfig().pillarsOfIslam);
        }
        else if(cardLink == 'Calender'){
           if(homePageModel.userStatus == HomePageUserStatus.userNotVerified){
             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) =>
                         LoginPageWidget()));
           }
           else{

             Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => MultiProvider(providers: <
                         ChangeNotifierProvider<
                             CalenderViewModel>>[
                       ChangeNotifierProvider<CalenderViewModel>(
                           create: (_) => CalenderViewModel())
                     ], child: const CalenderPageWidget())));
           }
        }

        else if(cardLink == 'Organisations'){
          if(homePageModel.userStatus == HomePageUserStatus.userNotVerified){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LoginPageWidget()));
          }
          else{
            _urlLauncher
                .launchInWebViewWithJavaScript(AppConfig().mahdaviaPageLink);
          }
        }
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
                height: MediaQuery.of(context).size.height * 0.27,
                child: Image(
                  image: AssetImage(
                    imageName, //header logo image
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
                  gradient: LinearGradient(colors: [colorOne, colorSecond]),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  cardName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
