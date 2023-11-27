import 'package:coptix/features/home_landing/home/presentation/model/ui_clip.dart';
import 'package:coptix/shared/extentsions/list.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../../shared/fake_data.dart';
import '../../../../shared/theme/dimens.dart';
import '../../../../shared/widgets/coptix_container.dart';
import 'item_default_image_card.dart';
import 'model/ui_collection.dart';

class CollectionScreen extends StatefulWidget {
  static const idKey = "id";
  static const titleKey = "title";
  final String collectionId, collectionTitle;
  const CollectionScreen(
      {super.key, required this.collectionId, required this.collectionTitle});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
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
        body: CoptixContainer(child: screenContent()));
  }

  Widget screenContent() {
    if (uiCollection != null && uiCollection!.clips.isNotEmpty) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0, // Space between columns
          mainAxisSpacing: 10.0, // Space between rows
          // childAspectRatio: 1.25 / 2
          childAspectRatio: NewAdditionsDimens.cardWidth /
              NewAdditionsDimens.cardHeight, // Adjust this ratio as needed
        ),
        itemCount: uiCollection!.clips.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: NewAdditionsDimens.cardHeight,
            child: ItemDefaultImageCard(
              uiClip: uiCollection!.clips[index],
              onItemClicked: onItemClicked,
            ),
          );
        },
      );
    } else {
      return const Center(child: Text("No Data"));
    }
  }

  void onItemClicked(UiClip uiClip) {}
  void getData() async {
    List<UiCollection> data =
        await FakeData.getHomeSectionsData(MyApp.getAppLanguage(context));
    setState(() {
      uiCollection = data.find((element) => element.id == widget.collectionId);
    });
  }
}
