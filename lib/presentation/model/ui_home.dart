import 'package:coptix/presentation/model/ui_category.dart';
import 'package:coptix/presentation/model/ui_collection.dart';

import '../../domain/model/domain_home.dart';

class UiHome {
  final List<UiCategory> categories;
  final List<UiCollection> collections;

  const UiHome({
    this.categories = const [],
    this.collections = const [],
  });

  factory UiHome.fromDomain(DomainHome domain) {
    return UiHome(
        categories: domain.categories
            .map((domainCategory) => UiCategory.fromDomain(domainCategory))
            .toList(),
        collections: domain.collections
            .map(
                (domainCollection) => UiCollection.fromDomain(domainCollection))
            .toList());
  }
}
