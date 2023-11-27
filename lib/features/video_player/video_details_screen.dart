import 'package:coptix/features/home_landing/home/presentation/model/ui_clip.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/coptix_container.dart';

class VideoDetailsScreen extends StatefulWidget {
  final String videoId, videoTitle;
  const VideoDetailsScreen(
      {super.key, required this.videoId, required this.videoTitle});

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends State<VideoDetailsScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Clip:${widget.videoTitle}"),
        ),
        body: CoptixContainer(child: screenContent()));
  }

  Widget screenContent() {
    return Center(
        child: Text(
      "Single Video , Last Step before opening the player \n"
      "Video ID: ${widget.videoId} , \n"
      "Video Title: ${widget.videoTitle} ",
      textAlign: TextAlign.center,
      style: titleTextStyle,
    ));
  }

  void onItemClicked(UiClip uiClip) {}
  void getData() async {}
}
