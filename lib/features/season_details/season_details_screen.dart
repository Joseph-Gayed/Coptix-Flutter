import 'package:coptix/features/home_landing/home/presentation/model/ui_clip.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/coptix_container.dart';
import '../../shared/enums/content_type.dart';
import '../../shared/enums/collection_display_type.dart';
import '../../shared/utils/navigation/navigation_args.dart';
import '../../shared/utils/navigation/shared_navigation.dart';

class SeasonDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> arguments;
  const SeasonDetailsScreen({super.key, required this.arguments});

  @override
  State<SeasonDetailsScreen> createState() => _SeasonDetailsScreenState();
}

class _SeasonDetailsScreenState extends State<SeasonDetailsScreen> {
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
          title: Text("Season:${uiClip.name}"),
        ),
        body: CoptixContainer(child: screenContent()));
  }

  Widget screenContent() {
    return Center(
        child: GestureDetector(
      onTap: () {
        onEpisodeClicked(UiClip(
            id: "id",
            displayType: CollectionDisplayType.normal,
            contentType: MediaContentType.showsEpisode,
            name: "episode 1",
            description: "description",
            clipImages: []));
      },
      child: Text(
        "Season Details \n"
        "Season ID: ${uiClip.id} , \n"
        "Season Title: ${uiClip.name} ",
        style: titleTextStyle,
        textAlign: TextAlign.center,
      ),
    ));
  }

  void onItemClicked(UiClip uiClip) {}
  void getData() async {}

  void onEpisodeClicked(UiClip uiClip) {
    openDetailsScreen(context, uiClip);
  }
}
