import 'package:flutter/material.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/viewModels/audio_view_model.dart';
import 'package:noor/views/AudioPage/Widget/audio_list_container_widget.dart';
import 'package:just_audio/just_audio.dart';

import '../../config.dart';
import 'package:provider/provider.dart';

class AudioPageWidget extends StatelessWidget {
  const AudioPageWidget({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    Provider.of<AudioViewModel>(context, listen: false).fetch();
    AudioPlayer player = AudioPlayer();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().audioPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SizedBox(
        child: Consumer<AudioViewModel>(
          builder: (con, audioModel, _) {
            return audioModel.status == Status.loading
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
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () async {
                                        await player.setUrl( audioModel.audioList[index].audioPath);
                                        player.play();
                                      },
                                      child: AudioListContainer(
                                        audioModel:
                                            audioModel.audioList[index],
                                      ),
                                    );
                                  },
                                ),
                              )
                            : const SizedBox();
          },
        ),
      ),
    );
  }
}
