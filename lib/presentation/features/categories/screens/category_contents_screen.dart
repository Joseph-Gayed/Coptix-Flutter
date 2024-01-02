import 'package:coptix/presentation/model/ui_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/utils/navigation/app_router.dart';
import '../../../../../shared/utils/navigation/navigation_args.dart';
import '../../../../../shared/widgets/coptix_app_bar.dart';
import '../../../../../shared/widgets/coptix_container.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../shared/cubit/paginated_content_state.dart';
import '../../../../shared/theme/dimens.dart';
import '../../../../shared/widgets/details_header/paginated_clips_grid.dart';
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

  static Widget withCubit({required Map<String, dynamic> arguments}) {
    return BlocProvider<CategoryContentCubit>(
        create: (context) => getIt(),
        child: CategoryContentsScreen(arguments: arguments));
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
              return PaginatedClipsGrid(
                paginatedContentState: state,
                onLoadMore: onLoadMore,
              );
            },
          ),
        ));
  }

  onLoadMore() {
    return cubit.canLoadMore() ? cubit.getCategoryContent(uiCategory.id) : null;
  }
}
