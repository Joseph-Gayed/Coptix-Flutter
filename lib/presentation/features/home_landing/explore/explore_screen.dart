import 'package:coptix/presentation/features/home_landing/explore/explore_tab_view.dart';
import 'package:coptix/presentation/model/ui_category.dart';
import 'package:coptix/shared/theme/dimens.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/utils/localization/localized_content.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../shared/theme/colors.dart';
import '../../categories/cubit/categories_cubit.dart';
import '../../categories/cubit/categories_state.dart';
import '../../error_screen/error_or_empty_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();

  static withCubit() {
    return BlocProvider<CategoriesCubit>(
      create: (context) => getIt(),
      child: const ExploreScreen(),
    );
  }
}

class _ExploreScreenState extends State<ExploreScreen> {
  late CategoriesCubit cubit;
  UiCategory? selectedCategory;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<CategoriesCubit>(context);
    cubit.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    // Your Landing Screen implementation goes here
    return Scaffold(
      body: CoptixContainer(
        padding: EdgeInsets.symmetric(vertical: Dimens.screenMarginV),
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            return handleState(state);
          },
        ),
      ),
    );
  }

  Widget handleState(CategoriesState state) {
    switch (state.runtimeType) {
      case const (CategoriesLoadingState):
        {
          return const Center(
            child: CircularProgressIndicator(
              color: secondaryColor,
            ),
          );
        }

      case const (CategoriesErrorState):
        {
          return ErrorOrEmptyScreen(
            inputMessage: (state as CategoriesErrorState).message,
            showAppBar: false,
          );
        }

      case const (CategoriesSuccessState):
        {
          var successState = state as CategoriesSuccessState;
          if (successState.categories.isNotEmpty) {
            return handleSuccessState(successState);
          } else {
            return ErrorOrEmptyScreen(
              inputMessage: LocalizationKey.emptyContentMessage.tr(),
              showAppBar: false,
            );
          }
        }

      default:
        {
          return ErrorOrEmptyScreen(
            inputMessage: LocalizationKey.emptyContentMessage.tr(),
            showAppBar: false,
          );
        }
    }
  }

  Widget handleSuccessState(CategoriesSuccessState state) {
    var categories = state.categories;
    return ExploreTabView(
      categories: categories,
      selectedUiCategory: selectedCategory ?? categories[0],
      onCategorySelected: (uiCategory) {
        setState(() {
          selectedCategory = uiCategory;
        });
      },
    );
  }
}
