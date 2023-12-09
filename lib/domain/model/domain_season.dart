import 'dart:convert';

import 'package:coptix/domain/model/domain_clip.dart';
import 'package:flutter/material.dart';

DomainSeason seasonFromJson(String str) =>
    DomainSeason.fromJson(json.decode(str));
String seasonToJson(DomainSeason data) => json.encode(data.toJson());

class DomainSeason {
  num? id;
  num? year;
  num? noOfEpisodes;
  num? rate;
  String? name;
  String? description;
  List<DomainClip>? episodes;

  DomainSeason({
    this.id,
    this.year,
    this.noOfEpisodes,
    this.rate,
    this.name,
    this.description,
    this.episodes,
  });

  DomainSeason.fromJson(Map<String, dynamic> jsonAsMap) {
    id = jsonAsMap.containsKey("id") ? jsonAsMap['id'] : 0;
    debugPrint("       DomainSeason.fromJson - will Parse Season ID :  $id ");

    year = jsonAsMap.containsKey("year") ? jsonAsMap['year'] : 0;
    noOfEpisodes = jsonAsMap.containsKey("no_of_episodes")
        ? jsonAsMap['no_of_episodes']
        : 0;
    rate = jsonAsMap.containsKey("id") ? jsonAsMap['rate'] : 0;
    name = jsonAsMap.containsKey("name") ? jsonAsMap['name'] : "";
    description =
        jsonAsMap.containsKey("description") ? jsonAsMap['description'] : "";

    if (jsonAsMap.containsKey("episodes")) {
      List list = jsonAsMap["episodes"] as List;
      debugPrint(
          "       DomainSeason.fromJson - will Parse ${list.length} episodes");

      episodes = list.map((episode) => DomainClip.fromJson(episode)).toList();
      debugPrint(
          "       DomainSeason.fromJson - Finished Parsing ${episodes?.length ?? 0} episodes");
    } else {
      episodes = null;
    }
    debugPrint(
        "       DomainSeason.fromJson - Finished Parsing Season ID :  $id ");
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['year'] = year;
    map['no_of_episodes'] = noOfEpisodes;
    map['rate'] = rate;
    map['name'] = name;
    map['description'] = description;
    if (episodes != null) {
      map['episodes'] = episodes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
