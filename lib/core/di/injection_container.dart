import 'package:coptix/core/network/dio_factory.dart';
import 'package:coptix/data/local/local_data_source.dart';
import 'package:coptix/data/remote/remote_data_source.dart';
import 'package:coptix/domain/usecase/foreget_password_usecase.dart';
import 'package:coptix/domain/usecase/get_categories_usecase.dart';
import 'package:coptix/domain/usecase/get_category_details_usecase.dart';
import 'package:coptix/domain/usecase/get_collections_usecase.dart';
import 'package:coptix/domain/usecase/home_usecase.dart';
import 'package:coptix/domain/usecase/login_usecase.dart';
import 'package:coptix/presentation/features/categories/cubit/category_details_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../data/local/local_data_source_impl.dart';
import '../../data/remote/remote_data_source_impl.dart';
import '../../data/repository/content_repository.dart';
import '../../domain/repository/content_repository.dart';
import '../../domain/usecase/signup_usecase.dart';
import '../../presentation/features/auth/common/cubit/auth_cubit.dart';
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
  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // Repository
  getIt.registerLazySingleton<ContentRepository>(() => ContentRepositoryImpl(
      remoteDataSource: getIt(), localDataSource: getIt()));

  // UseCases
  getIt.registerFactory<GetCategoriesUseCase>(
      () => GetCategoriesUseCase(getIt()));
  getIt.registerFactory<GetCollectionsUseCase>(
      () => GetCollectionsUseCase(getIt()));
  getIt.registerFactory<HomeUseCase>(() => HomeUseCase(getIt(), getIt()));
  getIt.registerFactory<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerFactory<SignupUseCase>(() => SignupUseCase(getIt()));
  getIt.registerFactory<ForgetPasswordUseCase>(
      () => ForgetPasswordUseCase(getIt()));
  getIt.registerFactory<GetCategoryDetailsUseCase>(
      () => GetCategoryDetailsUseCase(getIt()));

  // Bloc Cubit
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerFactory<VideoDetailsCubit>(() => VideoDetailsCubit(getIt()));
  getIt.registerFactory<SeriesDetailsCubit>(() => SeriesDetailsCubit(getIt()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt(), getIt(), getIt()));
  getIt.registerFactory<CategoryDetailsCubit>(
      () => CategoryDetailsCubit(getIt()));

  //Provider<LocalizationManager>
  /*getIt.registerSingleton<LocalizationManager>(LocalizationManager.instance);*/

  //AppLocalizations
  /*getIt.registerFactory<AppLocalizations>(
      () => AppLocalizations.of(rootNavigatorKey.currentContext!));*/
}
