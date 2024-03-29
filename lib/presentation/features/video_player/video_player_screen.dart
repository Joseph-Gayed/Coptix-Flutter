import 'package:flutter/material.dart';

import '../../../../../shared/widgets/coptix_container.dart';
import '../../../main.dart';
import '../../../presentation/model/ui_clip.dart';
import '../../../shared/utils/navigation/navigation_args.dart';
import '../../../shared/widgets/coptix_app_bar.dart';

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
    // Force landscape orientation
    configureOrientation(supportLandScape: true);

    return Scaffold(
        appBar: const CoptixAppBar(showingBackButton: true),
        body: CoptixContainer(child: screenContent()));
  }

  Widget screenContent() {
    return const Placeholder();
  }

  @override
  void dispose() {
    // Reset preferred orientations when the screen is disposed
    configureOrientation();
    super.dispose();
  }
}
