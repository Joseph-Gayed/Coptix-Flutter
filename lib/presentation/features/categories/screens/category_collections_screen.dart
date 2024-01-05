import 'package:coptix/presentation/features/categories/cubit/category_collections_cubit.dart';
import 'package:coptix/presentation/model/ui_category.dart';
import 'package:coptix/presentation/model/ui_collection.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/utils/localization/localized_content.dart';
import '../../../../shared/utils/navigation/app_router.dart';
import '../../../../shared/utils/navigation/navigation_args.dart';
import '../../../../shared/widgets/collections_widget_builder.dart';
import '../../../../shared/widgets/coptix_app_bar.dart';
import '../../../../shared/widgets/coptix_container.dart';
import '../../error_screen/error_or_empty_screen.dart';
import 'category_contents_screen.dart';

class CategoryCollectionsScreen extends StatefulWidget {
  final Map<String, dynamic> arguments;
  final bool showAppBar;
  const CategoryCollectionsScreen(
      {super.key, required this.arguments, this.showAppBar = true});

  @override
  State<CategoryCollectionsScreen> createState() =>
      _CategoryCollectionsScreenState();

  static void openScreen(BuildContext context, UiCategory uiCategory) {
    Navigator.pushNamed(
      context,
      AppRouter.categoryCollections,
      arguments: {NavArgsKeys.categoryArgs: uiCategory},
    );
  }

  static withCubit(
      {required Map<String, dynamic> arguments, bool showAppBar = true}) {
    return BlocProvider<CategoryCollectionsCubit>(
      create: (context) => getIt(),
      child: CategoryCollectionsScreen(
          arguments: arguments, showAppBar: showAppBar),
    );
  }
}

class _CategoryCollectionsScreenState extends State<CategoryCollectionsScreen> {
  late UiCategory uiCategory;

  late CategoryCollectionsCubit cubit;
  List<UiCollection>? collections;

  @override
  void initState() {
    super.initState();
    uiCategory = widget.arguments[NavArgsKeys.categoryArgs];
    cubit = BlocProvider.of<CategoryCollectionsCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    if (collections == null || collections!.isEmpty) {
      uiCategory = widget.arguments[NavArgsKeys.categoryArgs];
      cubit.getCategoryCollections(uiCategory.id);
    }

    return Scaffold(
        appBar: widget.showAppBar
            ? CoptixAppBar(
                title: uiCategory.name,
                showingBackButton: true,
              )
            : null,
        body: CoptixContainer(
          padding: EdgeInsets.symmetric(horizontal: Dimens.screenMarginH),
          child:
              BlocBuilder<CategoryCollectionsCubit, CategoryCollectionsState>(
            builder: (context, state) {
              return handleState(state);
            },
          ),
        ));
  }

  Widget handleState(CategoryCollectionsState state) {
    if (state is CategoryCollectionsLoadingState) {
      return const Center(
        child: CircularProgressIndicator(
          color: secondaryColor,
        ),
      );
    } else if (state is CategoryCollectionsErrorState) {
      return ErrorOrEmptyScreen(
        inputMessage: state.message,
        showAppBar: false,
      );
    } else if (state is CategoryCollectionsSuccessState) {
      return handleSuccessState(state.collections);
    }
    return Container();
  }

  Widget handleSuccessState(List<UiCollection> collections) {
    List<Widget> collectionWidgets =
        buildCollectionsWidgets(collections, onViewMoreClicked);

    if (collectionWidgets.isNotEmpty) {
      return CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: collectionWidgets.length,
              (BuildContext context, int index) {
                return collectionWidgets[index];
              },
            ),
          ),
        ],
      );
    } else {
      return ErrorOrEmptyScreen(
        inputMessage: LocalizationKey.emptyContentMessage.tr(),
        showAppBar: false,
      );
    }
  }

  void onViewMoreClicked(UiCollection uiCollection) {
    CategoryContentsScreen.openScreen(
        context, UiCategory(id: uiCollection.id, name: uiCollection.name));
  }
}
