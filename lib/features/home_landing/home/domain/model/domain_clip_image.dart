import '../../../../../shared/utils/object_print.dart';

class DomainClipImage {
  String? displayType;
  String? contentType;
  String? imagePath;

  DomainClipImage({this.displayType, this.contentType, this.imagePath});

  factory DomainClipImage.fromJson(Map<String, dynamic> jsonAsMap) {
    return DomainClipImage(
      displayType: jsonAsMap.containsKey("dimension")
          ? (jsonAsMap['dimension']?['key'] ?? "")
          : "",
      contentType: jsonAsMap.containsKey("content_type")
          ? jsonAsMap['content_type']
          : "",
      imagePath: jsonAsMap.containsKey("image") ? jsonAsMap['image'] : "",
    );
  }

  Map<String, dynamic> toJson() => {
        "dimension": displayType,
        "content_type": contentType,
        "image": imagePath,
      };

  @override
  String toString() {
    return objectToPrintableString(this);
  }
}
