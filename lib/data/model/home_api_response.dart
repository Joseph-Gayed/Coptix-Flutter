import 'package:flutter/material.dart';

import '../../../../../shared/utils/object_print.dart';
import '../../domain/model/domain_collection.dart';

class HomeApiResponse {
  final List<DomainCollection>? collections;

  HomeApiResponse({required this.collections});

  factory HomeApiResponse.fromJson(Map<String, dynamic> jsonAsMap) {
    debugPrint(
        "HomeApiResponse.fromJson - will Parse ${jsonAsMap.length} objects");

    List<DomainCollection> collections = [];
    if (jsonAsMap.containsKey("collections")) {
      List jsonList = jsonAsMap['collections'] as List;
      collections = jsonList.map((collectionJson) {
        return DomainCollection.fromJson(collectionJson);
      }).toList();
    }

    debugPrint(
        "HomeApiResponse.fromJson - Finished Parsing ${collections.length} Collections");
    return HomeApiResponse(collections: collections);
  }

  Map<String, dynamic> toJson() => {"collections": collections};
  @override
  String toString() {
    return objectToPrintableString(this);
  }
}
