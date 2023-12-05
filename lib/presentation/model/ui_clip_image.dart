import '../../../../../shared/enums/collection_display_type.dart';
import '../../../../../shared/enums/content_type.dart';
import '../../domain/model/domain_clip_image.dart';

class UiClipImage {
  final CollectionDisplayType displayType;
  final MediaContentType contentType;
  final String imagePath;

  UiClipImage(
      {required this.displayType,
      required this.contentType,
      required this.imagePath});

  factory UiClipImage.fromDomain(DomainClipImage domain) {
    return UiClipImage(
        displayType: jsonValueToCollectionDisplayType(domain.displayType ?? ""),
        contentType: jsonValueToMediaContentType(domain.contentType ?? ""),
        imagePath: domain.imagePath ?? "");
  }
}
