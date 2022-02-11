import 'package:flutter/material.dart';
import 'package:noor/models/mahdavia_model.dart';

class MahdaviaListContainer extends StatelessWidget {
  const MahdaviaListContainer({required this.mahdaviaModel, Key? key})
      : super(key: key);

  final MahdaviaModel mahdaviaModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(
          mahdaviaModel.mahdaviaTitle,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 17),
        ),
        subtitle: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0,bottom: 5.0),
              child: Text(
                mahdaviaModel.mahdaviaDetails,
                maxLines: 3,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                mahdaviaModel.mahdaviaActivities,
                textAlign: TextAlign.justify,
                maxLines: 15,
                style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                    fontSize: 13),
              ),
            ),
          ],
        )
      ),
    );
  }
}
