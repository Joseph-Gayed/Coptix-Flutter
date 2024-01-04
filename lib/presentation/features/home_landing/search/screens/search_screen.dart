import 'package:coptix/presentation/features/home_landing/search/cubit/search_cubit.dart';
import 'package:coptix/shared/theme/colors.dart';
import 'package:coptix/shared/utils/localization/app_localizations_delegate.dart';
import 'package:coptix/shared/widgets/coptix_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/injection_container.dart';
import '../../../../../shared/cubit/paginated_content_state.dart';
import '../../../../../shared/theme/dimens.dart';
import '../../../../../shared/utils/localization/localized_content.dart';
import '../../../../../shared/widgets/details_header/paginated_clips_grid.dart';

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
  // String searchKeyword = "";
  bool showClearButton = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<SearchCubit>(context);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
              // SizedBox(height: Dimens.halfScreenMarginV),
              const Divider(color: primaryColor),
              Expanded(
                  child: PaginatedClipsGrid(
                      paginatedContentState: state, onLoadMore: onLoadMore)),
            ],
          );
        },
      ),
    );
  }

  Widget searchBar() {
    return Row(
      children: [
        const BackButton(),
        Expanded(
          child: TextField(
            controller: _searchController,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: LocalizationKey.searchHint.tr(),
              prefixIcon: const Icon(
                Icons.search,
                color: lightColor,
              ),
              suffixIcon: showClearButton
                  ? Transform.rotate(
                      angle: 45 * 3.14159 / 180, // 45 degrees in radians
                      child: IconButton(
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: lightColor,
                        ),
                        onPressed: () {
                          _searchController.clear();
                          changeStateOfClearButton("");
                        },
                      ),
                    )
                  : null,
            ),
            onChanged: (value) {
              changeStateOfClearButton(value);
              cubit.search(_searchController.text);
            },
            onEditingComplete: () {
              changeStateOfClearButton(_searchController.text);
              cubit.search(_searchController.text);
            },
          ),
        ),
      ],
    );
  }

  void changeStateOfClearButton(String keyWord) {
    setState(() {
      showClearButton = keyWord.isNotEmpty;
    });
  }

  onLoadMore() {
    return cubit.canLoadMore()
        ? cubit.search(_searchController.text, isFirstPage: false)
        : null;
  }
}
