import 'package:flutter/material.dart';

import '../../../features/home_landing/home/presentation/model/ui_clip.dart';
import '../../enums/content_type.dart';
import 'navigation_args.dart';
import 'navigation_routes.dart';

void openDetailsScreen(BuildContext context, UiClip uiClip) {
  Navigator.pushNamed(context,
      detailsRouteOfContentType[uiClip.contentType] ?? AppRoutes.notFound,
      arguments: {
        NavArgsKeys.idKey: uiClip.id,
        NavArgsKeys.titleKey: uiClip.name,
      });
}

Map<MediaContentType, String> detailsRouteOfContentType = {
  MediaContentType.clips: AppRoutes.clip,
  MediaContentType.movies: AppRoutes.movie,
  MediaContentType.seriesEpisode: AppRoutes.episode,
  MediaContentType.showsEpisode: AppRoutes.episode,
  MediaContentType.shows: AppRoutes.show,
  MediaContentType.series: AppRoutes.series,
  MediaContentType.seriesSeason: AppRoutes.season,
  MediaContentType.showsSeason: AppRoutes.season,
};
