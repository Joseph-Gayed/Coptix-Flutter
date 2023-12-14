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

Map<String, MediaContentType> mediaContentTypeMap = {
  'clips': MediaContentType.clips,
  'movies': MediaContentType.movies,
  'plays': MediaContentType.plays,
  'series': MediaContentType.series,
  'series_season': MediaContentType.seriesSeason,
  'series_episode': MediaContentType.seriesEpisode,
  'shows': MediaContentType.shows,
  'shows_season': MediaContentType.showsSeason,
  'shows_episode': MediaContentType.showsEpisode,
};

MediaContentType mediaContentTypeFromJson(String jsonValue) {
  return mediaContentTypeMap[jsonValue] ?? MediaContentType.clips;
}

extension MediaContentTypeExt on MediaContentType {
  String mediaContentTypeToJson() {
    String? foundKey;
    mediaContentTypeMap.forEach((key, value) {
      if (value == this) {
        foundKey = key;
      }
    });
    return foundKey ??
        ""; // Returns the found key or an empty string if not found
  }
}
