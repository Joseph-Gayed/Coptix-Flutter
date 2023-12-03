import 'package:coptix/features/home_landing/home/domain/model/domain_clip.dart';
import 'package:coptix/features/home_landing/home/presentation/model/ui_clip_image.dart';
import 'package:coptix/shared/extentsions/list.dart';

import '../../../../../shared/enums/content_type.dart';
import '../../../../../shared/enums/collection_display_type.dart';

class UiClip {
  final String id;
  final CollectionDisplayType displayType;
  final MediaContentType contentType;
  final String name;
  final String description;
  final List<UiClipImage> clipImages;

  UiClip(
      {required this.id,
      required this.displayType,
      required this.contentType,
      required this.name,
      required this.description,
      required this.clipImages});

  factory UiClip.fromDomain(
      DomainClip domain, CollectionDisplayType displayType) {
    return UiClip(
        id: domain.id?.toString() ?? "",
        displayType: displayType,
        contentType: jsonValueToMediaContentType(domain.contentType ?? ""),
        name: domain.name ?? "",
        description: domain.description ?? "",
        clipImages: (domain.contentImages ?? [])
            .map((domainClipImage) => UiClipImage.fromDomain(domainClipImage))
            .toList());
  }

  String getImagePath() {
    return (clipImages
                .find((uiClipImage) => uiClipImage.displayType == displayType))
            ?.imagePath ??
        "";
  }
}
