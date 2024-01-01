import 'package:coptix/core/network/pagination.dart';

import 'domain_clip.dart';

class DomainPaginatedClips {
  List<DomainClip> content;
  Pagination? pagination;

  DomainPaginatedClips({
    required this.content,
    this.pagination,
  });
}
