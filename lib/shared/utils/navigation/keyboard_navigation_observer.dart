import 'package:flutter/material.dart';

class KeyboardDismissRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _dismissKeyboard();
  }

  void _dismissKeyboard() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final focus = FocusManager.instance.primaryFocus;
      if (focus != null && focus.hasFocus) {
        focus.unfocus();
      }
    });
  }
}
