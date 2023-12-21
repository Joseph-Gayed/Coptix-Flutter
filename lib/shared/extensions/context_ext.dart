import 'package:coptix/shared/extensions/media_query_ext.dart';
import 'package:flutter/cupertino.dart';

extension ContextExt on BuildContext {
  bool isMobileScreen() {
    return MediaQuery.of(this).isMobileScreen();
  }

  int halfScreenWidth() {
    return MediaQuery.of(this).halfScreenWidth();
  }

  int halfScreenHeight() {
    return MediaQuery.of(this).halfScreenHeight();
  }

  Map<String, dynamic>? getNavArgs() {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(this)?.settings.arguments as Map<String, dynamic>?;
    return arguments;
  }
}
