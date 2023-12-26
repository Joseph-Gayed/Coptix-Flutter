import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CoptixContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const CoptixContainer(
      {super.key, required this.child, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        margin: margin,
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
