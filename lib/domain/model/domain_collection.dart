import 'dart:core';


import '../../../../../shared/utils/object_print.dart';
import 'domain_clip.dart';

class DomainCollection {
  int? id;
  String? name;
  String? displayType;
  List<DomainClip>? clips;
  List<DomainClip>? series;

  DomainCollection(
      {this.id, this.name, this.displayType, this.clips, this.series});

  DomainCollection.fromJson(dynamic json) {
    Map<String, dynamic> jsonAsMap = json as Map<String, dynamic>;
    id = jsonAsMap.containsKey("id") ? jsonAsMap["id"] : "";
    name = jsonAsMap.containsKey("name") ? jsonAsMap["name"] : "";

    displayType = jsonAsMap.containsKey("display_type")
        ? (json["display_type"]?["key"] ?? "")
        : "";

    if (jsonAsMap.containsKey("clips")) {
      List list = jsonAsMap["clips"] as List;
      clips = list.map((clipJson) => DomainClip.fromJson(clipJson)).toList();
    } else {
      clips = [];
    }

    if (jsonAsMap.containsKey("series")) {
      List list = jsonAsMap["series"] as List;
      series = list.map((clipJson) => DomainClip.fromJson(clipJson)).toList();
    } else {
      series = [];
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "display_type": displayType,
        "clips": clips,
        "series": series,
      };

  @override
  String toString() {
    return objectToPrintableString(this);
  }
}
