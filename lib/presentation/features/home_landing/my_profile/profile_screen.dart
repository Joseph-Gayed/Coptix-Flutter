import 'package:coptix/domain/model/domain_user.dart';
import 'package:coptix/domain/usecase/load_cached_user_usecase.dart';
import 'package:coptix/shared/widgets/coptix_app_bar.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/injection_container.dart';
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
        appBar: CoptixAppBar(
          title: LocalizationKey.profile.tr(),
        ),
        body: screenContent(context),
      ),
    ));
  }

  Column screenContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        userWidget(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRouter.changeAppLanguage);
          },
          child: Text(LocalizationKey.language.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24)),
        ),
      ],
    );
  }

  void loadCachedUser() {
    loadCachedUserUseCase.execute().then((value) {
      setState(() {
        activeUser = value;
      });
    });
  }

  Widget userWidget() {
    if (activeUser != null) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRouter.login,
              arguments: {NavArgsKeys.appBarTitle: LocalizationKey.login.tr()});
        },
        child: Text(
            "${activeUser!.name}\n ${activeUser!.email}\n ${activeUser!.phone}\n\n ${LocalizationKey.login.tr()}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24)),
      );
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRouter.login,
              arguments: {NavArgsKeys.appBarTitle: LocalizationKey.login.tr()});
        },
        child: Text(LocalizationKey.login.tr(),
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 24)),
      );
    }
  }
}
