import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noor/config.dart';
import 'package:noor/models/video_model.dart';

class VideoListContainer extends StatelessWidget {
  const VideoListContainer({required this.videoModel, Key? key})
      : super(key: key);

  final VideoModel videoModel;



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Icon(
          FontAwesomeIcons.fileVideo,
          color: AppConfig().primaryColor,
        ),
        title: Text(
          videoModel.videoAbout,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            videoModel.videoLanguage,
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
