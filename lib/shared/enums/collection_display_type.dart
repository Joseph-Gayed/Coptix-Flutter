enum CollectionDisplayType { normal, vertical, special, banner }

Map<String, CollectionDisplayType> jsonDisplayTypes = {
  'horizontal': CollectionDisplayType.normal,
  'vertical': CollectionDisplayType.vertical,
  'carousel': CollectionDisplayType.banner,
  'special': CollectionDisplayType.special,
  'featured_single_content': CollectionDisplayType.special,
  'banner': CollectionDisplayType.banner,
  'normal': CollectionDisplayType.normal,
};

CollectionDisplayType displayTypeFromJson(String jsonValue) {
  for (var entry in jsonDisplayTypes.entries) {
    if (jsonValue.contains(entry.key)) {
      return entry.value;
    }
  }
  // Default value if no match found
  return CollectionDisplayType.normal;
}
