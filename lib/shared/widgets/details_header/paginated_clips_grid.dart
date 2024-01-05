import 'package:coptix/shared/cubit/paginated_content_state.dart';
import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:flutter/material.dart';

import '../../../presentation/features/error_screen/error_or_empty_screen.dart';
import '../../../presentation/model/ui_clip.dart';
import '../../theme/colors.dart';
import '../clips_grid.dart';

class PaginatedClipsGrid extends StatelessWidget {
  final PaginatedContentState paginatedContentState;

  final Function? onLoadMore;
  const PaginatedClipsGrid(
      {super.key, required this.paginatedContentState, this.onLoadMore});

  @override
  Widget build(BuildContext context) {
    return handleState(context);
  }

  Widget handleState(BuildContext context) {
    switch (paginatedContentState.runtimeType) {
      case const (PaginatedContentLoadingState):
        return const Center(
          child: CircularProgressIndicator(
            color: secondaryColor,
          ),
        );

      case const (PaginatedContentErrorState):
        final errorState = paginatedContentState as PaginatedContentErrorState;
        return ErrorOrEmptyScreen(
          inputMessage: errorState.message,
          showAppBar: false,
        );

      case const (PaginatedContentSuccessState):
        final successState =
            paginatedContentState as PaginatedContentSuccessState;
        return handleSuccessState(
            context: context, content: successState.uiPaginatedContent.content);

      case const (PaginatedContentPaginationLoadingState):
        final successState =
            paginatedContentState as PaginatedContentPaginationLoadingState;
        return handleSuccessState(
            context: context,
            content: successState.uiPaginatedContent.content,
            showLoadMoreProgress: true);

      case const (PaginatedContentPaginationSuccessState):
        final successState =
            paginatedContentState as PaginatedContentPaginationSuccessState;
        return handleSuccessState(
            context: context, content: successState.uiPaginatedContent.content);

      case const (PaginatedContentPaginationErrorState):
        final paginationErrorState =
            paginatedContentState as PaginatedContentPaginationErrorState;
        context.showToast(message: paginationErrorState.message);

        return handleSuccessState(
            context: context,
            content: paginationErrorState.uiPaginatedContent.content);
      default:
        return ErrorOrEmptyScreen(
          inputSubTitle: LocalizationKey.noSearch.tr(),
          inputMessage: LocalizationKey.emptyContentMessage.tr(),
          icon: "icon_search_secondary.png",
          showAppBar: false,
        );
    }
  }

  Widget handleSuccessState(
      {required BuildContext context,
      required List<UiClip> content,
      bool showLoadMoreProgress = false}) {
    return ClipsGrid(
        clips: content,
        onLoadMore: onLoadMore,
        showLoadMoreProgress: showLoadMoreProgress);
  }
}
