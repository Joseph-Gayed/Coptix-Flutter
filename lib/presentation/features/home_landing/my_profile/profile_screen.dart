import 'package:coptix/shared/widgets/coptix_app_bar.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

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
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRouter.login);
          },
          child: Text(LocalizationKey.language.tr(),
              style: const TextStyle(fontSize: 24)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRouter.login, arguments: {
              NavArgsKeys.appBarTitle: LocalizationKey.login.tr()
            });
          },
          child: Text(LocalizationKey.login.tr(),
              style: const TextStyle(fontSize: 24)),
        ),
      ],
    );
  }
}
