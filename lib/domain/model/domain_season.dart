import 'dart:convert';

import 'package:coptix/domain/model/domain_clip.dart';

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
      episodes = list.map((episode) => DomainClip.fromJson(episode)).toList();
    } else {
      episodes = null;
    }
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
