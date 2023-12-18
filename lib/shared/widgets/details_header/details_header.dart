import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/widgets/details_header/details_header_mobile.dart';
import 'package:coptix/shared/widgets/details_header/details_header_tablet.dart';
import 'package:flutter/material.dart';

import '../../../presentation/model/ui_clip.dart';

class DetailsHeader extends StatelessWidget {
  final UiClip uiClip;
  final Function(UiClip) onPlayNowClicked;
  final Function(UiClip) onAddToFavoritesClicked;

  const DetailsHeader(
      {super.key,
      required this.uiClip,
      required this.onPlayNowClicked,
      required this.onAddToFavoritesClicked});

  @override
  Widget build(BuildContext context) {
    return (context.isMobileScreen()
        ? DetailsHeaderMobile(
            uiClip: uiClip,
            onPlayNowClicked: onPlayNowClicked,
            onAddToFavoritesClicked: onAddToFavoritesClicked)
        : DetailsHeaderTablet(
            uiClip: uiClip,
            onPlayNowClicked: onPlayNowClicked,
            onAddToFavoritesClicked: onAddToFavoritesClicked));
  }
}
