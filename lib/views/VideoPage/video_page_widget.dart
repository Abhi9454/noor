import 'package:flutter/material.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/viewModels/video_view_model.dart';
import 'package:noor/views/VideoPage/Widget/video_list_container_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config.dart';
import 'package:provider/provider.dart';

class VideoPageWidget extends StatelessWidget {
  const VideoPageWidget({Key? key}) : super(key: key);

  Future<void> _launchInWebViewOrVC(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
    )) {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    Provider.of<VideoViewModel>(context, listen: false).fetch();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: Text(AppConfig().videoPageHeading),
          centerTitle: true,
          backgroundColor: AppConfig().primaryColor,
        ),
      ),
      body: SizedBox(
        child: Consumer<VideoViewModel>(
          builder: (con, videoModel, _) {
            return videoModel.status == Status.loading
                ? const SizedBox(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : videoModel.status == Status.error
                    ? SizedBox(
                        child: Center(
                          child: Text(
                            videoModel.error.message,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      )
                    : videoModel.status == Status.success &&
                            videoModel.videoList.isEmpty
                        ? const SizedBox(
                            child: Center(
                              child: Text(
                                'No Video Found.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          )
                        : videoModel.status == Status.success
                            ? SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: ListView.builder(
                                  itemCount: videoModel.videoList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: ()  {
                                        _launchInWebViewOrVC(videoModel.videoList[index].videoPath);
                                      },
                                      child: VideoListContainer(
                                        videoModel: videoModel.videoList[index],
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
