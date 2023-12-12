import 'package:coptix/core/network/dio_factory.dart';
import 'package:coptix/data/remote/remote_data_source.dart';
import 'package:coptix/domain/usecase/get_categories_usecase.dart';
import 'package:coptix/domain/usecase/get_collections_usecase.dart';
import 'package:coptix/domain/usecase/home_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../data/remote/remote_data_source_impl.dart';
import '../../data/repository/content_repository.dart';
import '../../domain/repository/content_repository.dart';
import '../../presentation/features/clip_details/cubit/video_details_cubit.dart';
import '../../presentation/features/home_landing/home/cubit/home_cubit.dart';
import '../../presentation/features/series_details/cubit/series_details_cubit.dart';
import '../network/network_info.dart';

final getIt = GetIt.instance;
void initDi() {
  //NetworkInfo instance
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // Dio
  getIt.registerLazySingleton(() => DioFactory().dioInstance);

  //dataSource
  getIt.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(dio: getIt(), networkInfo: getIt()));

  // Repository
  getIt.registerLazySingleton<ContentRepository>(
      () => ContentRepositoryImpl(remoteDataSource: getIt()));

  // UseCases
  getIt.registerFactory<GetCategoriesUseCase>(
      () => GetCategoriesUseCase(getIt()));
  getIt.registerFactory<GetCollectionsUseCase>(
      () => GetCollectionsUseCase(getIt()));
  getIt.registerFactory<HomeUseCase>(() => HomeUseCase(getIt(), getIt()));

  // Bloc Cubit
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerFactory<VideoDetailsCubit>(() => VideoDetailsCubit(getIt()));
  getIt.registerFactory<SeriesDetailsCubit>(() => SeriesDetailsCubit(getIt()));

  //Provider<LocalizationManager>
  /*getIt.registerSingleton<LocalizationManager>(LocalizationManager.instance);*/

  //AppLocalizations
  /*getIt.registerFactory<AppLocalizations>(
      () => AppLocalizations.of(rootNavigatorKey.currentContext!));*/
}
