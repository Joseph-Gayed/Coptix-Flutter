import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/presentation/features/series_details/widgets/seasons_view.dart';
import 'package:flutter/material.dart';

import '../../presentation/model/ui_clip.dart';
import '../../presentation/model/ui_season.dart';
import '../utils/localization/app_localizations_delegate.dart';
import '../utils/localization/localized_content.dart';
import 'clips_grid.dart';

class DetailsTabItem {
  String tabName;
  List<UiClip>? uiClips;
  UiClip? seasonedClip;
  Function(UiSeason)? onSeasonSelected;

  DetailsTabItem(
      {required this.tabName,
      this.uiClips,
      this.seasonedClip,
      this.onSeasonSelected});
}

class DetailsTabsView extends StatelessWidget {
  final List<DetailsTabItem> detailsTabs;

  const DetailsTabsView({
    super.key,
    required this.detailsTabs,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: detailsTabs.length,
      child: Column(
        children: [
          TabBar(
              isScrollable: true, // Allow tabs to be scrollable
              tabAlignment: TabAlignment.start,
              labelColor: secondaryColor, // Color for the selected tab label
              unselectedLabelColor:
                  lightColor, // Color for the selected tab label
              labelStyle: body1TextStyle.copyWith(
                  fontWeight:
                      FontWeight.bold), // Style for the selected tab label
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                    width: Dimens.tabBarIndicatorHeight, color: secondaryColor),
                insets: EdgeInsets.only(
                    bottom:
                        Dimens.halfScreenMargin), // Adjust vertical space here
              ),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: secondaryColor,
              tabs: detailsTabs
                  .map((clipsTabItem) => Tab(text: clipsTabItem.tabName))
                  .toList()),
          Expanded(
            child: TabBarView(
                children: detailsTabs.map((clipTabItem) {
              if (clipTabItem.seasonedClip != null &&
                  clipTabItem.seasonedClip!.seasons.isNotEmpty &&
                  clipTabItem.onSeasonSelected != null) {
                return SeasonsView(
                    seasonedClip: clipTabItem.seasonedClip!,
                    onSeasonSelected: clipTabItem.onSeasonSelected!);
              } else if (clipTabItem.uiClips != null) {
                return Padding(
                  padding: const EdgeInsets.only(top: Dimens.screenMargin),
                  child: ClipsGrid(clips: clipTabItem.uiClips!),
                );
              } else {
                return Center(
                    child: Text(
                  AppLocalizations.of(context)
                      .translate(LocalizationKey.emptyContentMessage),
                  style: titleTextStyle,
                ));
              }
            }).toList()),
          ),
        ],
      ),
    );
  }
}
