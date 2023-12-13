enum CollectionDisplayType { normal, vertical, special, banner }

CollectionDisplayType displayTypeFromJson(String jsonValue) {
  if (jsonValue.contains('horizontal')) {
    return CollectionDisplayType.normal;
  } else if (jsonValue.contains('vertical')) {
    return CollectionDisplayType.vertical;
  } else if (jsonValue.contains('carousel')) {
    return CollectionDisplayType.banner;
  } else {
    switch (jsonValue) {
      case 'vertical':
        return CollectionDisplayType.vertical;
      case 'special':
      case 'featured_single_content':
        return CollectionDisplayType.special;
      case 'banner':
        return CollectionDisplayType.banner;
      case 'normal':
      default:
        return CollectionDisplayType.normal;
    }
  }
}
