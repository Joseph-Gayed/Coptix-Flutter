import 'package:coptix/shared/theme/dimens.dart';
import 'package:flutter/material.dart';

import '../theme/styles.dart';
import '../utils/constants.dart';

class CoptixAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showingBackButton;
  final String title;
  const CoptixAppBar(
      {super.key, this.showingBackButton = false, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title.isNotEmpty ? getAppBarText() : getAppBarIcon(),
    );
  }

  Widget getAppBarText() {
    return Text(
      title,
      style: titleTextStyle,
    );
  }

  Row getAppBarIcon() {
    return Row(children: [
      Expanded(
        child: Center(
          child: Image.asset(
            height: Dimens.appBarHeight,
            '${imagesPath}logo_name.png',
            // Add width or fit properties as required
          ),
        ),
      ),
      if (showingBackButton) SizedBox(width: Dimens.backButtonSize),
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(Dimens.appBarHeight);
}
