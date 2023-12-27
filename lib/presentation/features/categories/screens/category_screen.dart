import 'package:coptix/presentation/features/categories/cubit/category_details_cubit.dart';
import 'package:coptix/presentation/model/ui_category.dart';
import 'package:coptix/presentation/model/ui_collection.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/theme/colors.dart';
import '../../../../shared/utils/localization/localized_content.dart';
import '../../../../shared/utils/navigation/app_router.dart';
import '../../../../shared/utils/navigation/navigation_args.dart';
import '../../../../shared/widgets/collections_widget_builder.dart';
import '../../../../shared/widgets/coptix_app_bar.dart';
import '../../../../shared/widgets/coptix_container.dart';
import '../../error_screen/not_found_screen.dart';

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

  late CategoryDetailsCubit cubit;

  @override
  void initState() {
    super.initState();
    uiCategory = widget.arguments[NavArgsKeys.categoryArgs];
    cubit = BlocProvider.of<CategoryDetailsCubit>(context);
    cubit.getCategoryDetails(uiCategory.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CoptixAppBar(
          title: uiCategory.name,
          showingBackButton: true,
        ),
        body: CoptixContainer(
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.screenMarginH, vertical: Dimens.screenMarginV),
          child: BlocBuilder<CategoryDetailsCubit, CategoryDetailsState>(
            builder: (context, state) {
              return handleState(state);
            },
          ),
        ));
  }

  Widget handleState(CategoryDetailsState state) {
    if (state is CategoryDetailsLoadingState) {
      return const Center(
        child: CircularProgressIndicator(
          color: secondaryColor,
        ),
      );
    } else if (state is CategoryDetailsErrorState) {
      return NotFoundScreen(
        inputMessage: state.message,
        showAppBar: false,
      );
    } else if (state is CategoryDetailsSuccessState) {
      return handleSuccessState(state.collections);
    }
    return Container();
  }

  Widget handleSuccessState(List<UiCollection> collections) {
    List<Widget> collectionWidgets = buildCollectionsWidgets(collections);

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
      return NotFoundScreen(
        inputMessage: LocalizationKey.noContent.tr(),
        showAppBar: false,
      );
    }
  }
}
