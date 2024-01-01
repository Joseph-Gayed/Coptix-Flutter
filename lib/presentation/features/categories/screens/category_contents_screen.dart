import 'package:coptix/presentation/model/ui_category.dart';
import 'package:coptix/presentation/model/ui_clip.dart';
import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/widgets/clips_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/utils/navigation/app_router.dart';
import '../../../../../shared/utils/navigation/navigation_args.dart';
import '../../../../../shared/widgets/coptix_app_bar.dart';
import '../../../../../shared/widgets/coptix_container.dart';
import '../../../../shared/cubit/paginated_content_state.dart';
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
          padding: EdgeInsets.symmetric(horizontal: Dimens.screenMarginH),
          child: BlocBuilder<CategoryContentCubit, PaginatedContentState>(
            builder: (context, state) {
              return handleState(state);
            },
          ),
        ));
  }

  Widget handleState(PaginatedContentState state) {
    switch (state.runtimeType) {
      case const (PaginatedContentLoadingState):
        return const Center(
          child: CircularProgressIndicator(
            color: secondaryColor,
          ),
        );

      case const (PaginatedContentErrorState):
        final errorState = state as PaginatedContentErrorState;
        return NotFoundScreen(
          inputMessage: errorState.message,
          showAppBar: false,
        );

      case const (PaginatedContentSuccessState):
        final successState = state as PaginatedContentSuccessState;
        return handleSuccessState(
            content: successState.uiPaginatedContent.content);

      case const (PaginatedContentPaginationLoadingState):
        final successState = state as PaginatedContentPaginationLoadingState;
        return handleSuccessState(
            content: successState.uiPaginatedContent.content,
            showLoadMoreProgress: true);

      case const (PaginatedContentPaginationSuccessState):
        final successState = state as PaginatedContentPaginationSuccessState;
        return handleSuccessState(
            content: successState.uiPaginatedContent.content);

      case const (PaginatedContentPaginationErrorState):
        final paginationErrorState =
            state as PaginatedContentPaginationErrorState;
        context.showToast(message: paginationErrorState.message);

        return handleSuccessState(
            content: paginationErrorState.uiPaginatedContent.content);
      default:
        return Container();
    }
  }

  Widget handleSuccessState(
      {required List<UiClip> content, bool showLoadMoreProgress = false}) {
    return ClipsGrid(
        clips: content,
        onLoadMore: cubit.canLoadMore() ? loadMore : null,
        showLoadMoreProgress: showLoadMoreProgress);
  }

  loadMore() {
    cubit.getCategoryContent(uiCategory.id);
  }
}
