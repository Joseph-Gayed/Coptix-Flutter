import '../../shared/utils/constants.dart';

class SearchRequest {
  String keyword;
  int page;

  SearchRequest(
      {required this.keyword, this.page = paginationDefaultFirstPage});
}
