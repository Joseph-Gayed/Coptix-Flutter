import '../../../../../shared/utils/object_print.dart';
import '../../domain/model/domain_collection.dart';

class HomeCollectionsApiResponse {
  final List<DomainCollection>? collections;

  HomeCollectionsApiResponse({required this.collections});

  factory HomeCollectionsApiResponse.fromJson(Map<String, dynamic> jsonAsMap) {
    List<DomainCollection> collections = [];
    if (jsonAsMap.containsKey("collections")) {
      List jsonList = jsonAsMap['collections'] as List;
      collections = jsonList.map((collectionJson) {
        return DomainCollection.fromJson(collectionJson);
      }).toList();
    }

    return HomeCollectionsApiResponse(collections: collections);
  }

  Map<String, dynamic> toJson() => {"collections": collections};
  @override
  String toString() {
    return objectToPrintableString(this);
  }
}
