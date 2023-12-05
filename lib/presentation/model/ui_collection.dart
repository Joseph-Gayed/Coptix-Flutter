import 'package:coptix/presentation/model/ui_clip.dart';

import '../../../../../shared/enums/collection_display_type.dart';
import '../../domain/model/domain_clip.dart';
import '../../domain/model/domain_collection.dart';

typedef ImageId = String;
typedef ImagePath = String;

class UiCollection {
  final String id;
  final String name;
  final List<UiClip> clips;
  final CollectionDisplayType displayType;

  UiCollection(this.id, this.name, this.clips, this.displayType);

  factory UiCollection.fromDomain(DomainCollection domain) {
    CollectionDisplayType displayType =
        jsonValueToCollectionDisplayType(domain.displayType ?? "");
    return UiCollection(domain.id?.toString() ?? "", domain.name ?? "",
        clipsFromDomain(domain, displayType), displayType);
  }
}

List<UiClip> clipsFromDomain(
    DomainCollection domain, CollectionDisplayType displayType) {
  List<DomainClip> domainClipsAndSeries = (domain.clips ?? []);
  domainClipsAndSeries.addAll(domain.series ?? []);

  return domainClipsAndSeries.map((DomainClip domainClip) {
    return UiClip.fromDomain(domainClip, displayType);
  }).toList();
}
