import 'package:coptix/core/network/pagination.dart';
import 'package:coptix/domain/model/domain_category_content.dart';
import 'package:coptix/presentation/model/ui_clip.dart';

import '../../shared/enums/collection_display_type.dart';

class UiCategoryContent {
  List<UiClip> content;
  Pagination pagination;

  UiCategoryContent({
    required this.content,
    required this.pagination,
  });

  factory UiCategoryContent.fromDomain(DomainPaginatedClips domain) {
    var content = domain.content
        .map((domainClip) => UiClip.fromDomain(
            domainClip, displayTypeFromJson(domainClip.displayType ?? "")))
        .toList();

    return UiCategoryContent(
        content: content,
        pagination: domain.pagination ?? Pagination.defaultPagination());
  }

  UiCategoryContent copyWith({
    List<UiClip>? content,
    Pagination? pagination,
  }) {
    return UiCategoryContent(
      content: content ?? this.content,
      pagination: pagination ?? this.pagination,
    );
  }
}
