import 'package:flutter/cupertino.dart';

extension MediaQueryExt on MediaQueryData {
  bool isMobileScreen() {
    return size.shortestSide < 600;
  }

  int halfScreenWidth() {
    return (size.width / 2).round();
  }

  int halfScreenHeight() {
    return (size.height / 2).round();
  }
}
