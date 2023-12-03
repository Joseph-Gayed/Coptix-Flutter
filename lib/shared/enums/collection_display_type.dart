enum CollectionDisplayType { normal, vertical, special, banner }

CollectionDisplayType jsonValueToCollectionDisplayType(String jsonValue) {
  if (jsonValue.contains('horizontal')) {
    return CollectionDisplayType.normal;
  } else if (jsonValue.contains('vertical')) {
    return CollectionDisplayType.vertical;
  } else if (jsonValue.contains('carousel')) {
    return CollectionDisplayType.banner;
  } else {
    switch (jsonValue) {
      case 'normal':
        return CollectionDisplayType.normal;
      case 'vertical':
        return CollectionDisplayType.vertical;
      case 'special':
        return CollectionDisplayType.special;
      case 'banner':
        return CollectionDisplayType.banner;
      default:
        return CollectionDisplayType
            .normal; // Return default value if not matched
    }
  }
}
