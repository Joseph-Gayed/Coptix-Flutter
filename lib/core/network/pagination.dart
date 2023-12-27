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
        currentPage: json["current_page"] ?? paginationFirstPage,
        lastPage: json["last_page"] ?? paginationFirstPage,
        total: json["total"] ?? paginationFirstPage,
      );

  factory Pagination.defaultPagination() => Pagination(
        currentPage: paginationFirstPage,
        lastPage: paginationFirstPage,
        total: paginationFirstPage,
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "last_page": lastPage,
        "total": total,
      };
}
