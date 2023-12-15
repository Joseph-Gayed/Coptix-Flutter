import 'package:coptix/presentation/model/ui_category.dart';
import 'package:coptix/shared/widgets/clips_grid.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/utils/navigation/app_router.dart';
import '../../../../../shared/utils/navigation/navigation_args.dart';
import '../../../../../shared/widgets/coptix_app_bar.dart';
import '../../../../../shared/widgets/coptix_container.dart';

class CategoryScreen extends StatefulWidget {
  final Map<String, dynamic> arguments;
  const CategoryScreen({super.key, required this.arguments});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();

  static void openScreen(BuildContext context, UiCategory uiCategory) {
    Navigator.pushNamed(
      context,
      AppRouter.category,
      arguments: {NavArgsKeys.categoryArgs: uiCategory},
    );
  }
}

class _CategoryScreenState extends State<CategoryScreen> {
  late UiCategory uiCategory;

  @override
  void initState() {
    super.initState();
    uiCategory = widget.arguments[NavArgsKeys.categoryArgs];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CoptixAppBar(
          title: uiCategory.name,
          showingBackButton: true,
        ),
        body: const CoptixContainer(child: ClipsGrid(clips: [])));
  }
}
