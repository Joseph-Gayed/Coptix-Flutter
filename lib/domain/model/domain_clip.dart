// ignore_for_file: unused_import

import 'dart:convert';

import 'package:coptix/shared/utils/object_print.dart';

import 'domain_clip_image.dart';

class DomainClip {
  num? id;
  String? displayType;
  String? contentType;
  String? name;
  String? description;
  List<DomainClipImage>? contentImages;

  DomainClip({
    this.id,
    this.displayType,
    this.contentType,
    this.name,
    this.description,
    this.contentImages,
  });

  DomainClip.fromJson(dynamic json) {
    Map<String, dynamic> jsonAsMap = json as Map<String, dynamic>;
    id = jsonAsMap.containsKey("id") ? jsonAsMap['id'] : "";
    contentType = jsonAsMap.containsKey("content_type")
        ? (jsonAsMap['content_type']?['key'] ?? "")
        : "";
    name = jsonAsMap.containsKey("name") ? jsonAsMap['name'] : "";
    description =
        jsonAsMap.containsKey("description") ? jsonAsMap['description'] : "";

    if (jsonAsMap.containsKey("content_images")) {
      List list = jsonAsMap["content_images"] as List;
      contentImages = list
          .map((clipImageJson) => DomainClipImage.fromJson(clipImageJson))
          .toList();
    } else {
      contentImages = [];
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "display_type": displayType,
        "content_type": contentType,
        "description": description,
        "content_images": contentImages,
      };

  @override
  String toString() {
    return objectToPrintableString(this);
  }
}
