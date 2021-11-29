import 'package:flutter/material.dart';
import 'package:noor/config.dart';

class StoreListItemWidget extends StatelessWidget {
  const StoreListItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Image(
              image: const AssetImage(
                'images/book.jpg', //header logo image
              ),
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 6.0,left: 8.0, right: 8.0),
              child: Text(
                'Izhar -E- Haq Dawat -E- Mahdiat',
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
          const Padding(
            padding: EdgeInsets.only(top: 6.0,left: 8.0, right: 8.0),
            child: Text(
              'Language : Roman English Author : Faaiza Nooreen',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0,left: 8.0, right: 8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Request to Buy'),
              style: ElevatedButton.styleFrom(
                  primary: AppConfig().primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
