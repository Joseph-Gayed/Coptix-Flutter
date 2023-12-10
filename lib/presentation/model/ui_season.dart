import 'package:coptix/domain/model/domain_season.dart';
import 'package:coptix/presentation/model/ui_clip.dart';
import 'package:coptix/shared/enums/collection_display_type.dart';

class UiSeason {
  String id;
  String year;
  num noOfEpisodes;
  String rate;
  String name;
  String description;
  List<UiClip> episodes;

  UiSeason(this.id, this.year, this.noOfEpisodes, this.rate, this.name,
      this.description, this.episodes);

  factory UiSeason.fromDomain(DomainSeason domain) {
    var id = domain.id?.toString() ?? "";
    var year = domain.year?.toString() ?? "";
    var noOfEpisodes = domain.noOfEpisodes ?? 0;
    var rate = domain.rate?.toString() ?? "";
    var name = domain.name ?? "";
    var description = domain.description ?? "";
    var episodes = (domain.episodes ?? [])
        .map((domainClip) => UiClip.fromDomain(domainClip,
            jsonValueToCollectionDisplayType(domainClip.displayType ?? "")))
        .toList();

    return UiSeason(
      id,
      year,
      noOfEpisodes,
      rate,
      name,
      description,
      episodes,
    );
  }
}
