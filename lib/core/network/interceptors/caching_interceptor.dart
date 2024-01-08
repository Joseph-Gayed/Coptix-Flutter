import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';

import '../../../shared/utils/constants.dart';
import '../app_bath_provider.dart';

DioCacheInterceptor getCachingEnabledInterceptor() {
  return DioCacheInterceptor(
    options: CacheOptions(
        store: HiveCacheStore(
          AppPathProvider.path,
          hiveBoxName: "coptix",
        ),
        policy: CachePolicy.forceCache,
        priority: CachePriority.high,
        hitCacheOnErrorExcept: [],
        keyBuilder: (request) {
          return request.uri.toString();
        },
        allowPostMethod: false,
        maxStale: const Duration(
          hours: cacheExpirationHours,
        )),
  );
}
