import '../../../../../shared/enums/content_type.dart';
import '../../../../../shared/enums/section_display_type.dart';

class UiClip {
  final String id;
  final CollectionDisplayType displayType;
  final MediaContentType contentType;
  final String name;
  final String description;
  final String imagePath;

  UiClip(this.id, this.displayType, this.contentType, this.name,
      this.description, this.imagePath);
}
