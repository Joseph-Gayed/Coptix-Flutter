import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

import '../../../shared/utils/localization/app_localizations.dart';
import '../../../shared/utils/localization/localized_content.dart';

class NewAdditionsScreen extends StatefulWidget {
  const NewAdditionsScreen({super.key});

  @override
  State<NewAdditionsScreen> createState() => _NewAdditionsScreenState();
}

class _NewAdditionsScreenState extends State<NewAdditionsScreen> {
  @override
  Widget build(BuildContext context) {
    // Your Landing Screen implementation goes here
    return Scaffold(
      body: CoptixContainer(
        child: Text(
            AppLocalizations.of(context)
                .translate(LocalizationKey.newAdditions),
            style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
