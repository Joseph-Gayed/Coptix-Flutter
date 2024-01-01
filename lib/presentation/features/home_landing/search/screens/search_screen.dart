import 'package:coptix/presentation/features/home_landing/search/cubit/search_cubit.dart';
import 'package:coptix/shared/extensions/context_ext.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection_container.dart';
import '../../../../../shared/cubit/paginated_content_state.dart';
import '../../../../../shared/theme/dimens.dart';
import '../../../../../shared/utils/localization/localized_content.dart';
import '../../../../../shared/widgets/clips_grid.dart';
import '../../../../model/ui_clip.dart';
import '../../../error_screen/not_found_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();

  static Widget withCubit() {
    return BlocProvider<SearchCubit>(
        create: (context) => getIt(), child: const SearchScreen());
  }
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchCubit cubit;
  String searchKeyword = "";
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<SearchCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    // Your Landing Screen implementation goes here
    return CoptixContainer(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.screenMarginH, vertical: Dimens.screenMarginV),
      child: BlocBuilder<SearchCubit, PaginatedContentState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              searchBar(),
              SizedBox(height: Dimens.screenMarginV),
              const Divider(color: primaryColor),
              SizedBox(height: Dimens.screenMarginV),
              Expanded(child: handleState(state)),
            ],
          );
        },
      ),
    );
  }

  Widget searchBar() {
    return TextField(
      controller: _searchController,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: LocalizationKey.searchHint.tr(),
        prefixIcon: const Icon(
          Icons.search,
          color: lightColor,
        ),
      ),
      onChanged: (value) {
        searchKeyword = value;
        cubit.search(searchKeyword);
      },
      onEditingComplete: () {
        searchKeyword = _searchController.text;
        cubit.search(searchKeyword);
      },
    );
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
        return NotFoundScreen(
          inputMessage: LocalizationKey.noContent.tr(),
          showAppBar: false,
        );
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
    if (cubit.canLoadMore()) {
      cubit.search(searchKeyword, isFirstPage: false);
    }
  }
}
