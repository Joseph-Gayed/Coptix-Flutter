import 'package:coptix/core/di/network_di.dart';
import 'package:coptix/data/remote/remote_data_source.dart';
import 'package:get_it/get_it.dart';

import '../../data/remote/remote_data_source_impl.dart';
import '../../data/repository/content_repository.dart';
import '../../domain/repository/content_repository.dart';
import '../../presentation/features/clip_details/cubit/video_details_cubit.dart';
import '../../presentation/features/home_landing/home/cubit/home_cubit.dart';

final getIt = GetIt.instance;
void initDi() {
  // Dio
  getIt.registerLazySingleton(() => NetworkDi().dioInstance);

  //dataSource
  getIt.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(dio: getIt()));

  // Repository
  getIt.registerLazySingleton<ContentRepository>(
      () => ContentRepositoryImpl(remoteDataSource: getIt()));

  // Bloc
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerFactory<VideoDetailsCubit>(() => VideoDetailsCubit(getIt()));

  //Provider<LocalizationManager>
  /*getIt.registerSingleton<LocalizationManager>(LocalizationManager.instance);*/

  //AppLocalizations
  /*getIt.registerFactory<AppLocalizations>(
      () => AppLocalizations.of(rootNavigatorKey.currentContext!));*/
}
