import 'package:flutter/material.dart';


class HomePageGridCard extends StatelessWidget {
  const HomePageGridCard({required this.imageName,required this.cardName,required this.colorOne, required this.colorSecond,Key? key}) : super(key: key);

  final String imageName;
  final String cardName;
  final Color colorOne;
  final Color colorSecond;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                gradient: LinearGradient(colors: [
                  colorOne,
                  colorSecond
                ]),
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
    );
  }
}
