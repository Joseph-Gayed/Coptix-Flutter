import 'package:coptix/presentation/model/ui_profile_option.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/theme/styles.dart';
import 'package:coptix/shared/widgets/common_methods.dart';
import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../../../shared/utils/constants.dart';

class ItemProfileMenu extends StatelessWidget {
  final MenuItem menuItem;
  const ItemProfileMenu({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    switch (menuItem.runtimeType) {
      case const (MenuTextItem):
        {
          MenuTextItem menuTextItem = menuItem as MenuTextItem;
          return menuTextItem.isHeader
              ? buildHeader(menuTextItem)
              : buildItem(context, menuTextItem);
        }
      default:
        {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.screenMarginH),
            child: const Divider(color: lightBorderColor),
          );
        }
    }
  }

  Widget buildHeader(MenuTextItem menuItem) {
    return Container(
      width: double.infinity,
      color: primaryColor,
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.screenMarginH, vertical: Dimens.screenMarginV),
      margin: EdgeInsets.only(top: Dimens.screenMarginV),
      child: Text(
        menuItem.title,
        style: body2TextStyle,
      ),
    );
  }

  Widget buildItem(BuildContext context, MenuTextItem menuItem) {
    return GestureDetector(
      onTap: () {
        try {
          Navigator.pushNamed(context, menuItem.navigationRoute!);
        } catch (e) {}
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimens.screenMarginH,
            vertical: Dimens.halfScreenMarginV),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //item icon
            getAssetIcon(menuItem.icon!),

            SizedBox(
              width: Dimens.screenMarginH,
            ),
            //item title
            Expanded(
              child: Text(
                menuItem.title,
                style: body1TextStyle,
              ),
            ),

            //arrow icon
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimens.screenMarginH),
              child: Image.asset(
                MyApp.isRtl(context)
                    ? '${imagesPath}ic_arrow_left.png'
                    : '${imagesPath}ic_arrow_right.png',
                width: Dimens.arrowIconSize, // Adjust width as needed
                height: Dimens.arrowIconSize, // Adjust height as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
