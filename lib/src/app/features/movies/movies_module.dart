// coverage:ignore-file
import 'package:injectable/injectable.dart';
import 'package:movie_app/src/app/di/injector.dart';
import 'package:movie_app/src/app/features/movies/pages/details/details.dart';
import 'package:movie_app/src/app/features/movies/pages/search/cubit/movie_search_cubit.dart';

import 'datasources/datasources.dart';
import 'pages/list/cubit/cubit.dart';
import 'repositories/repositories.dart';
import 'usecases/usecases.dart';

@module
abstract class MoviesModule {
  @lazySingleton
  MoviesRemoteDataSource get remote => MoviesRemoteDataSourceImpl(
        apiClient: getIt(),
      );

  @lazySingleton
  MoviesRepository get moviesReposity => MoviesRepositoryImpl(
        moviesRemoteDataSource: getIt(),
      );

  @injectable
  GetMovieDetailsUseCase get getMovieDetailsUseCase => GetMovieDetailsUseCase(
        castRepository: getIt(),
        videosRepository: getIt(),
      );

  @injectable
  MoviePageCubit get moviesPageCubit => MoviePageCubit(
        moviesRepository: getIt(),
      );

  @injectable
  MovieDetailsCubit get movieDetailsCubit => MovieDetailsCubit(
        getMovieDetailsUseCase: getIt(),
      );

  @injectable
  MovieSearchCubit get movieSearchCubit => MovieSearchCubit(
        moviesRepository: getIt(),
      );
}
