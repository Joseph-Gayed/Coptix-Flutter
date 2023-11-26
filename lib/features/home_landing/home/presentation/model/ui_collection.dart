import 'package:coptix/features/home_landing/home/presentation/model/ui_clip.dart';

import '../../../../../shared/enums/section_display_type.dart';

typedef ImageId = String;
typedef ImagePath = String;

class UiCollection {
  final String id;
  final String title;
  final List<UiClip> clips;
  final CollectionDisplayType displayType;

  UiCollection(this.id, this.title, this.clips, this.displayType);
}
