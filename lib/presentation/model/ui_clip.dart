import 'package:coptix/presentation/model/ui_clip_image.dart';
import 'package:coptix/presentation/model/ui_season.dart';
import 'package:coptix/shared/extentsions/list.dart';

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
  });

  factory UiClip.fromDomain(
      DomainClip domain, CollectionDisplayType displayType) {
    return UiClip(
        id: domain.id?.toString() ?? "",
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
            .toList());
  }

  String getImagePath() {
    return (clipImages
                .find((uiClipImage) => uiClipImage.displayType == displayType))
            ?.imagePath ??
        "";
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "display_type": displayType,
        "content_type": contentType,
        "description": description,
        "asset_id": assetId,
        "duration": duration,
        "image": getImagePath(),
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
