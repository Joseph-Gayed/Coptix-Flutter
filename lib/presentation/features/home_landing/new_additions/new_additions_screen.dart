import 'package:coptix/shared/fake_data.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/widgets/clips_grid.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';

import '../../../../presentation/model/ui_clip.dart';

class NewAdditionsScreen extends StatefulWidget {
  const NewAdditionsScreen({super.key});

  @override
  State<NewAdditionsScreen> createState() => _NewAdditionsScreenState();
}

class _NewAdditionsScreenState extends State<NewAdditionsScreen> {
  List<UiClip> clips = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // Your Landing Screen implementation goes here
    return Scaffold(
      body: CoptixContainer(
        padding: EdgeInsets.symmetric(
            horizontal: Dimens.halfScreenMarginH,
            vertical: Dimens.halfScreenMarginV),
        child: ClipsGrid(clips: clips),
      ),
    );
  }

  Future<void> getData() async {
    await Future.delayed(const Duration(seconds: 0));
    setState(() {
      clips = FakeData.newAdditions5Clips;
    });
  }
}
