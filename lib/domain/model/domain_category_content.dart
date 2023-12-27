import 'package:coptix/core/network/pagination.dart';

import 'domain_clip.dart';

class DomainCategoryContent {
  List<DomainClip> content;
  Pagination? pagination;

  DomainCategoryContent({
    required this.content,
    this.pagination,
  });
}
