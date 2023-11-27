import 'package:coptix/features/home_landing/home/presentation/model/ui_clip.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/coptix_container.dart';
import '../../shared/enums/content_type.dart';
import '../../shared/enums/section_display_type.dart';
import '../../shared/utils/navigation/shared_navigation.dart';

class SeasonDetailsScreen extends StatefulWidget {
  final String seasonId, seasonTitle;
  const SeasonDetailsScreen(
      {super.key, required this.seasonId, required this.seasonTitle});

  @override
  State<SeasonDetailsScreen> createState() => _SeasonDetailsScreenState();
}

class _SeasonDetailsScreenState extends State<SeasonDetailsScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Season:${widget.seasonTitle}"),
        ),
        body: CoptixContainer(child: screenContent()));
  }

  Widget screenContent() {
    return Center(
        child: GestureDetector(
      onTap: () {
        onEpisodeClicked(UiClip(
            "id",
            CollectionDisplayType.normal,
            MediaContentType.showsEpisode,
            "episode 1",
            "description",
            "imagePath"));
      },
      child: Text(
        "Season Details \n"
        "Season ID: ${widget.seasonId} , \n"
        "Season Title: ${widget.seasonTitle} ",
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
