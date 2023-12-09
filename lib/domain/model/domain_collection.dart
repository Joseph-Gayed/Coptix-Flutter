import 'dart:core';

import 'package:flutter/material.dart';

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
    debugPrint(
        "   DomainCollection.fromJson - will Parse collection ID :  $id ");

    name = jsonAsMap.containsKey("name") ? jsonAsMap["name"] : "";

    displayType = jsonAsMap.containsKey("display_type")
        ? (json["display_type"]?["key"] ?? "")
        : "";

    if (jsonAsMap.containsKey("clips")) {
      List list = jsonAsMap["clips"] as List;
      debugPrint(
          "   DomainCollection.fromJson - will Parse ${jsonAsMap.length} clips");
      clips = list.map((clipJson) => DomainClip.fromJson(clipJson)).toList();
      debugPrint(
          "   DomainCollection.fromJson - finished Parsing ${clips?.length ?? 0} clips");
    } else {
      clips = [];
    }

    if (jsonAsMap.containsKey("series")) {
      List list = jsonAsMap["series"] as List;
      debugPrint(
          "   DomainCollection.fromJson - will Parse ${jsonAsMap.length} series");
      series = list.map((clipJson) => DomainClip.fromJson(clipJson)).toList();
      debugPrint(
          "   DomainCollection.fromJson - finished Parsing ${series?.length ?? 0} series");
    } else {
      series = [];
    }

    debugPrint(
        "   DomainCollection.fromJson - Finished Parsing collection ID :  $id ");
    debugPrint("---------------------------------------------");
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
