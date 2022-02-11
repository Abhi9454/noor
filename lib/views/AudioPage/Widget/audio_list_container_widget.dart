import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noor/config.dart';
import 'package:noor/models/audio_model.dart';

class AudioListContainer extends StatelessWidget {
  const AudioListContainer({required this.audioModel, Key? key})
      : super(key: key);

  final AudioModel audioModel;



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Icon(
          FontAwesomeIcons.solidFileAudio,
          color: AppConfig().primaryColor,
        ),
        title: Text(
          audioModel.audioAbout,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            audioModel.audioLanguage,
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.normal,
                fontSize: 15),
          ),
        ),
      ),
    );
  }
}
