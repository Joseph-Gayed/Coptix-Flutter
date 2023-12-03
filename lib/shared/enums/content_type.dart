enum MediaContentType {
  clips,
  movies,
  plays,
  series,
  seriesSeason,
  seriesEpisode,
  shows,
  showsSeason,
  showsEpisode,
}

MediaContentType jsonValueToMediaContentType(String jsonValue) {
  switch (jsonValue) {
    case 'clips':
      return MediaContentType.clips;
    case 'movies':
      return MediaContentType.movies;
    case 'plays':
      return MediaContentType.plays;
    case 'series':
      return MediaContentType.series;
    case 'series_season':
      return MediaContentType.seriesSeason;
    case 'series_episode':
      return MediaContentType.seriesEpisode;
    case 'shows':
      return MediaContentType.shows;
    case 'shows_season':
      return MediaContentType.showsSeason;
    case 'shows_episode':
      return MediaContentType.showsEpisode;

    default:
      return MediaContentType.clips;
  }
}
