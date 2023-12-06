import 'package:coptix/shared/enums/content_type.dart';

class DetailsRequestParams {
  final String contentId;
  final String contentType;
  const DetailsRequestParams(this.contentId, this.contentType);
}

extension DetailsRequestParamsValidation on DetailsRequestParams {
  bool isValidRequest() {
    return contentId.isNotEmpty &&
        allowedContentTypesForDetailsApi.contains(contentType);
  }
}

List<String> allowedContentTypesForDetailsApi = [
  MediaContentType.plays.valueAsString(),
  MediaContentType.clips.valueAsString(),
  MediaContentType.movies.valueAsString(),
  MediaContentType.shows.valueAsString(),
  MediaContentType.series.valueAsString(),
];
