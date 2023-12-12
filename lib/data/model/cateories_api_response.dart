import 'package:coptix/domain/model/domain_category.dart';

import '../../../../../shared/utils/object_print.dart';

class CategoriesApiResponse {
  final List<DomainCategory>? categories;

  CategoriesApiResponse({required this.categories});

  factory CategoriesApiResponse.fromJson(Map<String, dynamic> jsonAsMap) {
    List<DomainCategory> categories = [];
    if (jsonAsMap.containsKey("categories")) {
      List jsonList = jsonAsMap['categories'] as List;
      categories = jsonList.map((categoriesJson) {
        return DomainCategory.fromJson(categoriesJson);
      }).toList();
    }

    return CategoriesApiResponse(categories: categories);
  }

  Map<String, dynamic> toJson() => {"categories": categories};
  @override
  String toString() {
    return objectToPrintableString(this);
  }
}
