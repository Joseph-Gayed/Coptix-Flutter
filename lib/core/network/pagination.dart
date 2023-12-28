import 'package:coptix/shared/utils/object_print.dart';

import '../../shared/utils/constants.dart';

class Pagination {
  int currentPage;
  int lastPage;
  int total;

  Pagination({
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["current_page"] ?? paginationDefaultFirstPage,
        lastPage: json["last_page"] ?? paginationDefaultFirstPage,
        total: json["total"] ?? paginationDefaultFirstPage,
      );

  factory Pagination.defaultPagination() => Pagination(
        currentPage: paginationDefaultFirstPage,
        lastPage: paginationDefaultFirstPage,
        total: paginationDefaultFirstPage,
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "last_page": lastPage,
        "total": total,
      };

  @override
  String toString() {
    return objectToPrintableString(this);
  }
}
