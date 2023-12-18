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
}
