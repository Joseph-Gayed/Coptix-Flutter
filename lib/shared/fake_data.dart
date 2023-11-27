import 'package:coptix/shared/enums/content_type.dart';

import '../features/home_landing/home/presentation/model/ui_clip.dart';
import '../features/home_landing/home/presentation/model/ui_collection.dart';
import 'enums/section_display_type.dart';

// List of movie images
List<String> movieNames = [
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
  "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ",
  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
  "There are many variations of passages of Lorem Ipsum available. ",
]; // List of movie names

class FakeData {
  static List<UiClip> newAdditions5Clips = [
    UiClip("5", CollectionDisplayType.vertical, MediaContentType.showsSeason,
        "clip name 1", "", "image_v1.png"),
    UiClip("6", CollectionDisplayType.vertical, MediaContentType.series,
        "clip name 2", "", "image_v2.png"),
    UiClip("7", CollectionDisplayType.vertical, MediaContentType.clips,
        "clip name 3", "", "image_v3.png"),
    UiClip("8", CollectionDisplayType.vertical, MediaContentType.showsSeason,
        "clip name 1", "", "image_v1.png"),
    UiClip("9", CollectionDisplayType.vertical, MediaContentType.series,
        "clip name 2", "", "image_v2.png"),
    UiClip("10", CollectionDisplayType.vertical, MediaContentType.clips,
        "clip name 3", "", "image_v3.png"),
    UiClip("11", CollectionDisplayType.vertical, MediaContentType.showsSeason,
        "clip name 1", "", "image_v1.png"),
    UiClip("12", CollectionDisplayType.vertical, MediaContentType.series,
        "clip name 2", "", "image_v2.png"),
    UiClip("13", CollectionDisplayType.vertical, MediaContentType.clips,
        "clip name 3", "", "image_v3.png"),
  ];
  static Future<List<UiCollection>> getHomeSectionsData(String lang) async {
    bool isArabic = lang.toLowerCase() == "ar";

    List<UiClip> featuredClips = [
      UiClip(
          "1",
          CollectionDisplayType.banner,
          MediaContentType.series,
          isArabic
              ? "مسلسل : ما هو  لوريم إيبسوم و ما أصله"
              : "Series: Name  of clip 1",
          "",
          "https://fastly.picsum.photos/id/1040/400/700.jpg?hmac=Bz8sK69K6gL-DmRYNhNjJP95wcgdqlx877cZfzo7g9M"),
      UiClip(
          "2",
          CollectionDisplayType.banner,
          MediaContentType.clips,
          isArabic
              ? "كليب :هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص "
              : "Clip : Name  of clip 1",
          "",
          "https://fastly.picsum.photos/id/791/400/700.jpg?hmac=1nDhkt0TAPpqFqYbbwfNW5OMjCpOLCmSxymgE7piMn4"),
      UiClip(
          "3",
          CollectionDisplayType.banner,
          MediaContentType.clips,
          isArabic
              ? "كليب :العديد من برامح النشر المكتبي وبرامح تحرير صفحات الويب تستخدم لوريم إيبسوم بشكل إفتراضي "
              : "Clip: Name  of clip 1",
          "",
          "https://fastly.picsum.photos/id/982/400/700.jpg?hmac=2n7-7xSyg1hDBdRou90ffE4O1pjUV5tbedphfENS1v0"),
      UiClip(
          "4",
          CollectionDisplayType.banner,
          MediaContentType.series,
          isArabic
              ? "مسلسل :هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص"
              : "Series: Name  of clip 1",
          "",
          "https://fastly.picsum.photos/id/740/400/700.jpg?hmac=ieDF_njwSlWp_w-x_rLQ9Hrs_Ap954Qy2q20UBX-uII"),
    ];
    List<UiClip> collection2Clips = [
      UiClip("5", CollectionDisplayType.vertical, MediaContentType.clips,
          "clip name 1", "", "image_v1.png"),
      UiClip("6", CollectionDisplayType.vertical, MediaContentType.clips,
          "clip name 2", "", "image_v2.png"),
      UiClip("7", CollectionDisplayType.vertical, MediaContentType.clips,
          "clip name 3", "", "image_v3.png"),
    ];
    List<UiClip> collection3Clips = [
      UiClip("8", CollectionDisplayType.normal, MediaContentType.clips,
          "clip name 1", "", "image_n1.png"),
      UiClip("9", CollectionDisplayType.normal, MediaContentType.clips,
          "clip name 2", "", "image_n2.png"),
      UiClip("10", CollectionDisplayType.normal, MediaContentType.clips,
          "clip name 3", "", "image_n3.png"),
    ];
    List<UiClip> collection4Clips = [
      UiClip("11", CollectionDisplayType.normal, MediaContentType.clips,
          "clip name 1", "", "image_n1.png"),
      UiClip("12", CollectionDisplayType.normal, MediaContentType.clips,
          "clip name 2", "", "image_n2.png"),
      UiClip("13", CollectionDisplayType.normal, MediaContentType.clips,
          "clip name 3", "", "image_n3.png"),
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
