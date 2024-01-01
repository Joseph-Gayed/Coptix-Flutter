import 'package:coptix/core/network/pagination.dart';
import 'package:coptix/domain/model/domain_paginated_clips.dart';
import 'package:coptix/presentation/model/ui_clip.dart';

import '../../shared/enums/collection_display_type.dart';

class UiPaginatedClips {
  List<UiClip> content;
  Pagination pagination;

  UiPaginatedClips({
    required this.content,
    required this.pagination,
  });

  factory UiPaginatedClips.fromDomain(DomainPaginatedClips domain) {
    var content = domain.content
        .map((domainClip) => UiClip.fromDomain(
            domainClip, displayTypeFromJson(domainClip.displayType ?? "")))
        .toList();

    return UiPaginatedClips(
        content: content,
        pagination: domain.pagination ?? Pagination.defaultPagination());
  }

  UiPaginatedClips copyWith({
    List<UiClip>? content,
    Pagination? pagination,
  }) {
    return UiPaginatedClips(
      content: content ?? this.content,
      pagination: pagination ?? this.pagination,
    );
  }
}
