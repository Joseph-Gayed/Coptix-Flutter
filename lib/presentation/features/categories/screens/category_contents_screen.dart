import 'package:coptix/presentation/model/ui_category.dart';
import 'package:coptix/presentation/model/ui_clip.dart';
import 'package:coptix/shared/widgets/clips_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/utils/navigation/app_router.dart';
import '../../../../../shared/utils/navigation/navigation_args.dart';
import '../../../../../shared/widgets/coptix_app_bar.dart';
import '../../../../../shared/widgets/coptix_container.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/dimens.dart';
import '../../error_screen/not_found_screen.dart';
import '../cubit/category_content_cubit.dart';

class CategoryContentsScreen extends StatefulWidget {
  final Map<String, dynamic> arguments;
  const CategoryContentsScreen({super.key, required this.arguments});

  @override
  State<CategoryContentsScreen> createState() => _CategoryContentsScreenState();

  static void openScreen(BuildContext context, UiCategory uiCategory) {
    Navigator.pushNamed(
      context,
      AppRouter.categoryContents,
      arguments: {NavArgsKeys.categoryArgs: uiCategory},
    );
  }
}

class _CategoryContentsScreenState extends State<CategoryContentsScreen> {
  late UiCategory uiCategory;
  late CategoryContentCubit cubit;

  @override
  void initState() {
    super.initState();
    uiCategory = widget.arguments[NavArgsKeys.categoryArgs];
    cubit = BlocProvider.of<CategoryContentCubit>(context);
    cubit.getCategoryContent(uiCategory.id, isFirstPage: true);
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
          child: BlocBuilder<CategoryContentCubit, CategoryContentState>(
            builder: (context, state) {
              return handleState(state);
            },
          ),
        ));
  }

  Widget handleState(CategoryContentState state) {
    switch (state.runtimeType) {
      case const (CategoryContentLoadingState):
        return const Center(
          child: CircularProgressIndicator(
            color: secondaryColor,
          ),
        );

      case const (CategoryContentErrorState):
        final errorState = state as CategoryContentErrorState;
        return NotFoundScreen(
          inputMessage: errorState.message,
          showAppBar: false,
        );

      case const (CategoryContentSuccessState):
      case const (CategoryContentPaginationSuccessState):
        final successState = state as CategoryContentSuccessState;
        return handleSuccessState(successState.uiCategoryContent.content);

      case const (CategoryContentPaginationLoadingState):
      case const (CategoryContentPaginationErrorState):
      default:
        return Container();
    }
  }

  Widget handleSuccessState(List<UiClip> content) {
    return ClipsGrid(clips: content);
  }
}
