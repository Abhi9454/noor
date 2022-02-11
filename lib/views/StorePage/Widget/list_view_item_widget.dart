import 'package:flutter/material.dart';
import 'package:noor/config.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreListItemWidget extends StatelessWidget {
  const StoreListItemWidget({required this.imageLink, required this.productTitle,required this.productAbout,required this.productItemCode,Key? key}) : super(key: key);

  final String imageLink;
  final String productTitle;
  final String productAbout;
  final String productItemCode;

  openApplication(String productCode) async{
    var whatsapp ='+917027051051';
    var androidUrl = 'whatsapp://send?phone='+whatsapp+'&text='+productCode;
    if (await canLaunch(androidUrl)) {
      await launch(androidUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
               imageLink,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 6.0,left: 8.0, right: 8.0),
                child: Text(
                  productTitle  ,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: AppConfig().primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0,left: 8.0, right: 8.0),
              child: Text(
                productAbout,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                    fontSize: 13),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0,left: 8.0, right: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  openApplication(productItemCode);
                },
                child: const Text('Request to Buy'),
                style: ElevatedButton.styleFrom(
                    primary: AppConfig().primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
