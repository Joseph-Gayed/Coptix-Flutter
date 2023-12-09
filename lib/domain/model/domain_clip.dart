// ignore_for_file: unused_import

import 'dart:convert';

import 'package:coptix/shared/utils/object_print.dart';
import 'package:flutter/material.dart';

import 'domain_clip_image.dart';
import 'domain_season.dart';

class DomainClip {
  int? id;
  String? displayType;
  String? contentType;
  String? name;
  String? description;
  String? assetId;
  dynamic duration;
  List<DomainClipImage>? contentImages;
  List<DomainSeason>? seasons;
  List<DomainClip>? relatedClips;

  DomainClip({
    this.id,
    this.displayType,
    this.contentType,
    this.name,
    this.description,
    this.assetId,
    this.duration,
    this.contentImages,
    this.seasons,
    this.relatedClips,
  });

  DomainClip.fromJson(Map<String, dynamic> jsonAsMap) {
    id = jsonAsMap.containsKey("id") ? jsonAsMap['id'] : 0;

    contentType = jsonAsMap.containsKey("content_type")
        ? (jsonAsMap['content_type']?['key'] ?? "")
        : "";
    debugPrint("     DomainClip.fromJson - will Parse $contentType ID :  $id ");
    name = jsonAsMap.containsKey("name") ? jsonAsMap['name'] : "";
    description =
        jsonAsMap.containsKey("description") ? jsonAsMap['description'] : "";
    assetId = jsonAsMap.containsKey("asset_id") ? jsonAsMap['asset_id'] : "";

    duration = jsonAsMap.containsKey('duration')
        ? jsonAsMap['duration']
        : jsonAsMap.containsKey('clip_duration')
            ? jsonAsMap['clip_duration']
            : 0;

    if (jsonAsMap.containsKey("content_images")) {
      List list = jsonAsMap["content_images"] as List;
      contentImages = list
          .map((clipImageJson) => DomainClipImage.fromJson(clipImageJson))
          .toList();
    } else {
      contentImages = [];
    }

    if (jsonAsMap.containsKey("seasons")) {
      List list = jsonAsMap["seasons"] as List;
      debugPrint(
          "     DomainClip.fromJson - will Parse ${list.length} seasons");

      seasons = list.map((season) => DomainSeason.fromJson(season)).toList();
      debugPrint(
          "     DomainClip.fromJson - Finished Parsing ${seasons?.length ?? 0} seasons");
    } else {
      seasons = null;
    }
    if (jsonAsMap.containsKey("related")) {
      List list = jsonAsMap["related"] as List;
      debugPrint(
          "     DomainClip.fromJson - will Parse ${list.length} related");
      relatedClips =
          list.map((clipJson) => DomainClip.fromJson(clipJson)).toList();
      debugPrint(
          "     DomainClip.fromJson - Finished Parsing ${relatedClips?.length ?? 0} related");
    } else {
      relatedClips = null;
    }

    debugPrint(
        "     DomainClip.fromJson - finished Parsing $contentType ID :  $id ");
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "display_type": displayType,
        "content_type": contentType,
        "description": description,
        "asset_id": assetId,
        "duration": duration,
        "content_images": contentImages,
        "seasons": seasons,
        "related": relatedClips,
      };

  @override
  String toString() {
    return objectToPrintableString(this);
  }
}
