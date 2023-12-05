import 'package:coptix/shared/enums/collection_display_type.dart';
import 'package:coptix/shared/enums/content_type.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/coptix_container.dart';
import '../../../presentation/model/ui_clip.dart';
import '../../../shared/utils/navigation/navigation_args.dart';
import '../../../shared/utils/navigation/shared_navigation.dart';

class SeriesDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> arguments;

  const SeriesDetailsScreen({super.key, required this.arguments});

  @override
  State<SeriesDetailsScreen> createState() => _SeriesDetailsScreenState();
}

class _SeriesDetailsScreenState extends State<SeriesDetailsScreen> {
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
          title: Text("Series:${uiClip.name}"),
        ),
        body: CoptixContainer(child: screenContent()));
  }

  Widget screenContent() {
    return Center(
        child: GestureDetector(
      onTap: () {
        onSeasonItemClicked(UiClip(
            id: "id",
            displayType: CollectionDisplayType.normal,
            contentType: MediaContentType.showsSeason,
            name: "Season 1",
            description: "description",
            clipImages: []));
      },
      child: Text(
        "Series Details \n"
        "Series ID: ${uiClip.id} , \n"
        "Series Title: ${uiClip.name} ",
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
