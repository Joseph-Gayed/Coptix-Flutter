import 'package:coptix/core/network/api_names.dart';
import 'package:coptix/shared/enums/content_type.dart';

class DetailsRequestParams {
  final String contentId;
  final String contentType;
  const DetailsRequestParams(this.contentId, this.contentType);
}

extension DetailsRequestParamsExt on DetailsRequestParams {
  bool isValidRequest() {
    print(contentType);
    return contentId.isNotEmpty &&
        (allowedContentTypesForClipDetailsApi.contains(contentType) ||
            allowedContentTypesForSeriesDetailsApi.contains(contentType));
  }

  String getApiName() {
    if (allowedContentTypesForClipDetailsApi.contains(contentType)) {
      return ApiNames.clipDetails;
    } else if (allowedContentTypesForSeriesDetailsApi.contains(contentType)) {
      return ApiNames.seriesDetails;
    } else {
      return "";
    }
  }
}

List<String> allowedContentTypesForClipDetailsApi = [
  MediaContentType.plays.mediaContentTypeToJson(),
  MediaContentType.clips.mediaContentTypeToJson(),
  MediaContentType.movies.mediaContentTypeToJson(),
];

List<String> allowedContentTypesForSeriesDetailsApi = [
  MediaContentType.shows.mediaContentTypeToJson(),
  MediaContentType.series.mediaContentTypeToJson(),
];
