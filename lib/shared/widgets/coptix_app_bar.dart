import 'package:coptix/shared/theme/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CoptixAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CoptixAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Image.asset(
          '${imagesPath}logo_name.png',
          height: Dimens.appBarHeight,
          // Add width or fit properties as required
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
