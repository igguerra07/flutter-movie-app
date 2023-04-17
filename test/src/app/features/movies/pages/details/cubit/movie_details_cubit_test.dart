import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/src/shared/errors/errors.dart';
import 'package:movie_app/src/app/features/movies/movies.dart';

class GetMovieDetailsUseCaseMock extends Mock
    implements GetMovieDetailsUseCase {}

void main() {
  late GetMovieDetailsUseCase getMovieDetailsUseCaseMock;
  late MovieDetailsCubit movieDetailsCubit;

  setUp(() {
    getMovieDetailsUseCaseMock = GetMovieDetailsUseCaseMock();
    movieDetailsCubit = MovieDetailsCubit(
      getMovieDetailsUseCase: getMovieDetailsUseCaseMock,
    );
  });

  tearDown(() {
    movieDetailsCubit.close();
  });

  group("MovieDetailsCubit |", () {
    group("getMoviesDetails | ", () {
      blocTest(
        "Should emits [MovieDetailsLoadingState] [MovieDetailsLoadedState] when to able get movie details",
        build: () => movieDetailsCubit,
        act: (_) async {
          const movie = Movie(
            id: 1,
            overview: "",
            backdropPath: "",
            popularity: 0.0,
            posterPath: "",
            releaseDate: "",
            title: "",
            voteAverage: 0.0,
          );
          const params = GetMovieDetailsUseCaseParams(movie: movie);
          const result = GetMovieDetailsUseCaseResult(
            movie: movie,
            cast: [],
            videos: [],
          );

          when(() => getMovieDetailsUseCaseMock(params))
              .thenAnswer((_) async => right(result));

          await movieDetailsCubit.getMovieDetails(movie);
        },
        expect: () => [
          isA<MovieDetailsLoadingState>(),
          isA<MovieDetailsLoadedState>(),
        ],
      );

      blocTest(
        "Should emits [MoviesPageLoadingState] [MoviesPageFailureState] when not to able get movie details",
        build: () => movieDetailsCubit,
        act: (_) async {
          const movie = Movie(
            id: 1,
            overview: "",
            backdropPath: "",
            popularity: 0.0,
            posterPath: "",
            releaseDate: "",
            title: "",
            voteAverage: 0.0,
          );
          const params = GetMovieDetailsUseCaseParams(movie: movie);
          when(() => getMovieDetailsUseCaseMock(params))
              .thenAnswer((_) async => left(const AppFailure()));

          await movieDetailsCubit.getMovieDetails(movie);
        },
        expect: () => [
          isA<MovieDetailsLoadingState>(),
          isA<MovieDetailsFailureState>(),
        ],
      );
    });
  });
}
