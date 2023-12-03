import 'package:coptix/shared/enums/content_type.dart';

import '../features/home_landing/home/presentation/model/ui_clip.dart';
import '../features/home_landing/home/presentation/model/ui_collection.dart';
import 'enums/collection_display_type.dart';

// List of movie images
List<String> movieNames = [
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
  "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ",
  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
  "There are many variations of passages of Lorem Ipsum available. ",
]; // List of movie names

class FakeData {
  static List<UiClip> newAdditions5Clips = [
    UiClip(
        id: "5",
        displayType: CollectionDisplayType.vertical,
        contentType: MediaContentType.showsSeason,
        name: "clip name 1",
        description: "",
        clipImages: []),
    UiClip(
        id: "6",
        displayType: CollectionDisplayType.vertical,
        contentType: MediaContentType.series,
        name: "clip name 2",
        description: "",
        clipImages: []),
    UiClip(
        id: "7",
        displayType: CollectionDisplayType.vertical,
        contentType: MediaContentType.clips,
        name: "clip name 3",
        description: "",
        clipImages: []),
    UiClip(
        id: "8",
        displayType: CollectionDisplayType.vertical,
        contentType: MediaContentType.showsSeason,
        name: "clip name 1",
        description: "",
        clipImages: []),
    UiClip(
        id: "9",
        displayType: CollectionDisplayType.vertical,
        contentType: MediaContentType.series,
        name: "clip name 2",
        description: "",
        clipImages: []),
    UiClip(
        id: "10",
        displayType: CollectionDisplayType.vertical,
        contentType: MediaContentType.clips,
        name: "clip name 3",
        description: "",
        clipImages: []),
    UiClip(
        id: "11",
        displayType: CollectionDisplayType.vertical,
        contentType: MediaContentType.showsSeason,
        name: "clip name 1",
        description: "",
        clipImages: []),
    UiClip(
        id: "12",
        displayType: CollectionDisplayType.vertical,
        contentType: MediaContentType.series,
        name: "clip name 2",
        description: "",
        clipImages: []),
    UiClip(
        id: "13",
        displayType: CollectionDisplayType.vertical,
        contentType: MediaContentType.clips,
        name: "clip name 3",
        description: "",
        clipImages: []),
  ];
  static Future<List<UiCollection>> getHomeSectionsData(String lang) async {
    bool isArabic = lang.toLowerCase() == "ar";

    List<UiClip> featuredClips = [
      UiClip(
          id: "1",
          displayType: CollectionDisplayType.banner,
          contentType: MediaContentType.series,
          name: isArabic
              ? "مسلسل : ما هو  لوريم إيبسوم و ما أصله"
              : "Series: Name  of clip 1",
          description: "",
          clipImages: []),
      UiClip(
          id: "2",
          displayType: CollectionDisplayType.banner,
          contentType: MediaContentType.clips,
          name: isArabic
              ? "كليب :هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص "
              : "Clip : Name  of clip 1",
          description: "",
          clipImages: []),
      UiClip(
          id: "3",
          displayType: CollectionDisplayType.banner,
          contentType: MediaContentType.clips,
          name: isArabic
              ? "كليب :العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي "
              : "Clip: Name  of clip 1",
          description: "",
          clipImages: []),
      UiClip(
          id: "4",
          displayType: CollectionDisplayType.banner,
          contentType: MediaContentType.series,
          name: isArabic
              ? "مسلسل :هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص"
              : "Series: Name  of clip 1",
          description: "",
          clipImages: []),
    ];
    List<UiClip> collection2Clips = [
      UiClip(
          id: "5",
          displayType: CollectionDisplayType.vertical,
          contentType: MediaContentType.clips,
          name: "clip name 1",
          description: "",
          clipImages: []),
      UiClip(
          id: "6",
          displayType: CollectionDisplayType.vertical,
          contentType: MediaContentType.clips,
          name: "clip name 2",
          description: "",
          clipImages: []),
      UiClip(
          id: "7",
          displayType: CollectionDisplayType.vertical,
          contentType: MediaContentType.clips,
          name: "clip name 3",
          description: "",
          clipImages: []),
    ];
    List<UiClip> collection3Clips = [
      UiClip(
          id: "8",
          displayType: CollectionDisplayType.normal,
          contentType: MediaContentType.clips,
          name: "clip name 1",
          description: "",
          clipImages: []),
      UiClip(
          id: "9",
          displayType: CollectionDisplayType.normal,
          contentType: MediaContentType.clips,
          name: "clip name 2",
          description: "",
          clipImages: []),
      UiClip(
          id: "10",
          displayType: CollectionDisplayType.normal,
          contentType: MediaContentType.clips,
          name: "clip name 3",
          description: "",
          clipImages: []),
    ];
    List<UiClip> collection4Clips = [
      UiClip(
          id: "11",
          displayType: CollectionDisplayType.normal,
          contentType: MediaContentType.clips,
          name: "clip name 1",
          description: "",
          clipImages: []),
      UiClip(
          id: "12",
          displayType: CollectionDisplayType.normal,
          contentType: MediaContentType.clips,
          name: "clip name 2",
          description: "",
          clipImages: []),
      UiClip(
          id: "13",
          displayType: CollectionDisplayType.normal,
          contentType: MediaContentType.clips,
          name: "clip name 3",
          description: "",
          clipImages: []),
    ];

    List<UiCollection> homeSectionsData = [
      UiCollection("1", "", featuredClips, CollectionDisplayType.banner),
      UiCollection("2", isArabic ? "القداس الإلهي" : "El Oddas el Elahy",
          collection2Clips, CollectionDisplayType.vertical),
      UiCollection("3", isArabic ? "أحدث الإضافات" : "A7das el edafat",
          collection3Clips, CollectionDisplayType.normal),
      UiCollection(
          "4",
          isArabic
              ? "حكايات أبونا بيشوى الأنطونى"
              : "Hekayat Kitr Awy 3an Abona Beshoy el Antony 7lwa mooooot",
          collection4Clips,
          CollectionDisplayType.normal),
      UiCollection("5", isArabic ? "قريبا" : "Soon", newAdditions5Clips,
          CollectionDisplayType.vertical),
    ];
    return homeSectionsData;
  }
}
