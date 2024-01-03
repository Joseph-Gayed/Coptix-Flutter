import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  Widget wrapForTablet() {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(flex: 2, child: this),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    );
  }
}
