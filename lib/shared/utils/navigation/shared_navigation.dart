import 'package:flutter/material.dart';

import '../../../presentation/model/ui_clip.dart';
import '../../enums/content_type.dart';
import 'app_router.dart';
import 'navigation_args.dart';

void openDetailsScreen(BuildContext context, UiClip uiClip) {
  var routeName =
      detailsRouteOfContentType[uiClip.contentType] ?? AppRouter.notFound;
  print(routeName);
  Navigator.pushNamed(context, routeName, arguments: {
    NavArgsKeys.clipArgs: uiClip,
  });
}

void openVideoPlayerScreen(BuildContext context, UiClip uiClip) {
  Navigator.pushNamed(context, AppRouter.videoPlayer, arguments: {
    NavArgsKeys.clipArgs: uiClip,
  });
}

Map<MediaContentType, String> detailsRouteOfContentType = {
  MediaContentType.clips: AppRouter.clip,
  MediaContentType.movies: AppRouter.movie,
  MediaContentType.plays: AppRouter.play,
  MediaContentType.seriesEpisode: AppRouter.episode,
  MediaContentType.showsEpisode: AppRouter.episode,
  MediaContentType.shows: AppRouter.show,
  MediaContentType.series: AppRouter.series,
  MediaContentType.seriesSeason: AppRouter.season,
  MediaContentType.showsSeason: AppRouter.season,
};
