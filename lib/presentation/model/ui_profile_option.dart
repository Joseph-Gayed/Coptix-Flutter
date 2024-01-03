import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:coptix/shared/utils/navigation/app_router.dart';

abstract class MenuItem {
  abstract bool isDivider;
}

class MenuDividerItem extends MenuItem {
  @override
  bool isDivider = true;
}

class MenuTextItem extends MenuItem {
  @override
  bool isDivider = false;

  final String title;
  final String? icon;
  final String? navigationRoute;
  final bool isHeader;

  MenuTextItem(
      {required this.title,
      this.icon,
      this.navigationRoute,
      this.isHeader = false});

  MenuTextItem copyWith({
    String? title,
    String? icon,
    String? navigationRoute,
    bool? isHeader,
    bool? isWithBottomDivider,
  }) {
    return MenuTextItem(
        title: title ?? this.title,
        icon: icon ?? this.icon,
        navigationRoute: navigationRoute ?? this.navigationRoute,
        isHeader: isHeader ?? this.isHeader);
  }
}

enum ProfileOptionKey {
  profileHeader,
  myList,
  language,
  accountSettingsHeader,
  accountDetails,
  changePassword,
  appSettings,
  help,
  contactUs,
  logout,
  divider1,
  divider2,
  divider3,
  divider4,
  divider5,
  divider6,
}

Map<ProfileOptionKey, MenuItem> getLoggedInUserOptions() {
  return {
    ProfileOptionKey.profileHeader:
        MenuTextItem(title: LocalizationKey.profile.tr(), isHeader: true),
    ProfileOptionKey.myList: MenuTextItem(
        title: LocalizationKey.myList.tr(),
        icon: "ic_my_list.png",
        navigationRoute: AppRouter.bookmarks),
    ProfileOptionKey.divider1: MenuDividerItem(),
    ProfileOptionKey.language: MenuTextItem(
        title: LocalizationKey.language.tr(),
        icon: "ic_language.png",
        navigationRoute: AppRouter.changeAppLanguage),
    ProfileOptionKey.accountSettingsHeader: MenuTextItem(
      title: LocalizationKey.accountSettings.tr(),
      isHeader: true,
    ),
    ProfileOptionKey.accountDetails: MenuTextItem(
        title: LocalizationKey.accountDetails.tr(),
        icon: "ic_profile_white.png",
        navigationRoute: AppRouter.accountDetails),
    ProfileOptionKey.divider2: MenuDividerItem(),
    ProfileOptionKey.changePassword: MenuTextItem(
        title: LocalizationKey.changePassword.tr(),
        icon: "ic_password.png",
        navigationRoute: AppRouter.changePassword),
    ProfileOptionKey.divider3: MenuDividerItem(),
    ProfileOptionKey.appSettings: MenuTextItem(
        title: LocalizationKey.appSettings.tr(),
        icon: "ic_setting.png",
        navigationRoute: AppRouter.appSettings),
    ProfileOptionKey.divider4: MenuDividerItem(),
    ProfileOptionKey.help: MenuTextItem(
        title: LocalizationKey.help.tr(),
        icon: "ic_help.png",
        navigationRoute: AppRouter.help),
    ProfileOptionKey.divider5: MenuDividerItem(),
    ProfileOptionKey.contactUs: MenuTextItem(
        title: LocalizationKey.contactUs.tr(),
        icon: "ic_contact.png",
        navigationRoute: AppRouter.contactUs),
    ProfileOptionKey.divider6: MenuDividerItem(),
    ProfileOptionKey.logout: MenuTextItem(
      title: LocalizationKey.logout.tr(),
      icon: "ic_logout.png",
      navigationRoute: AppRouter.logout,
    ),
  };
}

Map<ProfileOptionKey, MenuItem> getGuestUserOptions() {
  Map<ProfileOptionKey, MenuItem> loggedInUserOptions =
      getLoggedInUserOptions();
  return {
    ProfileOptionKey.profileHeader:
        loggedInUserOptions[ProfileOptionKey.profileHeader]!,
    ProfileOptionKey.language: loggedInUserOptions[ProfileOptionKey.language]!,
    ProfileOptionKey.accountSettingsHeader:
        loggedInUserOptions[ProfileOptionKey.accountSettingsHeader]!,
    ProfileOptionKey.appSettings:
        loggedInUserOptions[ProfileOptionKey.appSettings]!,
    ProfileOptionKey.divider1: MenuDividerItem(),
    ProfileOptionKey.help: loggedInUserOptions[ProfileOptionKey.help]!,
    ProfileOptionKey.divider2: MenuDividerItem(),
    ProfileOptionKey.contactUs:
        loggedInUserOptions[ProfileOptionKey.contactUs]!,
  };
}
