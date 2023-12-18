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
      title: getAppBarContent(),
    );
  }

  Widget getAppBarContent() {
    return Container(
      height: Dimens.appBarHeight,
      alignment: Alignment.center,
      child: Row(children: [
        Expanded(child: title.isNotEmpty ? getAppBarText() : getAppBarIcon()),
        if (showingBackButton) Container(width: Dimens.backButtonSize),
      ]),
    );
  }

  Widget getAppBarText() {
    return Text(
      title,
      style: titleTextStyle,
    );
  }

  Widget getAppBarIcon() {
    return Image.asset(
      height: Dimens.appBarIconHeight,
      '${imagesPath}logo_name.png',
      // Add width or fit properties as required
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Dimens.appBarHeight);
}
