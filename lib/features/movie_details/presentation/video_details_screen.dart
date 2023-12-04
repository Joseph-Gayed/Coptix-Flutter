import 'package:coptix/features/home_landing/home/presentation/model/ui_clip.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/widgets/coptix_container.dart';
import '../../../shared/utils/navigation/navigation_args.dart';

class VideoDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> arguments;
  const VideoDetailsScreen({super.key, required this.arguments});

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends State<VideoDetailsScreen> {
  late UiClip uiClip;

  @override
  void initState() {
    super.initState();
    uiClip = widget.arguments[NavArgsKeys.clipArgs];
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(uiClip.name),
        ),
        body: CoptixContainer(child: screenContent()));
  }

  Widget screenContent() {
    return Center(
        child: Text(
      "Single Video , Last Step before opening the player \n"
      "Video ID: ${uiClip.id} , \n"
      "Video Title: ${uiClip.name} ",
      textAlign: TextAlign.center,
      style: titleTextStyle,
    ));
  }

  void onItemClicked(UiClip uiClip) {}
  void getData() async {}
}
