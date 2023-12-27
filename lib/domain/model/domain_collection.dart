import 'dart:core';

import '../../../../../shared/utils/object_print.dart';
import 'domain_clip.dart';

class DomainCollection {
  int? id;
  String? name;
  String? displayType;
  List<DomainClip>? clips;
  List<DomainClip>? series;
  List<DomainClip>? contents;

  DomainCollection(
      {this.id,
      this.name,
      this.displayType,
      this.clips,
      this.series,
      this.contents});

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

    if (jsonAsMap.containsKey("contents")) {
      List list = jsonAsMap["contents"] as List;
      contents = list.map((clipJson) => DomainClip.fromJson(clipJson)).toList();
    } else {
      contents = [];
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "display_type": displayType,
        "clips": clips,
        "series": series,
        "contents": contents,
      };

  @override
  String toString() {
    return objectToPrintableString(this);
  }
}
