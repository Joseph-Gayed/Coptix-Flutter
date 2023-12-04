import 'package:coptix/shared/widgets/clips_grid.dart';
import 'package:flutter/material.dart';

import '../../../../shared/utils/navigation/navigation_args.dart';
import '../../../../shared/utils/navigation/app_router.dart';
import '../../../../shared/widgets/coptix_container.dart';
import 'model/ui_collection.dart';

class CollectionScreen extends StatefulWidget {
  final Map<String, dynamic> arguments;
  const CollectionScreen({super.key, required this.arguments});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();

  static void openScreen(BuildContext context, UiCollection uiCollection) {
    Navigator.pushNamed(
      context,
      AppRouter.collection,
      arguments: {NavArgsKeys.collectionArgs: uiCollection},
    );
  }
}

class _CollectionScreenState extends State<CollectionScreen> {
  late UiCollection uiCollection;

  @override
  void initState() {
    super.initState();
    uiCollection = widget.arguments[NavArgsKeys.collectionArgs];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(uiCollection.name),
        ),
        body: CoptixContainer(child: ClipsGrid(clips: uiCollection.clips)));
  }
}
