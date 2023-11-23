import 'package:coptix/shared/theme/dimens.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CoptixContainer extends StatelessWidget {
  final Widget child;
  const CoptixContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(Dimens.screenMargin),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("${imagesPath}screens_background.png"),
            fit: BoxFit.fill,
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
