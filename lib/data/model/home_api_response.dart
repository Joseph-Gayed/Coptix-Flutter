
import '../../../../../shared/utils/object_print.dart';
import '../../domain/model/domain_collection.dart';

class HomeApiResponse {
  final List<DomainCollection>? collections;

  HomeApiResponse({required this.collections});

  factory HomeApiResponse.fromJson(dynamic json) {
    Map<String, dynamic> jsonAsMap = json as Map<String, dynamic>;
    List list = [];
    if (jsonAsMap.containsKey("collections")) {
      list = jsonAsMap['collections'] as List;
    }
    return HomeApiResponse(
        collections: list.map((collectionJson) {
      return DomainCollection.fromJson(collectionJson);
    }).toList());
  }

  Map<String, dynamic> toJson() => {"collections": collections};
  @override
  String toString() {
    return objectToPrintableString(this);
  }
}
