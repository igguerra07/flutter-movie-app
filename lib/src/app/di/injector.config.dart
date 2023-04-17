// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:movie_app/src/app/app_module.dart' as _i20;
import 'package:movie_app/src/app/features/cast/cast_module.dart' as _i17;
import 'package:movie_app/src/app/features/cast/datasources/datasources.dart'
    as _i4;
import 'package:movie_app/src/app/features/cast/repositories/repositories.dart'
    as _i5;
import 'package:movie_app/src/app/features/movies/datasources/datasources.dart'
    as _i11;
import 'package:movie_app/src/app/features/movies/movies_module.dart' as _i19;
import 'package:movie_app/src/app/features/movies/pages/details/details.dart'
    as _i8;
import 'package:movie_app/src/app/features/movies/pages/list/cubit/cubit.dart'
    as _i9;
import 'package:movie_app/src/app/features/movies/pages/search/cubit/movie_search_cubit.dart'
    as _i10;
import 'package:movie_app/src/app/features/movies/repositories/repositories.dart'
    as _i12;
import 'package:movie_app/src/app/features/movies/usecases/usecases.dart'
    as _i7;
import 'package:movie_app/src/app/features/videos/datasources/datasources.dart'
    as _i15;
import 'package:movie_app/src/app/features/videos/repositories/repositories.dart'
    as _i16;
import 'package:movie_app/src/app/features/videos/videos_module.dart' as _i18;
import 'package:movie_app/src/infra/api/api.dart' as _i3;
import 'package:movie_app/src/infra/cache/cache.dart' as _i14;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    final castModule = _$CastModule();
    final moviesModule = _$MoviesModule();
    final videosModule = _$VideosModule();
    gh.lazySingleton<_i3.ApiClient>(() => appModule.apiClient);
    gh.lazySingleton<_i3.ApiKeyInterceptor>(() => appModule.apiKeyInterceptor);
    gh.lazySingleton<_i4.CastRemoteDataSource>(() => castModule.castRemoteData);
    gh.lazySingleton<_i5.CastRepository>(() => castModule.castRepository);
    gh.lazySingleton<_i6.Dio>(() => appModule.dio);
    gh.factory<_i7.GetMovieDetailsUseCase>(
        () => moviesModule.getMovieDetailsUseCase);
    gh.factory<_i8.MovieDetailsCubit>(() => moviesModule.movieDetailsCubit);
    gh.factory<_i9.MoviePageCubit>(() => moviesModule.moviesPageCubit);
    gh.factory<_i10.MovieSearchCubit>(() => moviesModule.movieSearchCubit);
    gh.lazySingleton<_i11.MoviesRemoteDataSource>(() => moviesModule.remote);
    gh.lazySingleton<_i12.MoviesRepository>(() => moviesModule.moviesReposity);
    await gh.factoryAsync<_i13.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i14.ValueKeyStorage>(() => appModule.valueKeyStorage);
    gh.lazySingleton<_i15.VideosRemoteDataSource>(
        () => videosModule.videosRemoteDataSource);
    gh.lazySingleton<_i16.VideosRepository>(
        () => videosModule.videosRepository);
    return this;
  }
}

class _$CastModule extends _i17.CastModule {}

class _$VideosModule extends _i18.VideosModule {}

class _$MoviesModule extends _i19.MoviesModule {}

class _$AppModule extends _i20.AppModule {}
