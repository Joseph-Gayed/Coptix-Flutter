import 'package:coptix/features/home_landing/home/presentation/model/ui_clip.dart';
import 'package:coptix/shared/enums/content_type.dart';
import 'package:coptix/shared/enums/section_display_type.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/coptix_container.dart';
import '../../shared/utils/navigation/shared_navigation.dart';

class SeriesDetailsScreen extends StatefulWidget {
  final String seriesId, seriesTitle;
  const SeriesDetailsScreen(
      {super.key, required this.seriesId, required this.seriesTitle});

  @override
  State<SeriesDetailsScreen> createState() => _SeriesDetailsScreenState();
}

class _SeriesDetailsScreenState extends State<SeriesDetailsScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Series:${widget.seriesTitle}"),
        ),
        body: CoptixContainer(child: screenContent()));
  }

  Widget screenContent() {
    return Center(
        child: GestureDetector(
      onTap: () {
        onSeasonItemClicked(UiClip(
            "id",
            CollectionDisplayType.normal,
            MediaContentType.showsSeason,
            "Season 1",
            "description",
            "imagePath"));
      },
      child: Text(
        "Series Details \n"
        "Series ID: ${widget.seriesId} , \n"
        "Series Title: ${widget.seriesTitle} ",
        style: titleTextStyle,
        textAlign: TextAlign.center,
      ),
    ));
  }

  void onSeasonItemClicked(UiClip uiClip) {
    openDetailsScreen(context, uiClip);
  }

  void getData() async {}
}
