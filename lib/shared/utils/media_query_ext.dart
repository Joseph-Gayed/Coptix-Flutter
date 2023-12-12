import 'package:flutter/cupertino.dart';

extension MediaQueryExt on MediaQueryData {
  bool isTablet() {
    return size.shortestSide > 600;
  }
}
