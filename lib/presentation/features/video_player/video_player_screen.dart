import 'package:flutter/material.dart';

import '../../../../../shared/widgets/coptix_container.dart';
import '../../../presentation/model/ui_clip.dart';
import '../../../shared/utils/navigation/navigation_args.dart';

class VideoPlayerScreen extends StatefulWidget {
  final Map<String, dynamic> arguments;
  const VideoPlayerScreen({super.key, required this.arguments});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late UiClip uiClip;

  @override
  void initState() {
    super.initState();
    uiClip = widget.arguments[NavArgsKeys.clipArgs];
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
    return const Placeholder();
  }
}
