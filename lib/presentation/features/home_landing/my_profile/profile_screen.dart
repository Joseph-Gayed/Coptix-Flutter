import 'package:coptix/domain/model/domain_user.dart';
import 'package:coptix/domain/usecase/load_cached_user_usecase.dart';
import 'package:coptix/presentation/features/home_landing/my_profile/widgets/item_profile_menu.dart';
import 'package:coptix/presentation/model/ui_profile_option.dart';
import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/extensions/widget_ext.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../shared/theme/styles.dart';
import '../../../../shared/utils/localization/app_localizations_delegate.dart';
import '../../../../shared/utils/localization/localized_content.dart';
import '../../../../shared/utils/navigation/app_router.dart';
import '../../../../shared/utils/navigation/navigation_args.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DomainUser? activeUser;
  LoadCachedUserUseCase loadCachedUserUseCase = LoadCachedUserUseCase(getIt());

  @override
  void initState() {
    super.initState();
    loadCachedUser();
  }

  @override
  Widget build(BuildContext context) {
    // Your Landing Screen implementation goes here
    return CoptixContainer(
        child: SafeArea(
      child: Scaffold(
        body: CoptixContainer(
            child: context.isMobileScreen()
                ? screenContentMobile(context)
                : screenContentMobile(context).wrapForTablet()),
      ),
    ));
  }

  Widget screenContentMobile(BuildContext context) {
    List<MenuItem> list = activeUser != null
        ? getLoggedInUserOptions(context).values.toList()
        : getGuestUserOptions(context).values.toList();

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      buildUserWidget(),
      Expanded(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ItemProfileMenu(
                menuItem: list[index],
              );
            }),
      ),
    ]);
  }

  void loadCachedUser() {
    loadCachedUserUseCase.execute().then((value) {
      setState(() {
        activeUser = value;
      });
    });
  }

  Widget buildUserWidget() {
    return Container(
      margin: EdgeInsets.only(
        left: Dimens.screenMarginH,
        right: Dimens.screenMarginH,
        top: Dimens.doubleScreenMarginV,
        bottom: Dimens.screenMarginV,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.screenMarginH, vertical: Dimens.halfScreenMarginV),
      decoration: BoxDecoration(
        border: Border.all(
          color: lightBorderColor, // Change the color as needed
          width: AuthDimens.borderWidth, // Adjust the width as needed
        ),
        borderRadius: BorderRadius.circular(Dimens.cornerRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [welcomeText(), loginOrUserNameWidget()],
      ),
    );
  }

  Text welcomeText() =>
      Text(LocalizationKey.welcome.tr(), style: lightTextStyle);

  Widget loginOrUserNameWidget() {
    if (activeUser != null) {
      return Text(
        activeUser!.name ?? "",
        style: titleTextStyle,
      );
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRouter.login,
              arguments: {NavArgsKeys.appBarTitle: LocalizationKey.login.tr()});
        },
        child: Text(
          LocalizationKey.login.tr(),
          style:
              underlineSecondaryTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }
  }
}
