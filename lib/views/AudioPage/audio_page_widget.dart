import 'package:flutter/material.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/viewModels/audio_view_model.dart';
import 'package:noor/views/AudioPage/Widget/audio_list_container_widget.dart';
import 'package:just_audio/just_audio.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config.dart';
import 'package:provider/provider.dart';

class AudioPageWidget extends StatelessWidget {
  const AudioPageWidget({Key? key}) : super(key: key);

  Future<void> _launchInWebViewOrVC(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AudioViewModel>(context, listen: false).fetch();
    AudioPlayer player = AudioPlayer();
    return Consumer<AudioViewModel>(
      builder: (con, audioModel, _) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: AppBar(
              title: Text(AppConfig().audioPageHeading),
              centerTitle: true,
              backgroundColor: AppConfig().primaryColor,
              // actions: [
              //   audioModel.isPlaying
              //       ? IconButton(
              //           onPressed: () {
              //             if (audioModel.isPlaying) {
              //               player.pause();
              //               audioModel.updatePlaying(player.playing);
              //             } else {
              //               player.play();
              //               audioModel.updatePlaying(player.playing);
              //             }
              //           },
              //           icon: audioModel.isPlaying
              //               ? const Icon(Icons.pause)
              //               : const Icon(Icons.play_arrow))
              //       : const SizedBox(),
              // ],
            ),
          ),
          body: audioModel.status == Status.loading
              ? const SizedBox(
                  child: Center(child: CircularProgressIndicator()),
                )
              : audioModel.status == Status.error
                  ? SizedBox(
                      child: Center(
                        child: Text(
                          audioModel.error.message,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    )
                  : audioModel.status == Status.success &&
                          audioModel.audioList.isEmpty
                      ? const SizedBox(
                          child: Center(
                            child: Text(
                              'No Audio Found.',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        )
                      : audioModel.status == Status.success
                          ? SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: ListView.builder(
                                itemCount: audioModel.audioList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () async {
                                      // await player.setUrl(audioModel
                                      //     .audioList[index].audioPath);
                                      // player.play();
                                      // audioModel.updatePlaying(player.playing);
                                      _launchInWebViewOrVC(audioModel.audioList[index].audioPath);
                                    },
                                    child: AudioListContainer(
                                      audioModel: audioModel.audioList[index],
                                    ),
                                  );
                                },
                              ),
                            )
                          : const SizedBox(),
        );
      },
    );
  }
}
