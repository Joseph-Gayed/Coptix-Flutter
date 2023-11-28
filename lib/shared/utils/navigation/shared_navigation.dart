import 'package:flutter/material.dart';

import '../../../features/home_landing/home/presentation/model/ui_clip.dart';
import '../../enums/content_type.dart';
import 'navigation_args.dart';
import 'app_router.dart';

void openDetailsScreen(BuildContext context, UiClip uiClip) {
  Navigator.pushNamed(context,
      detailsRouteOfContentType[uiClip.contentType] ?? AppRouter.notFound,
      arguments: {
        NavArgsKeys.idKey: uiClip.id,
        NavArgsKeys.titleKey: uiClip.name,
      });
}

Map<MediaContentType, String> detailsRouteOfContentType = {
  MediaContentType.clips: AppRouter.clip,
  MediaContentType.movies: AppRouter.movie,
  MediaContentType.seriesEpisode: AppRouter.episode,
  MediaContentType.showsEpisode: AppRouter.episode,
  MediaContentType.shows: AppRouter.show,
  MediaContentType.series: AppRouter.series,
  MediaContentType.seriesSeason: AppRouter.season,
  MediaContentType.showsSeason: AppRouter.season,
};
