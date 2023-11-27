import 'package:coptix/shared/extentsions/list.dart';
import 'package:coptix/shared/widgets/clips_grid.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../../shared/fake_data.dart';
import '../../../../shared/utils/navigation/navigation_args.dart';
import '../../../../shared/utils/navigation/navigation_routes.dart';
import '../../../../shared/widgets/coptix_container.dart';
import 'model/ui_collection.dart';

class CollectionScreen extends StatefulWidget {
  final String collectionId, collectionTitle;
  const CollectionScreen(
      {super.key, required this.collectionId, required this.collectionTitle});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();

  static void openScreen(BuildContext context, UiCollection uiCollection) {
    Navigator.pushNamed(
      context,
      AppRoutes.collection,
      arguments: {
        NavArgsKeys.idKey: uiCollection.id,
        NavArgsKeys.titleKey: uiCollection.title,
      },
    );
  }
}

class _CollectionScreenState extends State<CollectionScreen> {
  UiCollection? uiCollection;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.collectionTitle),
        ),
        body: CoptixContainer(
            child: ClipsGrid(clips: uiCollection?.clips ?? [])));
  }

  void getData() async {
    List<UiCollection> data =
        await FakeData.getHomeSectionsData(MyApp.getAppLanguage(context));
    setState(() {
      uiCollection = data.find((element) => element.id == widget.collectionId);
    });
  }
}
