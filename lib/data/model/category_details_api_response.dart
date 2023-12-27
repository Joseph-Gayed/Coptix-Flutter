import '../../../../../shared/utils/object_print.dart';
import '../../domain/model/domain_collection.dart';

class CategoryDetailsApiResponse {
  final List<DomainCollection>? children;

  CategoryDetailsApiResponse({required this.children});

  factory CategoryDetailsApiResponse.fromJson(Map<String, dynamic> jsonAsMap) {
    List<DomainCollection> collections = [];

    if (jsonAsMap.containsKey("children")) {
      List jsonList = jsonAsMap['children'] as List;
      collections = jsonList.map((collectionJson) {
        return DomainCollection.fromJson(collectionJson);
      }).toList();
    }

    return CategoryDetailsApiResponse(children: collections);
  }

  Map<String, dynamic> toJson() => {"children": children};
  @override
  String toString() {
    return objectToPrintableString(this);
  }
}
