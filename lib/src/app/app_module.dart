// coverage:ignore-file
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:movie_app/src/infra/api/api.dart';
import 'package:movie_app/src/infra/cache/cache.dart';

import 'di/injector.dart';

@module
abstract class AppModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @lazySingleton
  ValueKeyStorage get valueKeyStorage => SharedPrefsCache(
        sharedPreferences: getIt(),
      );

  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  ApiKeyInterceptor get apiKeyInterceptor => ApiKeyInterceptor();

  @lazySingleton
  ApiClient get apiClient => DioClient(
        dio: dio,
        interceptors: [getIt<ApiKeyInterceptor>()],
      );
}
