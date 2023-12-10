import 'package:coptix/shared/theme/dimens.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CoptixAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showingBackButton;
  const CoptixAppBar({super.key, this.showingBackButton = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(children: [
        Expanded(
          child: Center(
            child: Image.asset(
              '${imagesPath}logo_name.png',
              height: Dimens.appBarHeight,
              // Add width or fit properties as required
            ),
          ),
        ),
        if (showingBackButton) const SizedBox(width: Dimens.backButtonSize),
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
