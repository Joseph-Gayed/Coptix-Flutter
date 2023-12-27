import '../../shared/utils/constants.dart';

class CategoryContentRequest {
  String id;
  int page;

  CategoryContentRequest({required this.id, this.page = paginationFirstPage});
}
