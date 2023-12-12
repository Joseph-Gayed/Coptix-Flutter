import 'package:coptix/domain/model/domain_category.dart';

import 'domain_collection.dart';

class DomainHome {
  final List<DomainCategory> categories;
  final List<DomainCollection> collections;

  const DomainHome({
    this.categories = const [],
    this.collections = const [],
  });
}
