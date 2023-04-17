import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/src/shared/errors/errors.dart';
import 'package:movie_app/src/app/features/movies/movies.dart';

class MoviesRepositoryMock extends Mock implements MoviesRepository {}

void main() {
  late MoviesRepository moviesRepositoryMock;
  late MoviePageCubit moviePageCubit;

  setUp(() {
    moviesRepositoryMock = MoviesRepositoryMock();
    moviePageCubit = MoviePageCubit(
      moviesRepository: moviesRepositoryMock,
    );
  });

  tearDown(() {
    moviePageCubit.close();
  });

  group("MoviesPageCubit |", () {
    group("getTrendingMovies | ", () {
      blocTest(
        "Should emits [MoviesPageLoadingState] [MoviesPageLoadedState] when to able get movies",
        build: () => moviePageCubit,
        act: (_) async {
          when(() => moviesRepositoryMock.getTrending())
              .thenAnswer((_) async => right([]));

          await moviePageCubit.getTrendingMovies();
        },
        expect: () => [
          isA<MoviesPageLoadingState>(),
          isA<MoviesPageLoadedState>(),
        ],
      );

      blocTest(
        "Should emits [MoviesPageLoadingState] [MoviesPageFailureState] when not to able get movies",
        build: () => moviePageCubit,
        act: (_) async {
          when(() => moviesRepositoryMock.getTrending())
              .thenAnswer((_) async => left(const AppFailure()));

          await moviePageCubit.getTrendingMovies();
        },
        expect: () => [
          isA<MoviesPageLoadingState>(),
          isA<MoviesPageFailureState>(),
        ],
      );
    });
  });
}
