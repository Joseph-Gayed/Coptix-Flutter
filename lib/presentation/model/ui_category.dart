import 'package:coptix/domain/model/domain_category.dart';

class UiCategory {
  String id;
  String name;
  UiCategory? parent;
  List<UiCategory>? children;

  UiCategory({
    required this.id,
    required this.name,
    this.parent,
    this.children,
  });

  factory UiCategory.fromDomain(DomainCategory domain) => UiCategory(
      id: domain.id?.toString() ?? "",
      name: domain.name ?? "",
      parent:
          domain.parent != null ? UiCategory.fromDomain(domain.parent!) : null,
      children: domain.children != null
          ? domain.children!
              .map((domainChild) => UiCategory.fromDomain(domainChild))
              .toList()
          : []);
}
