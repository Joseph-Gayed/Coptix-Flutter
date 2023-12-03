import 'package:coptix/core/di/network_di.dart';
import 'package:coptix/features/home_landing/home/data/remote/home_remote_data_source_impl.dart';
import 'package:coptix/features/home_landing/home/data/repository/home_repository.dart';
import 'package:coptix/features/home_landing/home/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/home_landing/home/data/remote/home_remote_data_source.dart';
import '../../features/home_landing/home/domain/repository/home_repository.dart';

final getIt = GetIt.instance;
void initDi() {
  // Dio
  getIt.registerLazySingleton(() => NetworkDi().dioInstance);

  //dataSource
  getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(dio: getIt()));

  // Repository
  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: getIt()));

  // Bloc
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  //Provider<LocalizationManager>
  /*getIt.registerSingleton<LocalizationManager>(LocalizationManager.instance);*/

  //AppLocalizations
  /*getIt.registerFactory<AppLocalizations>(
      () => AppLocalizations.of(rootNavigatorKey.currentContext!));*/
}
