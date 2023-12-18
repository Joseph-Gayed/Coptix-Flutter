import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CoptixContainer extends StatelessWidget {
  final Widget child;
  const CoptixContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: EdgeInsets.only(
        //     top: Dimens.halfScreenMarginV,
        //     left: Dimens.halfScreenMarginH,
        //     right: Dimens.halfScreenMarginH),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("${imagesPath}screens_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: child),
          ],
        ));
  }
}
