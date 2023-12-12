import 'package:coptix/presentation/model/ui_clip_image.dart';
import 'package:coptix/presentation/model/ui_season.dart';
import 'package:coptix/shared/extensions/list.dart';

import '../../../../../shared/enums/collection_display_type.dart';
import '../../../../../shared/enums/content_type.dart';
import '../../domain/model/domain_clip.dart';

class UiClip {
  final String id;
  final CollectionDisplayType displayType;
  final MediaContentType contentType;
  final String name;
  final String description;
  final String assetId;
  final dynamic duration;
  final List<UiClipImage> clipImages;
  List<UiSeason> seasons;

  UiSeason? currentSeason;

  List<UiClip> relatedClips;

  UiClip({
    required this.id,
    required this.displayType,
    required this.contentType,
    required this.name,
    required this.description,
    required this.assetId,
    required this.duration,
    required this.clipImages,
    this.seasons = const [],
    this.relatedClips = const [],
  });

  factory UiClip.fromDomain(
      DomainClip domain, CollectionDisplayType displayType) {
    var id = domain.id?.toString() ?? "";

    var relatedClips = (domain.relatedClips ?? [])
        .map((domainClip) => UiClip.fromDomain(domainClip,
            jsonValueToCollectionDisplayType(domainClip.displayType ?? "")))
        .toList();

    return UiClip(
        id: id,
        displayType: displayType,
        contentType: jsonValueToMediaContentType(domain.contentType ?? ""),
        name: domain.name ?? "",
        description: domain.description ?? "",
        assetId: domain.assetId ?? "",
        duration: domain.duration ?? "",
        clipImages: (domain.contentImages ?? [])
            .map((domainClipImage) => UiClipImage.fromDomain(domainClipImage))
            .toList(),
        seasons: (domain.seasons ?? [])
            .map((domainSeason) => UiSeason.fromDomain(domainSeason))
            .toList(),
        relatedClips: relatedClips);
  }

  String getImagePath() {
    return (clipImages
                .find((uiClipImage) => uiClipImage.displayType == displayType))
            ?.imagePath ??
        "";
  }
}
